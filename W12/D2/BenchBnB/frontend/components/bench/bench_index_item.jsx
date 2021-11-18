import React from "react";

class BenchIndexItem extends React.Component {
  constructor(props){
    super(props)
  }

  render(){
    const {bench} = this.props
    return (
      <li>
        <span>{bench.description}</span>
      </li>
    )
  }
}

export default BenchIndexItem