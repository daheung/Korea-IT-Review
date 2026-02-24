// for문 사용 금지, map/filter 사용해서 해결
const users = [
  {id : 1, name : "짱구", age : 5, score : 80},
  {id : 2, name : "철수", age : 5, score : 90},
  {id : 3, name : "유리", age : 5, score : 70},
  {id : 4, name : "훈이", age : 5, score : 85},
  {id : 5, name : "맹구", age : 5, score : 60}
];

// 1. 모든 사용자 이름만 담은 배열 생성 names
const userNameArr = users.map(value => value.name);
console.log(userNameArr);

// 2. 모든 사용자 나이만 담은 배열 생성 ages 
const userAgeArr = users.map(value => value.age);
console.log(userAgeArr);

// 3. 각 사용자를 아래 형태로 변환
//  [결과예시]
// [ {name : "짱구", score : 80}, {name : "철수", score : 90}, ..]
const userArr = users.map((value) => {
  return {
    name : value.name,
    score: value.score
  }
});
console.log(userArr);

//4. 점수가 75점 이상인 사용자만 추출
// [결과예시]
// 이름, 이름, 이름
const userArrOver75 = users
  .filter(value => value.score >= 75)
  .map(value => value.name);
console.log(userArrOver75);

//5. 점수가 80점 이상인 사용자 이름만 추출
// [결과예시]
// [이름, 이름, 이름]
const userArrOver80 = users
  .filter(value => value.score >= 75)
  .map(value => value.name);
console.log(userArrOver80);

//6. 합격 여부 추가-점수가 80점 이상이면 pass :true, 아니면 pass : false
const newUserArr = users.map((value) => {
  return {
    ...value,
    pass: value.score >= 80
  }
});
console.log(newUserArr);

//7. 최고 점수 사용자의 이름과 점수 추출
// const bestScoreUser = users.filter(value => {
  // return value.score === Math.max(...users.map(value => value.score));
// });
const bestScoreUser = users.reduce((prev, cur) => {
  return prev.score > cur.score ?
    prev : cur;
});
console.log({
  name : bestScoreUser.name,
  score: bestScoreUser.score
});