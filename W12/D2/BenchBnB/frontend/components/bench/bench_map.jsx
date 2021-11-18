import React from "react";

class BenchMap extends React.Component{
  constructor(props){
    super(props)
  }

  componentDidMount(){
    const mapOptions = {
      center: { lat: 34.05920252121212, lng: -118.41919468559252},
      zoom: 13
    };
    this.map=new google.maps.Map(this.mapNode, mapOptions)
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