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
