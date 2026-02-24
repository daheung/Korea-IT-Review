const boxClick = document.querySelector("#click");
const boxOver = document.querySelector("#over");
const boxOut = document.querySelector("#out");
const boxOverOut = document.querySelector("#over-out");

console.log(boxClick);
console.log(boxOver);
console.log(boxOut);
console.log(boxOverOut);

function changeBgGreen(){
  this.setAttribute("style", "background-color:green");
  console.log(this);
}

boxClick.addEventListener("click", changeBgGreen);