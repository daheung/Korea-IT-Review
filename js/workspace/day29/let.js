//5번 : let 키워드
// console.log(data2, typeof(data2), typeof data2);
// ReferenceError: Cannot access 'data2' before initialization

let data1 = 'let변수';
let data2 = 10;
// console.log(data1, typeof(data1), typeof data1);
// console.log(data2, typeof(data2), typeof data2);

// let data2 = 100;
data2 = '안녕';
// console.log(data2, typeof data2);

// 호이스팅은 자바스크립트에서 변수와 함수 선언을 코드의 최상단으로 끌어올리는 것을 의미한다
// 코드를 실행하기 전에 변수, 함수등의 선언이 메모리에 저장되기 때문에 가능하다

// var로 선언된 변수는 선언과 동시에 undefined로 초기화 되고 이후에 실제 값(초기화 값)으로 할당된다
// 따라서 var로 선언된 변수는 선언 전에도 접근이 가능하며 undefined의 값을 가진다

// let과 const는 호이스팅은 되지만 초기화는 되지 않는다
// 초기화 전에 접근하려고하면 참조에러(ReferenceError)가 발생한다
// 그 이유는 let, const는 선언이 코드의 실행 흐름에 도달했을때 초기화 되기 때문이다

let data = 10;
data = data || 1;
console.log(`Data 값 : ${data}`)
console.log(`Conditional 값 : ${data || 1}`)
console.log(`Conditional 값 : ${data | 1}`)
