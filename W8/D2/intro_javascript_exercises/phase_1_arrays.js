Array.prototype.uniq = function() {
  let r = []
  for (let i = 0; i < this.length; i++ ) {
    // if (r.includes(this[i])) {
    if (r.indexOf(this[i]) === -1) {
      r.push(this[i]);
    }
  }
  return r;
};

// console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function() {
  let pairs = []
  
}