// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for (let i=0; i< grid.length; i++) {
    grid[i] = new Array(8);
  }
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  return grid;
}

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
  if ((pos[0] < 0) || (pos[0] > 7) || (pos[1] < 0) || (pos[1] > 7) ) {
    return false;
  } else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0]
  let y = pos[1]
  if (!this.isValidPos(pos)) {
    throw new Error("Not valid pos!");
  } else {
    return this.grid[x][y];
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if ((this.getPiece(pos) !== undefined) && (this.getPiece(pos).color === color)) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos) !== undefined) {
    return true;
  } else {
    return false;
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
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  let result = [] 
  let newPos = movePos(pos, dir)

  while (this.isValidPos(newPos) && (this.isOccupied(newPos))) {
        if (!this.isMine(newPos, color)) {
          result.push(newPos)
          newPos = movePos(newPos, dir)
        } else {
          return result;
        }
      }
  return [];
};

// const b = new Board();
// console.log(b._positionsToFlip([3,5], "white", [0,-1]))

function movePos (pos, dir) {
    let x = pos[0] + dir[0]
    let y = pos[1] + dir[1]
    
    return [x,y]
};


/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  // given a pos, check if not occupied
  // if occupied, return false
  // if not occupied, check if valid by looping through the directions and using the positionToFlip method, if PTF returns [], is not valid, otherwise, true
  if (this.isOccupied(pos)) {
    return false;
  }
  for (let i=0; i<Board.DIRS.length; i++) {
    if (this._positionsToFlip(pos, color, Board.DIRS[i]).length > 0) {
      return true;
    }
  };
  // Board.DIRS.forEach(dir => {
  //   if (this._positionsToFlip(pos, color, dir) !== []) {
  //     return true;
  //   }
  // });
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Invalid move!")
  }

  this.grid[pos[0]][pos[1]] = new Piece(color)
  let temp = []
  let posToFlip = []
  for (let i = 0; i < Board.DIRS.length; i++) {
    if ((this._positionsToFlip(pos, color, Board.DIRS[i])).length > 0) {
      posToFlip = posToFlip.concat(this._positionsToFlip(pos, color, Board.DIRS[i]));
    }
  }

  for (let j = 0; j < posToFlip.length; j++) {
    this.getPiece(posToFlip[j]).flip();
  }

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validPos = []
  for (let i=0; i<this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i,j], color)) {
        validPos.push([i,j]);
      }
    }
  }
  return validPos;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length > 0) {
    return true;
  }
  return false;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (!(this.hasMove("white")) && !(this.hasMove("black"))) {
    return true;
  }
  return false;
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE



// Board.prototype._positionsToFlip = function (pos, color, dir, piecesToFlip) {
//     // let result = []
//     // let temp = []

//     // Board.DIRS.forEach(dir => {
//     //   // save pos, keep then reset after we find nothing, go on to next dir
//     //   let newPos = this.movePos(pos, dir)

//     //   while (this.isValidPos(newPos)) {
//     //     if (!this.isMine(newPos, color)) {
//     //       temp.push(this.getPiece(newPos))
//     //       newPos = this.movePos(pos, dir)
//     //     } else {
//     //       result.concat(temp);
//     //       break;

//     //     }
//     //   }

//     //   temp = []
//     // });

//     // return result;
// };
