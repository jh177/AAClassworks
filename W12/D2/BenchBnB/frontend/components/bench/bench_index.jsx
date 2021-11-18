import React from "react";
import BenchIndexItem from "./bench_index_item";


class BenchIndex extends React.Component{
  constructor(props){
    super(props)
  }

  componentDidMount(){
    this.props.fetchBenches();
  }

  render(){
    const benchItems = this.props.benches.map((bench) => (
      <BenchIndexItem key={bench.id} bench={bench} />
    ))

    return (
      <ul>{benchItems}</ul>
    )
  }
}

export default BenchIndex;

