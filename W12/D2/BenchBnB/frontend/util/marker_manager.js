
export default class MarkerManager {
  constructor(map){
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches){
    benches.forEach(bench=> this.createMarkerFromBench(bench))
  }

  createMarkerFromBench(bench){
    const latLng = { lat: bench.lat, lng: bench.lng}
    let marker = new google.maps.Marker({
      position: latLng,
      map: this.map,
      benchId: bench.id
    })
    this.markers[bench.id]=marker
  }
}

