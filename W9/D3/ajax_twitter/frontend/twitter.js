const FollowToggle = require("./follow_toggle.js")

//----wrap in ajax function----
// $(function (){
//   $('.follow-toggle').each((idx, element) => {
//     new FollowToggle(element);
//   })
// })

var followToggleArr = [];

const callConstructor = () => {
  //call follow toggle construcor on all the buttons
  $('.follow-toggle').each((idx, element) => {
      followToggleArr.push(new FollowToggle(element));
    })
  // let buttons = document.querySelectorAll(".follow-toggle");
  // buttons.forEach(el => {
  //   new FollowToggle(el);
  // })
};

$(callConstructor)

const setEventListeners = () => {
  $('.follow-toggle').on('click', e=>{
      e.preventDefault();

      let target = e.target
      let theToggle;
      followToggleArr.forEach(el => {
        if (el.element===target) {theToggle = el}
      })

      theToggle.handleClick(e);
    })
}

$(setEventListeners)