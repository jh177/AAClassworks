import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import * as Test from "./util/session_api_util"

document.addEventListener("DOMContentLoaded", ()=>{
  const store = configureStore();
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, root);


  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.login = Test.postSession
});