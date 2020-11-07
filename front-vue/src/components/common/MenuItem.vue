<template>
    <span>
      <router-link v-bind:to="to" ><slot></slot></router-link>
    </span>
</template>

<script>  
const props = { to : String, name : String, };

export default {
    name,
    props,
}
</script>