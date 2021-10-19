Array.prototype.myEach = function(cb) {
  for(let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

const cb = (el) => {
  return el*2;
}

// const callback = (el) => {
//   console.log(`this is ${el}`);
// }

// console.log(cb(2))
// console.log([1, 2, 3].myEach(cb));

Array.prototype.myMap = function(callback) {
  let result = [];
  this.myEach(el => {
    result.push(callback(el));
  });
  return result;
}

// console.log([1, 2, 3].myMap(cb));