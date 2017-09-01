// simple Timeout - asynchronous
// Run in DevTools
window.setTimeout(() => alert('HAMMER TIME'), 5000);

// Timeout plus closure
function hammerTime (time){
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, time);
}
// ES6
function hammerTime (time){
  window.setTimeout(() => alert(`${time} is hammertime!`), time);
}

// Tea and biscuits
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like tea?', (res1) => {
    console.log(`You replied ${res1}.`);

    reader.question('Would you like biscuits', (res2) => {
      console.log(`You replied ${res2}.`);

      const first = (res1 === 'yes' ) ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'dont\'t';

      console.log(`So you ${first} want tea, and you ${second} want biscuits.`);
      reader.close();
    });
  });
}
