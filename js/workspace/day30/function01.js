const printNumFunc = function (number) {
  num = !(number % 2)
    ? number + 10
    : number;
  
  console.log(`조정된 값 : ${num}`)
}

printNumFunc(21);

const squareFunc = function (x) {
  return x * x;
}