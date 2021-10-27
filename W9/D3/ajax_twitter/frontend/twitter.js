const FollowToggle = require("./follow_toggle.js")

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