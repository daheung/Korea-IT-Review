// 12번 : 배열1

// 1. 배열 생성
//1) 배열 리터럴 대괄호 사용한 배열 생성
let arr1 = [];
// console.log(arr1, typeof arr1);

arr1[0] = 10;
arr1[1] = '가나다';
arr1[2] = true;
// console.log(arr1, typeof arr1); //[ 10, '가나다', true ] object

let arr2 = [100, 0.5, '안녕', ['a', 'b', 'c']];
// console.log(arr2, typeof arr2); //[ 100, 0.5, '안녕' ] object
// console.log(`배열의 길이 : ${arr1.length}`);
// console.log(`배열의 길이 : ${arr2.length}`);
// 배열의 길이 : 3
// 배열의 길이 : 4

//2) 배열크기를 지정한 배열생성(콤마 개수만큼 배열 생성)
let arr3 = [, , , ,];
console.log(arr3, typeof arr3);
console.log(`배열의 길이 : ${arr3.length}`);
// [ <4 empty items> ] object
// 배열의 길이 : 4
arr3[5] = 10;
console.log(arr3);
//[ <5 empty items>, 10 ]
arr3[10] = 100;
console.log(arr3);
//[ <5 empty items>, 10, <4 empty items>, 100 ]

//2. Array() 생성자 함수로 배열 생성
let arr4 = new Array();
console.log(arr4, arr4.length, typeof arr4); //[] 0 object
arr4[0] = '사과';
arr4[1] = '체리';
arr4[2] = '복숭아';
console.log(arr4, arr4.length); //[ '사과', '체리', '복숭아' ] 3

//1) Array() 생성자 함수로 초기값 할당
let arr5 = new Array('0번째 인덱스', 1, true);
console.log(arr5, typeof arr5); //[ '0번째 인덱스', 1, true ] object

//2) Array() 생성자 함수로 칸 수 지정(숫자 1개)
let arr6 = new Array(5);
console.log(arr6, typeof arr6, arr6.length); //[ <5 empty items> ] object 5

//3. 배열 순회시 사용할 수 있는 반복문
let arr7 = ['a', 'b', 'c', 'd'];
//1) for ... in
for(let i in arr7){
  // console.log(i, typeof i); //i는 인덱스, typeof i 각 요소의 타입
  console.log(arr7[i], typeof arr7[i]);
}
// 0 string
// 1 string
// 2 string
// 3 string

// a string
// b string
// c string
// d string

//2) for ... of
for(let j of arr7){
  console.log(j);
}
// a
// b
// c
// d