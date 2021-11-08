import React from 'react';

class Weather extends React.Component{
  constructor(props){
    super(props);
    this.state = {weather:null}
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.getWeather);
    console.log(this.state.weather)
  }

  getWeather(location){
    let url = "api.openweathermap.org/data/2.5/weather?"
    let lat = location.coords.latitude;
    let lon = location.coords.longitude;
    const apiKey = "5d91c82f88f31632a21b5d939c716a58";
    url = `${url}lat=${lat}&lon=${lon}&appid=${apiKey}`;
    url = "api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=5d91c82f88f31632a21b5d939c716a58"
    
    console.log(url)
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
      if (xmlhttp.readyState === XMLHttpRequest.DONE) {
        if (xmlhttp.status === 200) {
          const data = JSON.parse(xmlhttp.responseText);
          this.setSteate({weather:data});
        }
      }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
  }

  render(){
    return (
      <div>
        <h1>Weather</h1>
        <div className='weather'>
          {this.state.weather}
        </div>
      </div>
    );
  }
}


export default Weather;
