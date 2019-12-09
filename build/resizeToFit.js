
function textNodesUnder(node){
  var all = [];
  for (node=node.firstChild;node;node=node.nextSibling){
    if (node.nodeType==3) all.push(node);
    else all = all.concat(textNodesUnder(node));
  }
  return all;
}

function textNodesUnder(node){
  var all = [];
  for (node=node.firstChild;node;node=node.nextSibling){
    if (node.nodeType==3) all.push(node);
    else all = all.concat(textNodesUnder(node));
  }
  return all;
}

function removeDuplicateDomElements( ele ){
	var out = [];
	for( var i=0; i < ele.length; i++){
		var isNew = true;
		for(var j=0; j < out.length; j++){
			if( ele[i].isSameNode( out[j] )){
				isNew = false;
			}
		}
		if( isNew){
			out.push(ele[i]);
		}
	}
	return out;
}

function textNodesParentSet(node){
  var all = [];
  var nodes = textNodesUnder(node);
  for (var i = 0; i < nodes.length ; i++){
    all.push( nodes[i].parentElement )
  }
  return removeDuplicateDomElements( all );
}

function shrinkPage( k ){
  var pageElem = document.querySelector(".page-wrapper")
  textNodesParentSet(pageElem).forEach( elem => {
    elem.style.fontSize = parseFloat( window.getComputedStyle(elem)["font-size"].slice(0, -2) ) * k + "px"
  })
  document.querySelectorAll("img").forEach( elem => {
	  elem.height = elem.height * k;
	  elem.width  = elem.width  * k;
  })
}

//var pageElem = document.querySelector(".page-wrapper")

//shrinkPage(0.975)

//$(document).ready(function() {
//  return autoSizeText();
//});

//var elem = textNodesUnder(document.querySelector(".page-wrapper"))[5].parentElement

//window.getComputedStyle(elem)["font-size"]
//window.getComputedStyle(document.querySelector(".body-inner"))["overflow"]
//window.getComputedStyle(document.querySelector(".body-inner"))["overflow"].scrollHeight

var scrollBarElement = ".body-inner"
var scrollBarElement = ".page-wrapper"
var scrollBarElement = ".body-inner"
var scrollBarElement = ".book-body"

var scrollBarElements = [".book-body",".body-inner"]


var shrinkCt = 0
var maxShrink = 16

function isTooSmall(){
	if(shrinkCt >= maxShrink){
		return false;
	} else {
		var isTooSmall = false;
   		for(var i = 0; i < scrollBarElements.length;i++){
			if(document.querySelector(scrollBarElements[i]).scrollHeight > document.querySelector(scrollBarElements[i]).clientHeight){
				isTooSmall = true;
			}
		}
		return isTooSmall;
	}
}

var shrinkToFit = function(){
  //if(  document.querySelector(scrollBarElement).scrollHeight == document.querySelector(scrollBarElement).clientHeight ) {
  //  while( document.querySelector(scrollBarElement).scrollHeight == document.querySelector(scrollBarElement).clientHeight ){
  //    shrinkPage(1.01)
  //  }
  //}

  while( isTooSmall() ){
    shrinkPage(0.975)
    shrinkCt = shrinkCt+1
  }
}

//document.querySelector(scrollBarElement).scrollHeight

//document.querySelector(scrollBarElement).clientHeight
//window.onresize = onResize
maxShrink = 16

//shrinkToFit()

window.onresize = shrinkToFit

//elem.style.fontSize = parseFloat( window.getComputedStyle(elem)["font-size"].slice(0, -2) ) * 0.975 + "px"

$(document).ready( function() { shrinkToFit() });