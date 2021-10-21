class Clock {
  constructor() {
    // 1. Create a Date object.
    const currentTime = new Date();
    
    // 2. Store the hours, minutes, and seconds.
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();

    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
    // setInterval(this._tick, 1000);
    // setInterval(function () { this._tick(); }, 1000)
  }

  printTime() {
    // Format the time in HH:MM:SS
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Use console.log to print it.
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes += 1;
    }
    if (this.minutes === 60) {
      this.minutes = 0;
      this.hours += 1;
    }
    if (this.hours === 24) {
      this.hours = 0;
    }
    // 2. Call printTime.
    // console.log(this);
    this.printTime();
  }
}

//const { ReadStream } = require("fs");
// const clock = new Clock();

// addNumbers

const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0){
    rl.question("Enter a number: ", answer => {
      sum += parseInt(answer);
      console.log(sum);
      // numsLeft -= 1
      addNumbers(sum, numsLeft - 1, completionCallback)
    });
  } else {
    completionCallback(sum);
    rl.close();
  }

  }

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));