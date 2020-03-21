import React from "react";
import { MenuItem } from "../../data/Interfacies";
import { BrowserRouter as Route , Link } from "react-router-dom";


type HeaderProps = {
    menuItems : MenuItem[] | undefined
}

let objectToMenu = (menuItem : MenuItem) =>{
    return (
        <Link to={menuItem.url}>{menuItem.name}</Link>
    )
}

export function Header ( {...headerProps} : HeaderProps){

    let listToComponents = headerProps.menuItems?.map((t,i)=>{

        let menu = objectToMenu(t);
        let childrenMenu = t.children?.map((_t, _i)=>{
            console.log(_t);
            let cMenu = objectToMenu(_t);
            return (
                <li key={_i}>
                    {cMenu}
                </li>
            )
        });

        return (
            <li key={i}>
                { menu }

                <div>
                    <ul>
                        { childrenMenu }
                    </ul>
                </div>
                {/* <Link key={i} to={t.url}>{t.name}</Link> */}
            </li>
        )
    })

    return (
        <div>
            <ul>
                {listToComponents}
            </ul>
        </div>
    )
}