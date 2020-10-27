// const MovingObject = require("./moving_object.js");
// const Asteroid = require("./asteroid.js");
// const Game = require("./game.js");
const GameView = require("./game_view.js");
document.addEventListener('DOMContentLoaded', () => {
    const canvasEl = document.getElementById('game-canvas');

    canvasEl.width = 500;
    canvasEl.height = 500;

    const ctx = canvasEl.getContext('2d');

    ctx.fillStyle = 'black';
    ctx.fillRect(0, 0, 500, 500);
    

    // const mo = new MovingObject({
    //     pos: [30, 30],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "#00FF00"
    // });
    const gameview = new GameView(ctx);
    gameview.start();
    // // const game = new Game();
    // // game.draw(ctx); 
  
    

    // mo.draw(ctx);
    
    // window.mo = mo;
    // window.ctx = ctx;
    
    // // ctx.clearRect(0, 0, canvas.width, canvas.height);
    // // //debugger
    // // mo.move();
    // // move.draw(ctx);
    const ast = new Asteroid ({
        pos: [90, 120]
    });


    // window.ast = ast;
    ast.draw(ctx);
});


// setInterval(game.draw(), 1);
// window.MovingObject = MovingObject;