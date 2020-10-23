let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
 
  let grid = new Array(8);

  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }
  // debugger
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece ('black');
  grid[3][3] = new Piece ('white');
  grid[4][4] = new Piece ('white');

  return grid;
};

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  // let [row, col] = pos;
  // var [a, b, c, d] = [0, 1, 2, 3]
  if ((pos[0] >= 0 && pos[0] <= 8) && (pos[1] >= 0 && pos[1] <= 8)) {
    return true;
  } else {
    return false;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
    let [x,y] = pos
  if (this.isValidPos(pos)){
    return this.grid[x][y];
  } else {
    throw new Error('Not valid pos!');
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let [x, y] = pos;

  if (this.grid[x][y] == null) {
    return false;
  } 

  return this.grid[x][y].color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let [x, y] = pos;
  if (this.grid[x][y] == null) {
    return false;
  } else {
    return true;
  }
};
/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */

Board.prototype._positionsToFlip = function (pos, color, dir, piecesToFlip) {
  if (!piecesToFlip) {
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);
  }
  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!this.isValidPos(nextPos)) {
    return [];
  } else if (!this.isOccupied(nextPos)) {
    return [];
  } else if (this.isMine(nextPos, color)) {
    return piecesToFlip.length == 0 ? [] : piecesToFlip;
  } else {
    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
  }
};


/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }

  for(let i = 0; i < Board.DIRS.length; i++){
    const pieces = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (pieces.length){
      return true;
    } 

  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw new Error('Not valid move!');
  };

 let pieces = []

  for (let i = 0; i < Board.DIRS.length; i++) 
  {
    pieces.push(this._positionsToFlip(pos, color, Board.DIRS[i]));
  };
  
  pieces = pieces.flat();
  debugger;
  // const pieces = pieces.flat();
  for (i = 0; i < pieces.length; i++) {
    // if (pieces[i].color === "white") {
    //   pieces[i].color = "black";
    // }
    // else if (pieces[i].color === "black") {
    //   pieces[i].color = "white";
    // 
    this.getPiece(pieces[i]).flip();
  };
 
};

// Board.prototype.placePiece = function (pos, color) {
//   if (!this.validMove(pos, color)) {
//     throw new Error('Invalid move!');
//   }
 
//   let positionsToFlip = [];
//   for (let dirIdx = 0; dirIdx < Board.DIRS.length; dirIdx++) {

//     positionsToFlip = positionsToFlip.concat(
//       this._positionsToFlip(pos, color, Board.DIRS[dirIdx]) || []
//     );
//   }

//   for (let posIdx = 0; posIdx < positionsToFlip.length; posIdx++) {
//     this.getPiece(positionsToFlip[posIdx]).flip();
//   }

//   this.grid[pos[0]][pos[1]] = new Piece(color);
// };
/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;

b = Board.new();

b.placePiece();