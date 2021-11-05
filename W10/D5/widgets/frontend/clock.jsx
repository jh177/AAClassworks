import React from 'react';

class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = {
     time: new Date()
    }
    this.tick = this.tick.bind(this);
  }

  tick(){
    this.setState({time: new Date()}); 
  }

  componentDidMount(){
    //Function is run after component renders intially
    //Use setinterval to call tick every second 
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.intervalId);
  }

  render(){
    return (
     <div> 
       <h1 className="clock">Clock </h1>
       <a className="clock"> {this.state.time.getFullYear()}-{this.state.time.getMonth() + 1}-{this.state.time.getDate()}</a>
        <a className="clock"> {this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</a>
     </div>
    );
  }

}

export default Clock;