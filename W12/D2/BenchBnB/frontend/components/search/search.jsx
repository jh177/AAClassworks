import React from "react";
import BenchIndex from "../bench/bench_index";
import BenchMap from "../bench/bench_map";

class Search extends React.Component{
  constructor(props){
    super(props)
  }


  render(){
    return (
      <div>
        <BenchMap/>
        <BenchIndex benches={this.props.benches} 
          fetchBenches={this.props.fetchBenches}/>
      </div>
    )
  }
}

export default Search;