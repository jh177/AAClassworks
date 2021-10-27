/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

class FollowToggle {
  constructor(el){
    console.log(this);
    console.log(el);
    // console.log(el.dataset);
    this.userId = el.dataset.userId;
    this.followState = el.dataset.initialFollowState;
    // console.log(this.userId);
    // console.log(this.followState);
    this.element = el;
    this.render();
  }

  render() {
    if (this.followState === false) {
      this.element.textContent = "Follow!";
    } else {
      this.element.textContent = "Unfollow!";
    }
  }
}

module.exports = FollowToggle;


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
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
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js")

$(function (){
  $('.follow-toggle').each((idx, element) => {
    new FollowToggle(element);
  })
})

const callConstructor = () => {
  //call follow toggle construcor on all the buttons
  $('.follow-toggle').each((idx, element) => {
      new FollowToggle(element);
    })
  // let buttons = document.querySelectorAll(".follow-toggle");
  // buttons.forEach(el => {
  //   new FollowToggle(el);
  // })
};

$(callConstructor)
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map