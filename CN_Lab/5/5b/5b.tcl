set ns [new Simulator]

set traceFile [open 1.tr w]
$ns trace-all $traceFile
set namFile [open 1.nam w]
$ns namtrace-all $namFile

proc finish {} {
	global ns namFile traceFile
	
	$ns flush-trace
	close $traceFile	
	close $namFile
	

	exec awk -f stats.awk 1.tr &
	exec nam 1.nam &
	exit 0
}

for {set i 0} {$i < 7} {incr i} {
	set n($i) [$ns node]
}

$ns duplex-link $n(0) $n(2) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(2) 1Mb 10ms DropTail
$ns simplex-link $n(2) $n(3) 0.3Mb 100ms DropTail
$ns simplex-link $n(3) $n(2) 0.3Mb 100ms DropTail

set lan [$ns newLan "$n(3) $n(4) $n(5) $n(6)" 0.5Mb 40ms LL Queue/DropTail MAC/Csma/Cd Channel]

$ns duplex-link-op $n(0) $n(2) orient right-down
$ns duplex-link-op $n(1) $n(2) orient right-up
$ns simplex-link-op $n(2) $n(3) orient right
$ns simplex-link-op $n(3) $n(2) orient left

set TCPAgent [new Agent/TCP/Newreno]
$TCPAgent set fid_ 1
$TCPAgent set packetSize_ 552
$ns attach-agent $n(0) $TCPAgent

set TCPSink [new Agent/TCPSink/DelAck]
$ns attach-agent $n(4) $TCPSink
$ns connect $TCPAgent $TCPSink

set ftp [new Application/FTP]
$ftp attach-agent $TCPAgent

set UDPAgent [new Agent/UDP]
$ns attach-agent $n(1) $UDPAgent
$UDPAgent set fid_ 2


set nullsink [ new Agent/Null]
$ns attach-agent $n(6) $nullsink
$ns connect $UDPAgent $nullsink

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $UDPAgent
$cbr set type_ CBR
$cbr set packetSize_ 1000
$cbr set rate_ 0.05Mb
$cbr set random_ false


$ns at 0.0 "$n(0) label TCP_Traffic"
$ns at 0.0 "$n(1) label UDP_Traffic"
$ns at 0.3 "$cbr start"
$ns at 0.8 "$ftp start"
$ns at 7.0 "$ftp stop"
$ns at 7.5 "$cbr stop"
$ns at 8.0 "finish"

$ns run

