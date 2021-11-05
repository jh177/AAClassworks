import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './frontend/clock'; 

window.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<div id="root"/>, document.getElementById("main"));
  ReactDOM.render(<Clock />, document.getElementById("root")); 
})