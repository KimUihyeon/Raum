import { EntityMenuItem } from "./Entity";

export const menus: EntityMenuItem[] = [
    { componentName: 'Main', definitionUrl:'/test' , url: '/test/', displayName: 'Main', isExact: true, name: '테스트' },
    { componentName: 'ShowRoom', definitionUrl:'/showroom/' , url: '/showroom/', displayName: 'ShowRoom', isExact: true, name: '테스트' },
    { componentName: 'Object', definitionUrl:'/object/' , url: '/object/', displayName: 'Object', isExact: true, name: '테스트' },
]