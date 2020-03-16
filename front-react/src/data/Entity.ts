export type EntityMenuItem = {
    name : string ,
    displayName : string ,
    isExact : boolean | undefined ,
    definitionUrl : string , // Link에 정의 될 Url 패턴 
    url : string ,           // Route에 정의 될 Url 
    componentName : string ,
}