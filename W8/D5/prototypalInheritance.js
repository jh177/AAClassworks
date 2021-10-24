Function.prototype.inherits = function(parentObj){
  function Surrogate() {};
  Surrogate.prototype = parentObj.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

Function.prototype.inherits = function(parentObj){
  this.prototype = Object.create(parentObj.prototype)
  this.prototype.constructor = this;
}





function MovingObject (name) {this.name = name}
MovingObject.prototype.move = function() {
  console.log(this.name + " is moving");
}

function Ship (name) {this.name = name}
Ship.inherits(MovingObject);

Ship.prototype.float = function() {
  console.log(this.name + " is floating");
}

function Asteroid (name) {this.name = name}
Asteroid.inherits(MovingObject);

Asteroid.prototype.attack = function() {
  console.log(this.name + " will destroy");
}

const s = new Ship("Titanic");

const a = new Asteroid("PacMan");

s.move();
s.float();
// s.attack();

a.move();
a.attack();
// a.float();

