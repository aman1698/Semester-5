var menu={
	'chocolate':10,
	'bread':5
}
var price1=0;

function price(){

	var array=document.getElementsByTagName('input');
	for(var i=0;i<array.length;i++){
		var ob=array[i];
             var key=ob.getAttribute('name');
             var value=Number(ob.value);
             price1=price1+value*menu[key];

	}
	
	alert(price1);
	price1=0;
}
