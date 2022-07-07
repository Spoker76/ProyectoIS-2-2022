<template>
  <NavBar />

  <div class="contenedor">


    <a-form 
    ref="formRef" 
    :model="infoUser" 
    :rules="rules" 
    name="normal_register" 
    class="register-form" 
    @submit.prevent method="POST" 
    id="registro">
      <div>
        <h2 id="encabezado" style="font-weight: bold;text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);">Registro de usuario</h2>
      </div>
      <a-form-item class="elemento" label="Nombre(s)" name="nombre"
      >
        <a-input class="caja" v-model:value="infoUser.nombre">
        </a-input>
      </a-form-item>

      <a-form-item class="elemento" label="Apellido(s)" name="apellido"
      >
        <a-input class="caja" v-model:value="infoUser.apellido">
        </a-input>
      </a-form-item>

      <a-form-item class="elemento" has-feedback label="Correo" name="correo"
      >
        <a-input class="caja" v-model:value="infoUser.correo" type="email"/>
      </a-form-item>


      <a-form-item class="elemento" has-feedback label="Teléfono (xxxx-xxxx)" name="telefono"
      >
        <a-input class="caja" v-model:value="infoUser.telefono" type="tel">
        </a-input>
      </a-form-item>

      <a-form-item class="elemento" has-feedback label="Contraseña" name="pass"
      >
      <a-input class="caja" v-model:value="infoUser.pass" type="password" autocomplete="off" />
    </a-form-item>

    <a-form-item class="elemento" has-feedback label="Confirmar contraseña" name="confirmedPass"
    >
      <a-input class="caja" v-model:value="infoUser.confirmedPass" type="password" autocomplete="off" />
    </a-form-item>
      <a-form-item class="elemento" has-feedback name="departamento" label="Departamento">
        <a-select class="caja" v-model:value="infoDireccion.departamento" placeholder="Seleccione su departamento:">
          <a-select-option v-for="(depto, index) in Departamentos" :key="index" :value="depto.nombre"
            :name="depto.nombre">
            {{ depto.nombre }}</a-select-option>
        </a-select>
      </a-form-item>

      <a-form-item class="elemento" has-feedback name="municipio" label="Municipio">
        <a-select class="caja" v-model:value="infoDireccion.municipio" placeholder="Seleccione su municipio:">
          <a-select-option v-for="(municipio, index) in muncps" :key="index" :value="municipio" :name="municipio">
            {{ municipio }}</a-select-option>
        </a-select>
      </a-form-item>
         
      <a-form-item>
        <a-checkbox v-model:checked="infoUser.terminos"><p class="terminos">
          Al marcar la casilla, aceptas nuestros <router-link :to="{name: 'terminos'}">terminos y condiciones</router-link> de uso.
        </p></a-checkbox>
      </a-form-item>


      <a-form-item>
        <a-button @click="Regist" type="primary" :disabled="disabled" class="boton">
          Registrarse</a-button>
      </a-form-item>
      <router-link :to="{ name: 'login' }" id="login">¿Ya tiene cuenta?</router-link>

    </a-form>
  </div>

</template>


<script>
import { ref, reactive, watch, computed } from 'vue'
import { apiRest } from '@/api/api.js'
import Departamentos from '@/modules/authentication/helpers/address.js'
import {useRouter} from 'vue-router'
import NavBar from '@/modules/components/NavBar/NavBar.vue'

export default {
  components: {
    NavBar
  },
  setup() {
    const router = useRouter()
    const formRef = ref()
    const infoUser = reactive({
      nombre: '',
      apellido: '',
      correo: '',
      telefono: '',
      pass: '',
      confirmedPass: '',
      terminos: false
    })

    const infoDireccion = reactive({
      idUsuario: null,
      departamento: 'Seleccione',
      municipio: 'Seleccione'
    })

    let validatePass = async (_rule, value) => {
      if (value === '') {
        console.log(formRef)
        return Promise.reject('Por favor ingrese la contraseña!');
      } else {

        if (infoUser.pass.length >= 8) {
          if (infoUser.confirmedPass !== '') {
            formRef.value.validateFields('confirmedPass')
          }
            return Promise.resolve()
          }else {
          return Promise.reject('La contraseña debe tener minimo 8 caracteres')
        }    
      }
   
   }

    let validatePass2 = async (_rule, value) => {
      if (value === '') {
        isConfirmedPass.value = false
        return Promise.reject('Porfavor ingrese la contraseña de nuevo');
      } else if (value !== infoUser.pass) {
        isConfirmedPass.value = false
        return Promise.reject("Las contraseñas no coinciden");
      } else {
        isConfirmedPass.value = true
        return Promise.resolve();
      }
    }

    /*eslint-disable*/

    const validateEmail = (_rule, value) => {
      const regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      if (value === '') {
        validEmail.value =false
        return Promise.reject('Debe Ingresar un correo') 
      } 
      if (regex.test(value)){
        validEmail.value =true;  
        return Promise.resolve()
      } else {
        validEmail.value =false
        return Promise.reject('Correo Invalido')
      }
      
    }
/*eslint-disable*/

const validatePhoneNumber = (_rule, value) => {
  const regex = /^\d{4}-\d{4}$/
  if (value === '') {
    validPhoneNumber.value = false
    return Promise.reject('Debe ingresar un numero de telefono')
  }
  
  if (regex.test(value)) {
    validPhoneNumber.value = true
    return Promise.resolve()
  }
  else {
    validPhoneNumber.value = false
    return Promise.reject('Numero de telefono invalido')
  } 
}


const validateSelect = (_rule, value) => {
  if (value === 'Seleccione') return Promise.reject('Debe seleccionar un valor')
  else return Promise.resolve()
}
    const rules = {
      pass: [{
        required: true,
        validator: validatePass,
        trigger: 'change',
      }],
      confirmedPass: [{
        required:true,
        validator: validatePass2,
        trigger: 'change',
      }],
      correo: [
        {
          required: true,
          validator: validateEmail,
          trigger: 'change'
        }
      ],
      nombre: [{
        required:true
      }],
      apellido: [
        {
          required: true
        }
      ],
      telefono: [
        {
          required: true,
          validator: validatePhoneNumber,
          trigger: 'change' 
        }
      ],
      departamento: [
        {
          required: true,
          validator: validateSelect
        }
      ],
      municipio: [
        {
          required: true,
          validator: validateSelect
        }
      ],
    }

    let isConfirmedPass = ref(true)
    let muncps = ref(null)
    let validEmail = ref(false)
    let validPhoneNumber = ref(false)


    watch(() => infoDireccion.departamento, (newValue) => {
      const depto = Departamentos.filter(departamento => departamento.nombre === newValue)[0]
      /* eslint-disable */
      try {
        muncps.value = depto.municipios
      } catch (e) { }
      /* eslint-disable */
    })

    const disabled = computed(() => {
      return !(infoUser.nombre && infoUser.apellido && infoUser.telefono && infoUser.correo && infoUser.pass && infoUser.confirmedPass && infoUser.terminos && validEmail.value && isConfirmedPass.value && validPhoneNumber.value);
    });



    return {
      Departamentos,
      muncps,
      Regist: async () => {
        const lastData = {
          nombre: infoUser.nombre,
          apellido: infoUser.apellido,
          correo: infoUser.correo,
          telefono: infoUser.telefono,
          pass: infoUser.pass,
        }
        const { data: dataUser } = await apiRest.post('/users/create', lastData)
        console.log(dataUser)
        infoDireccion.idUsuario = dataUser.insertId
        console.log(infoDireccion)
        const { data: dataAddress } = await apiRest.post('/addresses/create', infoDireccion)
        console.log(dataAddress)
        router.push({name: 'login'})
      },
      infoUser,
      infoDireccion,
      isConfirmedPass,
      validatePass,
      validatePass2,
      rules,
      disabled,
      validateEmail,
      formRef
    }
  }
}
</script>

<style scoped>



.contenedor {
  padding: 2rem;
  min-height: 83.9vh;
  display: flex;
  justify-content: center;
  align-items: top;
  margin-top: 0px;
  background-color: #f1c6ff;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%239C92AC' fill-opacity='0.3'%3E%3Cpath d='M0 38.59l2.83-2.83 1.41 1.41L1.41 40H0v-1.41zM0 1.4l2.83 2.83 1.41-1.41L1.41 0H0v1.41zM38.59 40l-2.83-2.83 1.41-1.41L40 38.59V40h-1.41zM40 1.41l-2.83 2.83-1.41-1.41L38.59 0H40v1.41zM20 18.6l2.83-2.83 1.41 1.41L21.41 20l2.83 2.83-1.41 1.41L20 21.41l-2.83 2.83-1.41-1.41L18.59 20l-2.83-2.83 1.41-1.41L20 18.59z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
}

#login {
  margin-top: 0px;
}

.ant-form[data-v-431b32ef] {
  border: rgba(0, 0, 0, 0.267) 1px solid;
  padding: 30px;
  padding-bottom: 10px;
  padding-top: 5px;
}

#encabezado {
  margin-top: 20px;
  padding-bottom: 20px;
}

.register-form{
  box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  background-color: #FAF1FF;
}

.boton:enabled{
  background-color: #D58FFF;
  border-color: #C461FF;
}

.caja:hover{
  -moz-box-shadow: 0px 0px 10px #D58FFF;
  -webkit-box-shadow: 0px 0px 10px #D58FFF;
  box-shadow: 0px 0px 10px #D58FFF;
  border-color: #C461FF;
}

.elemento{
  text-align: right;
}

.caja{
  width: 300px;
}

.caja:focus{
  -moz-box-shadow: 0px 0px 10px #D58FFF;
  -webkit-box-shadow: 0px 0px 10px #D58FFF;
  box-shadow: 0px 0px 10px #D58FFF;
  border-color: #C461FF;
}

.ant-select-single, .ant-select-selector, .ant-select-selection-item{
  text-align: left;
}

.terminos {
  width: 460px;
  margin: 0 auto;
  text-align: center;
}

</style>
