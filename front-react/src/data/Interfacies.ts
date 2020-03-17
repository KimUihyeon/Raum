export type MenuItem = {
    name : string ,
    url : string ,
    id: Number,
    children: MenuItem[]| undefined,
    etc: string | undefined
}