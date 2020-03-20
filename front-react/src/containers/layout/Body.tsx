import React from 'react'
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { MenuItem } from '../../data/Interfacies';
import userComponents from "../user";

type BodyProps = {
    menuItems : MenuItem[] | undefined
}


export function Body({...bodyProps} : BodyProps) {

    console.log('Body 다시 랜더됨')
    let jwt : string = '';
    
    let listToComponents = bodyProps.menuItems?.map((t,i)=>{
        let component = userComponents[t.name];
        return (
            <div key={i}></div>
        )
    });

    return (
        <div>
            <Route path='/' exact={true} component={userComponents.ConsultingMain}/>
            <Route path='/' exact={true} component={userComponents.ConsultingFaQ}/>
            <Route path='/' exact={true} component={userComponents.ConsultingAS}/>
            <Route path='/' exact={true} component={userComponents.Custom}/>
            <Route path='/' exact={true} component={userComponents.InfoMain}/>
            <Route path='/' exact={true} component={userComponents.InfoStory}/>
            <Route path='/' exact={true} component={userComponents.InfoFactory}/>
        </div>
    )
}