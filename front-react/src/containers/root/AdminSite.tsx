import React from "react";
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import { Main } from "../user/Main";
import { type } from "os";

type AdminSiteProps = {
    match : any,
}

export function AdminSite ({ match } : AdminSiteProps){

    const prefix_path = match.path;

    return (
        <div>
            <Route path={`${prefix_path}/main`} component={Main}></Route>
        </div>
    )
}