import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";

const Root = () =>{
  let tabs=[{ title: "tab1", content: "this is tab1 content" },
    { title: "tab2", content: "this is tab2 content" },
    { title: "tab3", content: "this is tab3 content" }];

  return (
    <div>
      <Clock/>
      <Tabs tabs={tabs}/>
      <Weather/>
    </div>
  )

}

export default Root;