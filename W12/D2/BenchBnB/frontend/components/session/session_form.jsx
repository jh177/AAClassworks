import React from "react";

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  handleInput(type){
    return (e) => {
      this.setState({[type]: e.target.value})
    }
  }

  render(){
    const {formType, link} = this.props
    const title =  (formType==="signup") ? "Sign Up" : "Log in"
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          {title}
          {link}
          <label>Username:
            <input 
              type="text"
              value={this.state.username}
              onChange={this.handleInput('username')}  
            />
          </label>

          <label>Password:
            <input
              type="password"
              value={this.state.password}
              onChange={this.handleInput('password')}
            />
          </label>
          <button>Submit</button>
        </form>
      </div>
    )
  }
  
}

export default SessionForm;