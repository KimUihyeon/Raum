import React from "react";
import { MenuItem } from "../../data/Interfacies";
import { BrowserRouter as Route , Link } from "react-router-dom";


type HeaderProps = {
    menuItems : MenuItem[] | undefined
}

export function Header ( {...headerProps} : HeaderProps){

    let listToComponents = headerProps.menuItems?.map((t,i)=>{
        return (
            <Link key={i} to={t.url}>{t.name}</Link>
        )
    })

    return (
        <div>
            {listToComponents}
        </div>
    )
}