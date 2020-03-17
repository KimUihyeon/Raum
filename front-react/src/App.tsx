import React, { useState, useEffect } from "react";
import './App.css';
import { Header, Body, Footer } from './containers/layout/';
import { MenuItem } from './data/Interfacies' 
import { axiosUtil } from "./util/AxiosUtile";

function App() {
  const [menuItems, setMenuItems] = useState<MenuItem[]>();

  let handleClick = () => {

    axiosUtil.data("/api/v1/system/menus").then(res=>{
      setMenuItems(res.data);
    })
    
  }

  
  return (
    <div>
      <Header menuItems={menuItems}></Header>
      <Body menuItems={menuItems}></Body>
      <Footer></Footer>
      <button type="button" onClick={handleClick} ></button>
    </div>
  );
}

export default App;
