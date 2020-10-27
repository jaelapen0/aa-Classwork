
function Animal(name) {
    this.name = name;
};

function Surrogate() {};

Surrogate.prototype = Animal.prototype;

Cat.prototype = new Surrogate();

Cat.prototype.constructor = Cat;