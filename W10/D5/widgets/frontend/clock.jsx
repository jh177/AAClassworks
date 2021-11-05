import React from 'react';

class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = {
     time: new Date()
    }
    this.tick.bind(this);
    this.setState.bind(this);
  }

  tick(){
    this.setState({time: new Date()}); 
  }

  componentDidMount(){
    //Function is run after component renders intially
    //Use setinterval to call tick every second 
    setInterval(this.tick, 1000);
  }

  render(){
    return (
     <div> 
       <h1>Clock </h1>
        {this.state.time.toLocaleString()}
     </div>
    );
  }

}

export default Clock;