const printInfoFunc1 = function (name, age) {
  console.log(`name : ${name}, age : ${age}`);
}

const printInfoFunc2 = (name, age) => {
  console.log(`name : ${name}, age : ${age}`);
}

printInfoFunc1("Yugwang", 22);
printInfoFunc2("Yugwang", 22);  