<template>
    <NavBarInside/>
    <router-view />
</template>

<script>
import NavBarInside from '@/modules/components/NavBar/NavBarInside.vue'
export default {
    components: {
        NavBarInside
    }
}
</script>

<style>
</style>