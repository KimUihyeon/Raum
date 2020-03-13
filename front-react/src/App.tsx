import React from 'react';
import logo from './logo.svg';
import { BrowserRouter as Router, Route } from "react-router-dom";
import './App.css';
import { AdminSite } from "./containers/root/AdminSite";
import { UserSite } from "./containers/root/UserSite"
import { Header, Body, Footer } from './containers/layout/';

function App() {
  return (
    <div>
      <Header></Header>
      <Body></Body>
      <Footer></Footer>
    </div>
  );
}

export default App;
