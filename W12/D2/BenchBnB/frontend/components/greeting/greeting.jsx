import React from "react";
import {Link} from 'react-router-dom'

class Greeting extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    const {currentUser, logout} = this.props
    const display = currentUser ? (
      <div>
        <h3>Welcome {currentUser.username}!</h3>
        <button onClick={logout}>Logout</button>
      </div>
    ) : (
      <div>
        <Link to="/signup">Sign Up</Link>
        <Link to="/signin">Sign In</Link>
      </div>
    );

    return (
      <div>
        {display}
      </div>
    )
  }
}

export default Greeting;