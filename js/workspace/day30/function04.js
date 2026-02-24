// 4번 : 즉시 실행함수

(function () {
  console.log("javascript 수업");
})();

let result = (function (num1, num2){
  return num1 + num2;
})(10, 20);
console.log(result);

// 모듈패턴(private scope)
const Counter = (function () {
  let count = 0;
  return{
    increment:function(){
      count++;
      return count;
    },
    decrement:function(){
      count--;
      return count;
    },
  };
})();

//count : 은닉화 -> 직접 변경 불가(모듈패턴)
console.log(Counter.increment());
console.log(Counter.increment());
console.log(Counter.increment());