<template>
  <NavBar />
  <div class="contenedor">
    <a-form :rules="rules" :model="formState" name="normal_login" class="login-form" @submit.prevent method="POST">
      <div>
        <h2 id="iniciarSesion">Iniciar sesión</h2>
      </div>

      <div v-if="badCredentials" class="mb">
               <a-alert
    message="Error"
    description="Correo o contraseña incorrectos"
    type="error"
  /> 
      </div>
      <a-form-item class="elemento" has-feedback type="email" label="Correo" name="email"
      >
        <a-input class="caja" v-model:value="formState.email"/>
      </a-form-item>

      <a-form-item required class="elemento" label="Contraseña" name="password"
        >
        <a-input-password class="caja" v-model:value="formState.password" />
      </a-form-item>

      <div class="login-form-wrap">
        <a class="login-form-forgot" href="">¿Olvidó su contraseña?</a>
      </div>

      <a-form-item>
        <a-button @click="iniciarSesion" type="primary" html-type="submit" :disabled="disabled" class="boton">Iniciar sesión</a-button>
      </a-form-item>
      <a-form-item>
        <router-link :to="{name: 'register'}">¡Registrate ahora!</router-link>
      </a-form-item>
    </a-form>
  </div>
</template>

<script>
import { reactive, ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'
import NavBar from '@/modules/components/NavBar/NavBar.vue'
export default {
  components: {
    NavBar
  },
  setup() {
    const formState = reactive({
      email: '',
      password: '',
    })

    const store = useStore()
    const router = useRouter()
    let camposLlenos = ref(false);
    let validarCorreo = ref(false);
    let badCredentials = ref(false)

    const disabled = computed(() => {
      return !(formState.email && formState.password)
    })


    const validateEmail = (_rule, value) => {
      const regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      if (value === '') return Promise.reject('Debe Ingresar un email')

      if (regex.test(value)) return Promise.resolve()
      else return Promise.reject('Correo Invalido')
    }

    const rules = {
      email: [{
        required: true,
        validator: validateEmail,
        trigger: 'change',
      }]
    }


     
    return {
      formState,
      camposLlenos,
      validarCorreo,
      iniciarSesion: async () => {
        try {
          const { ok } = await store.dispatch('authModule/signInUser', formState)
          console.lo
          if (ok) {
            router.push({ name: 'start' })
          }

          badCredentials.value = !ok

        } catch (e) {
          console.log(e)
        }
      },
    disabled,
    rules,
    badCredentials
    }
  }

}

</script>

<style scoped>
.contenedor {
  min-height: 83.9vh;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 0px;
  padding: 2rem;
  background-color: #f1c6ff;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%239C92AC' fill-opacity='0.3'%3E%3Cpath d='M0 38.59l2.83-2.83 1.41 1.41L1.41 40H0v-1.41zM0 1.4l2.83 2.83 1.41-1.41L1.41 0H0v1.41zM38.59 40l-2.83-2.83 1.41-1.41L40 38.59V40h-1.41zM40 1.41l-2.83 2.83-1.41-1.41L38.59 0H40v1.41zM20 18.6l2.83-2.83 1.41 1.41L21.41 20l2.83 2.83-1.41 1.41L20 21.41l-2.83 2.83-1.41-1.41L18.59 20l-2.83-2.83 1.41-1.41L20 18.59z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
}

/* #iniciarSesion {
    text-align: center;
    padding-top: 120px;
    padding-bottom: 30px;
} */

h2 {
  text-align: center;
  height: 75px; 
  margin-bottom: 15px; 
  font-weight: bold;
  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2); 
}

.ant-form {

  border: rgba(0, 0, 0, 0.267) 1px solid;
  padding: 0 35px;
}

.mb {
  margin-bottom: 20px;
}

.login-form{
  height: 420px;
  display: flex;
  justify-content: center;
  flex-direction: column;
  box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  background-color: #FAF1FF;
}

.boton:enabled{
  background-color: #D58FFF;
  border-color: #C461FF;
}

.caja {
  width: 300px;
}

.caja:hover{
  -moz-box-shadow: 0px 0px 10px #D58FFF;
  -webkit-box-shadow: 0px 0px 10px #D58FFF;
  box-shadow: 0px 0px 10px #D58FFF;
  border-color: #C461FF;
}

.ant-input-affix-wrapper:hover{
  -moz-box-shadow: 0px 0px 10px #D58FFF;
  -webkit-box-shadow: 0px 0px 10px #D58FFF;
  box-shadow: 0px 0px 10px #D58FFF;
  border-color: #C461FF;
}

.elemento{
  text-align: right;
}

.caja:focus{
  -moz-box-shadow: 0px 0px 10px #D58FFF;
  -webkit-box-shadow: 0px 0px 10px #D58FFF;
  box-shadow: 0px 0px 10px #D58FFF;
  border-color: #C461FF;
}

</style>



