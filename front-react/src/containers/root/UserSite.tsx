import React, { Suspense } from "react";
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { Body ,Footer, Header } from '../layout';
import { Main } from "../user/Main";


type menuItems = {
    name : string | null,
    displayName : string | null,
    path : string,
    isExact : boolean | undefined,
    componentPath : string,
}


let menu_info_container : menuItems[] = [
    { name : 'test', displayName : '', isExact:true, componentPath :'../user/Main', path : '/test' }
]

export function UserSite (){
    console.log('다시 그리는중 ㅠㅠ')
    // // let listToRuoteComponents = menu_info_container.map((t,i)=>{

    //     import(t.componentPath).then(a=>{
    //         console.log(a);
    //     }).catch(e=>{
    //         console.log(e);
    //     })

    //     const component = React.lazy(() => import(t.componentPath));


    //     return component;
    //     return (
    //         <Route key={i}
    //             exact={t.isExact} 
    //             path={t.path}
    //             component={component}/>
    //     )
    // });
    

    return (
        <div>
            {/* <Suspense fallback={<div>Loading...</div>}>
                <Route path='/test' component={Main}/>
            </Suspense> */}
        </div>
    )
}


