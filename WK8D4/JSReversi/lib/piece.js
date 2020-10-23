/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color;
};

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    this.color === "white" ? "black" : "white";
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    if (this.color === 'white') {
        this.color = 'black';
    }else {
        this.color = 'white';
    }
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    if (this.color === 'white'){
        // Symbol('W');
        return 'W';
    }else{
        // Symbol('B');
        return 'B';
    }
};

module.exports = Piece;

