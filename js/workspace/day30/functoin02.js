// 2번 : 익명함수

let printAll = function (num){
  console.log(num);
};

printAll(100);
printAll(5);

// 매개변수로 전달한 값이 짝수라면 +10한 값을 출력
// 아니라면 전달된 값만 출력
// result 변수, 익명함수

//1) let 변수명 = function(num) 익명함수 정의 매개변수 1개
//2) if~else문
//  if  타입 number고 2로 나눈 나머지가 0이라면 === , 매개변수 + 10
//  else 매개변수 출력
// let result = function (num){
//   if(num % 2 === 0 && typeof num === 'number'){
//     console.log(num+10);
//   }else{
//     console.log(num);
//   }
// }
// result(10); //20
// result('10'); //10
// result(5); //5

// let square = function (x){
//   return x * x;
// }

// console.log(square(10)); //100

setTimeout(function(){
  console.log("2초뒤 출력");
}, 2000);