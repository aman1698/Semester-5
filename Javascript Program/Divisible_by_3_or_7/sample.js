function test()
{
    x=document.getElementById("firstNumber").value
    if(x%3==0 || x%7==0)
        document.getElementById("result").innerHTML=true;
    else
        document.getElementById("result").innerHTML=false;
        
}