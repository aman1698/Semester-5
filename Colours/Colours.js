var obj={
	 'name':['Arial','Georgia','Impact'],
	 'color':['red','yellow','green']

}

var tag=document.getElementById('first');
var tag1=document.getElementById('second');

tag.style.fontFamily=obj['name'][0];
tag.style.color=obj['color'][2];

tag1.style.fontFamily=obj['name'][1];
tag1.style.color=obj['color'][0];

