import React from 'react'
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { Main } from '../user/Main';

type BodyProps = {
    match: any,
}

export function Body() {

    return (
        <div>
            <Route path='/' component={Main}></Route> 
            <Route path='/info' component={Main}></Route> 
            <Route path='/showroom' component={Main}></Route> 
            <Route path='/object' component={Main}></Route> 
            <Route path='/custom' component={Main}></Route> 
            <Route path='/test' component={Main}></Route> 
        </div>
    )
}