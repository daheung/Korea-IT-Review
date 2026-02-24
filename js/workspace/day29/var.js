//4번 : var 키워드
console.log(data2, typeof data2, typeof(data2)); //undefined undefined undefined

var data1 = '10';
var data2 = 10;

console.log(data1, typeof data1, typeof(data1));
console.log(data2, typeof data2, typeof(data2));

var data2 = 'var변수';
console.log(data2, typeof data2);

// 호이스팅(hoisting) : 선언의 위치에 상관없이 존재하면 메모리에 할당된다
// 초기화 작업은 호이스팅 되지 않고 선언만 호이스팅된다
console.log(age, typeof age);

var age = 20;
console.log(age, typeof age);