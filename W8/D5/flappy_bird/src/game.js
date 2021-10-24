import Level from "./level";

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  animate(level){
    level.animate(level.drawBackground(this.ctx));
  }

  restart(){
    this.level = new Level(this.dimensions);
    this.animate(this.level);
  }
  
}