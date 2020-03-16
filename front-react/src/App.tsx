import React, { useState, useEffect } from "react";
import logo from './logo.svg';
import { BrowserRouter as Router, Route } from "react-router-dom";
import './App.css';
import { AdminSite } from "./containers/root/AdminSite";
import { UserSite } from "./containers/root/UserSite"
import { Header, Body, Footer } from './containers/layout/';
import { menus  } from './data/TempDatabases';
import { MenuItem } from './data/Interfacies'
import { Convert } from './util/Converter'
import axios from "axios";

function App() {  
  const [menuItems, setMenuItems] = useState<MenuItem[]>();

  useEffect(() => {

    // TODO : 서버터져요!
    // TODO : 서버터져요!
    axios.get('http://localhost:8080/api/v1/system/menus').then(res=>{
      let data = Convert.toMenuItems(res.data);
      setMenuItems(data);
    });
  }, [menuItems]);
  //let menuItems = Convert.toMenuItems(menus);




  return (
    <div>
      <Header menuItems={menuItems}></Header>
      <Body menuItems={menuItems}></Body>
      <Footer></Footer>
    </div>
  );
}

export default App;
