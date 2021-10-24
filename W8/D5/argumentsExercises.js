function sum() {
  let arg = Array.from(arguments);
  let sum = 0
  arg.forEach(num => {
    sum += num;
  })
  return sum;
}

function sum(...args) {
  let sum = 0
  args.forEach(num => {
    sum += num;
  })
  return sum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);



Function.prototype.myBind = function(context) {
  let boundArgs = Array.from(arguments).slice(1);
  let that = this
  return function() {
    let callArgs = Array.from(arguments);
    let allArgs = boundArgs.concat(callArgs)
    //arguments would be the args for the first scope
    that.apply(context, allArgs)
  }
}

Function.prototype.myBind = function(context, ...boundArgs) {
  return (...callArgs) => {
    let allArgs = boundArgs.concat(callArgs)
    //arguments would be the args for the first scope
    this.apply(context, allArgs)
  }
}


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true


function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}


// curriedSum
function curriedSum(numArgs) {
  let numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  }
}

const summer = curriedSum(4);
console.log(summer(5)(30)(20)(1)); // => 56

// console.log(sumThree(4, 20, 6)); // == 30

Function.prototype.curry = function(argNum) {
  let args = [];
  let that = this;
  return function _functionPrep(arg) {
    args.push(arg);
    if (args.length === argNum) {
      return that(...args);
    } else {
      return _functionPrep;
    }
  }
}
// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// console.log(f1 = f1(4)); // [Function]
// console.log(f1 = f1(20)); // [Function]
// console.log(f1 = f1(6)); // = 30

// // or more briefly:
// console.log(sumThree.curry(3)(4)(20)(6)); // == 30