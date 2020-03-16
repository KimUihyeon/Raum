import { EntityMenuItem } from "../data/Entity";
import { MenuItem  } from "../data/Interfacies";

let toMenuItems = function ( entityMenuItems :EntityMenuItem[]){
    return entityMenuItems.filter(t=>{
        let data : MenuItem;
        return data = {
            componentName : t.componentName,
            displayName : t.displayName,
            isExact : t.isExact,
            name : t.name,
            definitionUrl : t.definitionUrl,
            url : t.url
        }
    })
}


export const Convert = {
    toMenuItems
}