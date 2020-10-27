const Asteroid = require('./asteroid.js')

const CONSTANTS = {
    DIM_X: 500, 
    DIM_Y: 500, 
    NUM_ASTEROIDS: 10
}

function Game(){
    this.dim_x = CONSTANTS.DIM_X,
    this.dim_y = CONSTANTS.DIM_Y,
    this.num_asteroids = CONSTANTS.NUM_ASTEROIDS,
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids= function(){
    for(let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++){
        a = new Asteroid(Game.prototype.randomPosition())
        this.asteroids.push(a);
    }
}

Game.prototype.randomPosition = function () {
    let randomX = Math.floor(Math.random() * CONSTANTS.DIM_X)
    let randomY = Math.floor(Math.random() * CONSTANTS.DIM_Y)
    let pos = [randomX, randomY];
    return pos;
}

Game.prototype.draw = function(ctx){ 
    ctx.clearRect(0, 0, 500, 500);
    ctx.fillStyle = 'black';
    ctx.fillRect(0, 0, 500, 500);
    for(let i=0; i < this.asteroids.length; i++)
    {
        this.asteroids[i].draw(ctx);
    }
}

Game.prototype.moveObjects = function(){
    for (let i =0; i< this.asteroids.length; i++){
        this.asteroids[i].move();
    }
    
}

Game.prototype.wrap(pos) = function(){
    
}
module.exports = Game;