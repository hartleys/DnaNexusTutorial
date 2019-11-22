



var coll = document.querySelectorAll("code:not(.sourceCode)");
var i;

var buttons = [];

for (var i = 0; i < coll.length; i++) {
  var cc = coll[i];
  //#cc.ELEMS_CONTENT = cc.nextElementSibling;
  //#cc.ELEMS_CONTENT.style.display === "none"
  var parentCodeExecBlock = cc.parentElement.previousElementSibling
  if( parentCodeExecBlock.classList.contains("sourceCode") ){
    cc.style.display = "none"
    cc.classList.add("sourceOutputBox");
    cc.classList.add("sourceOutputBox2");
    cc.classList.add("sourceOutputBox3");
    cc.classList.add("sourceOutputBox4");
    cc.classList.add("sourceOutputBox5");

    buttonElem = document.createElement("button");
    buttonElem.classList.add("sourceOutputButton");  
    buttonElem.innerText = "(Show Output)";
    buttonElem.outBlock = cc;
    buttonElem.outPre = cc.parentElement;
    buttonElem.codeBlock = parentCodeExecBlock.getElementsByClassName("sourceCode")[0];
    cc.parentElement.insertBefore(buttonElem,cc);
    buttons[i] = buttonElem;
  
    cc.parentElement.parentElement.removeChild(cc.parentElement);
    buttonElem.codeBlock.appendChild(document.createElement("br"));
    buttonElem.codeBlock.appendChild(buttonElem);
    buttonElem.codeBlock.appendChild(buttonElem.outBlock);

    //buttonElem.classList.add("active");
    buttonElem.addEventListener("click", function() {
        this.classList.toggle("active");
        if(this.classList.contains("active")) {
          this.outBlock.style.display = "block";
          this.innerText = "(Hide Output)";
        } else {
          this.outBlock.style.display = "none";
          this.innerText = "(Show Output)";
        }
    });
  }
}
