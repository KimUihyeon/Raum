export type MenuItem = {
    name : string ,
    url : string ,
    id: Number,
    children: MenuItem[]| undefined,
    etc: string | undefined
}




export type ComponentItem = {
    componentName : string,
    urls : string[],
    exact : boolean;
}