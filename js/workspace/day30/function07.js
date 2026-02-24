// 8번 : 재귀함수

function factorial(n){
  //재귀함수의 종료 조건
  if ( n === 0 ){
    return 1;
  } 
  //재귀호출 : n * (n-1) 팩토리얼
  return n * factorial(n - 1);
}

console.log(factorial(3)); //6

// 재귀함수를 이용한 문자열 뒤집기
// hello -> olleh 출력
// 함수명 : reverseStr

//1) 순수 재귀와 인덱스 사용
function reverseStr(str, index=0){
  //종료조건 : 모든 문자를 처리했을  때
  if(index === str.length) {
    return "";
  }

  return reverseStr(str, index + 1) + str[index];

}

console.log(reverseStr("hello")); //olleh

//작동과정
// reverseStr("hello", 0) => (hello, 1) + "h"
// reverseStr("hello", 1) => (hello, 2) + "e" + "h"
// reverseStr("hello", 2) => (hello, 3) + "l" + "e" + "h"
// reverseStr("hello", 3) => (hello, 4) + "l" + "l" + "e" + "h"
// reverseStr("hello", 4) => (hello, 5) + "o" + "l" + "l" + "e" + "h"

//2) slice 사용 : 첫 문자를 제거한 새로운 문자열 반환, 새로운 문자열 매번 생성
function reverseStr1(str){
  //종료조건
  if (str === "" || str.length === 1){
    return str;
  }

  //문자열 하나씩 처리
  return resverseStr1(str.slice(1)) + str[0];
}

//3) substr 사용 : 오래된 메소드, slice나 substring 사용 권장
function reverseStr2(str){
  //종료조건
  if(str === "" || str.length === 1){
    return str;
  }
  //substring(1) : 첫번째 문자열을 제거하고 나머지 문자열 반환
  return reverseStr2(str.substr(1)) + str[0];
}