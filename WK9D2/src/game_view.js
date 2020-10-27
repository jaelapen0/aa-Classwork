const Game = require('./game.js');

// const Util = {
function GameView (ctx){
    this.game = new Game();
    this.ctx = ctx;
    // const canvasEl = document.getElementById('game-canvas');
    // const ctx = canvasEl.getContext('2d');
}

GameView.prototype.start = function(){
// debugger
setInterval(()=> {
    //  debugger
        this.game.moveObjects();
        this.game.draw(this.ctx);
    }, 50);

    
}

module.exports = GameView;