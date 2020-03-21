import React, { useState, useEffect } from "react";
import './App.css';
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { Header, Body, Footer } from './containers/layout/';
import { MenuItem, ComponentItem } from './data/Interfacies' 
import { axiosUtil } from "./util/AxiosUtile";
import userComponents from "./containers/user";

function App() {
  const [menuItems, setMenuItems] = useState<MenuItem[]>();

  let handleClick = () => {

    axiosUtil.get("/api/v1/system/menus").then(res=>{
      setMenuItems(res.data);
    })
    
  }


  let [componentDatas , setComponentDatas] = useState<ComponentItem[]>();
  let handle_click2 = () =>{
      axiosUtil.get('/api/v1/system/components').then(res=>{
          setComponentDatas(res.data);
      });
  }

  
  return (
    <div>
      <Header menuItems={menuItems}></Header>
      <Body menuItems={componentDatas}></Body>
      <Footer></Footer>
      <button type="button" onClick={handleClick} ></button>
      <button onClick={handle_click2}></button>
    </div>
  );
}

export default App;
