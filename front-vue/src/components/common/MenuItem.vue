<template>
    <span>
      <router-link v-bind:to="to" ><slot></slot></router-link>
      <button @click='onClick'>test</button>
    </span>
</template>

<script>  
const props = { to : String, name : String, };

import axios from 'axios';

export default {
    name,
    props,
    methods : {
        onClick(){
            console.log('aa');
            // const url2= 'http://localhost:8080/api/v1/posts/qna/1';


            const url = 'http://localhost:8080/api/v1/member/1';
            let config = {
                headers: {
                    'AUTHORIZATION' : 'test',
                }
            }
            axios.get(url, config).then(res=>console.log(res)).catch(err=>console.log(err));
        }
    }
}
</script>