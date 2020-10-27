/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements:  */
/***/ (() => {

eval("throw new Error(\"Module parse failed: Assigning to rvalue (48:0)\\nYou may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders\\n| }\\n| \\n> Game.prototype.wrap(pos) = function(){\\n|     \\n| }\");\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\n// const Util = {\nfunction GameView (ctx){\n    this.game = new Game();\n    this.ctx = ctx;\n    // const canvasEl = document.getElementById('game-canvas');\n    // const ctx = canvasEl.getContext('2d');\n}\n\nGameView.prototype.start = function(){\n// debugger\nsetInterval(()=> {\n    //  debugger\n        this.game.moveObjects();\n        this.game.draw(this.ctx);\n    }, 50);\n\n    \n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
eval("// const MovingObject = require(\"./moving_object.js\");\n// const Asteroid = require(\"./asteroid.js\");\n// const Game = require(\"./game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\ndocument.addEventListener('DOMContentLoaded', () => {\n    const canvasEl = document.getElementById('game-canvas');\n\n    canvasEl.width = 500;\n    canvasEl.height = 500;\n\n    const ctx = canvasEl.getContext('2d');\n\n    ctx.fillStyle = 'black';\n    ctx.fillRect(0, 0, 500, 500);\n    \n\n    // const mo = new MovingObject({\n    //     pos: [30, 30],\n    //     vel: [10, 10],\n    //     radius: 5,\n    //     color: \"#00FF00\"\n    // });\n    const gameview = new GameView(ctx);\n    gameview.start();\n    // // const game = new Game();\n    // // game.draw(ctx); \n  \n    \n\n    // mo.draw(ctx);\n    \n    // window.mo = mo;\n    // window.ctx = ctx;\n    \n    // // ctx.clearRect(0, 0, canvas.width, canvas.height);\n    // // //debugger\n    // // mo.move();\n    // // move.draw(ctx);\n    const ast = new Asteroid ({\n        pos: [90, 120]\n    });\n\n\n    // window.ast = ast;\n    ast.draw(ctx);\n});\n\n\n// setInterval(game.draw(), 1);\n// window.MovingObject = MovingObject;\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;