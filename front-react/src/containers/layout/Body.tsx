import React from 'react'
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { MenuItem } from '../../data/Interfacies';
import userComponents from "../user";

type BodyProps = {
    menuItems : MenuItem[] | undefined
}


export function Body({...bodyProps} : BodyProps) {

    let listToComponents = bodyProps.menuItems?.map((t,i)=>{
        let component = userComponents[t.name];
        return (
            <div key={i}></div>
        )
    });

    return (
        <div>
            {listToComponents}
        </div>
    )
}