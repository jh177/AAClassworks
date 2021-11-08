import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

const Root = () =>{
  let tabs=[{ title: "tab1", content: "this is tab1" },
  { title: "tab2", content: "this is tab2" },
  { title: "tab3", content: "this is tab3" }];

  return (
    <div>
      <Clock/>
      <Tabs tabs={tabs}/>
    </div>
  )

}

export default Root;