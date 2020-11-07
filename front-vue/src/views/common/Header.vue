<template>
    <div id="nav">

        <MenuItem to='/'>Home</MenuItem> | 
        <MenuItem to='/about'>Test About</MenuItem>
    </div>
</template>

<script>
import MenuItem from '../../components/common/MenuItem'

const components = { MenuItem, }
export default {
    components,
}
</script>