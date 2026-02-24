//11번 : 프로토타입
// new 뒤에 나오는 생성자를 자바스크립트에서는 프로토타입이라고 부른다
// 프로토타입은 함수로 선언하여 사용한다
// 단, 반드시 대문자로 시작해야한다

// 생성자 함수
function User(id, pw, name, age, subject='javascript'){
  this.id = id; //새 객체의 id 프로퍼티
  this.pw = pw;
  this.name = name;
  this.age = age;
  this.subject = subject;
  //this는 생성된 객체를 참조한다
  // 각 속성은 생성된 객체의 속성이 된다
}

//생성자 함수로 생성된 모든 객체는 공유된 프로토타입 객체를 가진다
//프로토타입의 객체를 사용하면 공통 메소드나 속성을 공유할 수 있다

user1 = new User('test1', 'qwer1234', '짱구', 5);
console.log(user1, typeof user1);
// User {
//   id: 'test1',
//   pw: 'qwer1234',
//   name: '짱구',
//   age: 5,
//   subject: 'javascript'
// } object

const user2 = {
  id : 'test2',
  pw : '1234',
  name : '철수',
  age : 5,
  subject : 'java'
};
console.log(user2, typeof user2); //{ id: 'test2', pw: '1234', name: '철수', age: 5, subject: 'java' } object

//클래스
class User1{
  constructor(id, pw, name, age, subject){
    this.id = id; //새 객체의 id 프로퍼티
    this.pw = pw;
    this.name = name;
    this.age = age;
    this.subject = subject;
  }
}

const user3 = new User1('test3', 'test1234', '유리', 5, '자바스크립트');
console.log(user3, typeof user3);
// User1 {
//   id: 'test3',
//   pw: 'test1234',
//   name: '유리',
//   age: 5,
//   subject: '자바스크립트'
// } object
