import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import * as SessionApiUtil from './util/session_api_util'

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("root");
  const store = configureStore();
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);

  window.getState = store.getState;
  window.dispatch = store.dispatch;
});