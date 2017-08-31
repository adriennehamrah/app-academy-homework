// mystery scoping
function mysteryScoping1() { // in block, in block
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() { // in block, out of block
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() { // SyntaxError: Identifier 'x' has already been declared
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() { // in block, out of block
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() { // SyntaxError: Identifier 'x' has already been declared
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."
const madLib = (verb, adj, noun) => {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
}

// > isSubstring("time to program", "time")
// true
//
// > isSubstring("Jump for joy", "joys")
// false
const isSubstring = (searchString, subString) => {
  return searchString.includes(subString);
}

// fizzBuzz, divisible by either 3 or 5, but not both
const fizzBuzz = (array) => {
  const arr = [];
  array.forEach(el => {
    if ( (el % 3 === 0) ^ (el % 5 === 0)) {
      arr.push(el);
    }
  });

  return arr;
}

// isPrime, assume number is positive integer
const isPrime = (num) => {
  if (num < 2) { return false; }

  for (let i = 2; i < num; i++ ) {
    if (num % i === 0) { return false; }
  }

  return true;
}

// sumOfPrimes, returns the sum of the first n prime numbers

const sumOfPrimes = (n) => {
  let sum = 0;
  let count = 0;
  let i = 2

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count ++
    }
    i++;
  }
  
  return sum;
}
