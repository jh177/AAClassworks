import React from "react";
import {Link} from 'react-router-dom'

class Greeting extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    const {currentUser, logout} = this.props
    // debugger
    const display = currentUser ? (
      <div>
        <h3>Welcome {currentUser.username}!</h3>
        <button onClick={()=>logout()}>Log Out</button>
      </div>
    ) : (
      <div>
        <Link to="/signup">Sign Up</Link>
        <br />
        <Link to="/login">Log In</Link>
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