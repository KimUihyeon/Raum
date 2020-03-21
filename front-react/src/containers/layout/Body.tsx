import React , { useState } from 'react'
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { MenuItem, ComponentItem } from '../../data/Interfacies';
import userComponents from "../user";
import { axiosUtil } from '../../util/AxiosUtile';

type BodyProps = {
    menuItems : ComponentItem[] | undefined
}


export function Body({...bodyProps} : BodyProps) {

    console.log('Body 다시 랜더됨')
    let jwt : string = '';
    
    let listToComponents = bodyProps.menuItems?.map((t,i)=>{

        console.log(`${t.componentName} -> ${t.urls.join("\t\t")}` );
        let component = userComponents[t.componentName];
        return (
            <div key={i}>
                <Route path={t.urls} exact={t.exact} component={component}/>
            </div>
        )
    });

    console.log(listToComponents);


    return (
        <div>
            <Route path='/showroom:type' component={userComponents.ShowRoom}/>

            { listToComponents }

            {/* <Route path='/' exact={true} component={userComponents.ConsultingMain}/>
            <Route path='/' exact={true} component={userComponents.ConsultingFaQ}/>
            <Route path='/' exact={true} component={userComponents.ConsultingAS}/>
            <Route path='/' exact={true} component={userComponents.Custom}/>
            <Route path='/' exact={true} component={userComponents.InfoMain}/>
            <Route path='/' exact={true} component={userComponents.InfoStory}/>
            <Route path='/' exact={true} component={userComponents.InfoFactory}/> */}
        </div>
    )
}