<template>
<customCarrusel />
    <h2>Hello  fefsfsf</h2>
    <div>
        <p>ok {{user}}</p>
    </div>
    <!-- <button @click="logOut">logout</button> -->

    
</template>

<script>
//import VueJwtDecode from 'vue-jwt-decode'
// import store from '@/store'

// //para hacer referencia al carrusel 
// import customCarrusel from "./modules/components/carrusel/customCarrusel.vue"
// import { defineComponent } from 'vue';

// export default defineComponent({
//     components: {
//         customCarrusel,
//     },
//     data() {
//         return {
//             user: {}
//         }
//     },
//     methods: {
//         async getUserDetails() {


//         },
//         logOut() {
//             store.commit('authModule/logout')
//             this.$router.push({ name: 'login' })
//         }
//     }

// });

import { computed } from "vue";
import { useStore } from "vuex";
import { useRouter } from "vue-router";
export default {
    setup() {
        const store = useStore()
        const router = useRouter()

        const user = computed(() => store.getters['authModule/getUser'])
        const logOut = () => {
            store.commit('authModule/logout')
            router.push({name: 'login'})
        }
        return {
            user,
            logOut

        } 
    }
}
//validar si esta correcto el llamado

/* export default {
    
    data() {
        return {
            user: {}
        }
    },
    methods: {
        async getUserDetails() {


        },
        logOut() {
            store.commit('authModule/logout')
            this.$router.push({ name: 'login' })
        }
    }
}
*/




</script>

<style>
</style>