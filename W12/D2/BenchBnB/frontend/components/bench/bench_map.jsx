import React from "react";
import MarkerManager from "../../util/marker_manager";

class BenchMap extends React.Component{
  constructor(props){
    super(props)
  }

  componentDidMount(){
    const mapOptions = {
      center: { lat: 34.05920252121212, lng: -118.41919468559252},
      zoom: 13
    };
    this.map=new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches)
  }

  componentDidUpdate(){
    this.MarkerManager.updateMarkers(this.props.benches)
  }

  render(){

    return (
      <div id='map-container' ref={map => this.mapNode = map}>
      {/* <div id='map-container' ref='map'> */}
      </div>
    )
  }
}

export default BenchMap