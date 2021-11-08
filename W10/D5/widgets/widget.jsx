import ReactDOM from 'react-dom';
import React from 'react';
import Root from './frontend/root'

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root />, main);
})