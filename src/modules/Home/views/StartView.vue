<template>
    <h2>Hello</h2>
    <div>
        <p>Primer nombre: {{user.primerNombre}}</p>
        <p v-if="user.segundoNombre"> Segundo Nombre: {{user.segundoNombre}}</p>
        <p>Primer Apellido: {{user.primerApellido}}</p>
        <p v-if="user.segundoApellido"> Segundo Apellido{{user.segundoApellido}}</p>
        <p>Correo: {{user.correo}}</p>
        <p>Telefono: {{user.telefono}}</p>
    </div>
</template>

<script>
//import VueJwtDecode from 'vue-jwt-decode'
// import store from '@/store'

// export default {
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
// }

import { computed } from 'vue'
export default {
    setup() {

        return {
            user: computed(() => JSON.parse(window.localStorage.getItem('user'))) 
        }
    }
}

// Perfil de usuario solo copias y pegas

/**
 * import { useStore } from 'vuex'
import { useRouter } from 'vue-router'
import { computed } from 'vue'
export default {
    setup() {

        //importar para usar el store principal
        const store = useStore()
        const router = useRouter()

        const user = computed(() => JSON.parse(window.localStorage.getItem('user')))

        const updateUser = async () => {
            const idUser = user.idUsuario
            const {data} = await apiRest.post('users/update', (data del formulario que tengas))
            console.log(data) //mirar los cambios
            luego lo actualizas al localstorage
            window.localStorage('user', data.user) //asi lo pongo data.user asumiendo que vas a devolver eso para actualizarlo en pantalla (en el bakend)
            Y por ulimo lo conectas al boton de actualizar
        }
        return {
             updateUser,
             user
        }
    }
}
 */
</script>

<style>
</style>