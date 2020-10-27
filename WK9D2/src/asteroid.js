const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

const DEFAULTS={
    color: 'grey',
    radius: 10, 
    length: 10
}


function Asteroid(position){
    this.pos = position;
    this.vel = Util.randomVec(DEFAULTS.length);
    this.radius = DEFAULTS.radius;
    this.color = DEFAULTS.color;
    
};
new Asteroid({ pos: [30, 30] });

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;

