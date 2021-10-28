class FollowToggle {
  constructor(el){
    // console.log(this);
    // console.log(el);
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

  handleClick(e) {
    e.preventDefault();
    if (!this.followState) {
      this.followState = true;
      this.render();
      console.log("created")
      return $.ajax({
        method: "POST",
        url: `/users/${this.userId}/follow`,
        data: {
          followee_id: this.userId
        }
      })
    } else {
      this.followState = false;
      this.render();
      console.log("deleted")
      return $.ajax({
        method: "DELETE",
        url: `/users/${this.userId}/follow`
      })
    }
  }


}

module.exports = FollowToggle;
