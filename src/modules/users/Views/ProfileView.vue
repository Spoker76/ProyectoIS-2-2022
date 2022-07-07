<template>

  <div class="principal">
      <h1 style="font-weight: bold;text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);">Mí perfíl</h1>
      <table>
  <caption>¡Haz click para editar tu información!</caption>
  <tbody>
    <tr>
      <td><img class="imagen" src="https://i.ibb.co/cvSBJz8/perfil.png" alt="perfil" border="0" /></td>
      <td class="label">Nombre completo:</td>
      <td class="contenido" v-if="profileInformation[0].SNOMBRE == null && profileInformation[0].SAPELLIDO == null">{{profileInformation[0].PNOMBRE+" "+profileInformation[0].PAPELLIDO}}</td>
      <td class="contenido" v-if="profileInformation[0].SAPELLIDO != null">{{profileInformation[0].PNOMBRE+" "+profileInformation[0].PAPELLIDO+" "+profileInformation[0].SAPELLIDO}}</td>
      <td class="contenido" v-if="profileInformation[0].SNOMBRE != null">{{profileInformation[0].PNOMBRE+" "+profileInformation[0].SNOMBRE+" "+profileInformation[0].PAPELLIDO}}</td>
      <td class="contenido" v-if="profileInformation[0].SNOMBRE != null && profileInformation[0].SAPELLIDO != null">{{profileInformation[0].PNOMBRE+" "+profileInformation[0].SNOMBRE+" "+profileInformation[0].PAPELLIDO+" "+profileInformation[0].SAPELLIDO}}</td>
      <td class="label">Departamento: </td>
      <td class="contenido" >{{profileInformation[0].DEPARTAMENTO}}</td>
    </tr>
    <tr>
      <td class="contenido2" v-if="profileInformation[0].PROMEDIOCAL == null">Calificación: 5/5</td>
      <td class="contenido2" v-if="profileInformation[0].PROMEDIOCAL != null">Calificación: {{(profileInformation[0].PROMEDIOCAL).toFixed(1)}}/5</td>
      <td class="label">Correo electrónico:</td>
      <td class="contenido" >{{profileInformation[0].CORREO}}</td>
      <td class="label">Municipio: </td>
      <td class="contenido" >{{profileInformation[0].MUNICIPIO}}</td>
    </tr>
    <tr>
      <td></td>
      <td class="label3">Teléfono: </td>
      <td class="contenido3" >{{profileInformation[0].TELEFONO}}</td>
    </tr>
  </tbody>
</table>
  </div>
  <!--USTEDES TRABAJARÍAN DENTRO DE ESTE DIV-->
  <div class="administraciónDeProductos">

  </div>

  <router-view />
</template>

<Suspense>

</Suspense>

<script>
import { apiRest } from "@/api/api.js";
import { defineComponent} from "vue";

export default defineComponent({
  async setup() {

    const profileInformation = (await apiRest.get('/profileInformation/user/'+(JSON.parse(window.localStorage.getItem('user'))).idUsuario)).data;
    const profileSubscriptions = (await apiRest.get('/profileSubscriptions/user/'+(JSON.parse(window.localStorage.getItem('user'))).idUsuario)).data;
    return {
      profileInformation,
      profileSubscriptions,
    };
  },
  components: {
  },
});
</script>

<style scoped>
.imagen{
  padding: 30px;
  border-color: black;
}

.principal {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #f8e2ff;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%239C92AC' fill-opacity='0.3'%3E%3Cpath d='M0 38.59l2.83-2.83 1.41 1.41L1.41 40H0v-1.41zM0 1.4l2.83 2.83 1.41-1.41L1.41 0H0v1.41zM38.59 40l-2.83-2.83 1.41-1.41L40 38.59V40h-1.41zM40 1.41l-2.83 2.83-1.41-1.41L38.59 0H40v1.41zM20 18.6l2.83-2.83 1.41 1.41L21.41 20l2.83 2.83-1.41 1.41L20 21.41l-2.83 2.83-1.41-1.41L18.59 20l-2.83-2.83 1.41-1.41L20 18.59z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
}

h1 {
  margin-top: 2rem;
}
.content-button {
  margin-right: 2rem;
  transition: all 0.3s ease-in;
}
.content-button:hover{
  border-bottom: 0.15rem solid var(--blanco);
}
.content-button a {
  font-family: Montserrat;
  font-weight: 700;
  font-size: 1.2rem;
  color: var(--negro);
}
.content-button a:hover {
  color: var(--blanco)
}
.content-button a.router-link-exact-active {
  color: var(--blanco)
}

table{
  background-color: #FAF1FF;
  box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  width: 85%;
  transition: transform 250ms;
  cursor: pointer;
  height: 300px;
  padding-bottom: 3;
}

table:hover{
  transform: translateY(-10px);
}

img {
  width: auto;
  height: 200px;
  object-fit: cover;
  vertical-align: middle;
}

.label{
  text-align: left;
  padding-left: 5px;
  font-weight: bold;
  width: 15%;
  vertical-align: bottom;
}

.contenido{
  text-align: left;
  padding-left: 5px;
  vertical-align: bottom;
  padding-right: 5px;
}

.label3{
  text-align: left;
  padding-left: 5px;
  font-weight: bold;
  vertical-align: top;
  height: 80px;
  padding-top: 9px;
}

.contenido3{
  text-align: left;
  padding-left: 5px;
  vertical-align: top;
  padding-top: 9px;
}

.contenido2{
  font-weight: bold;
  vertical-align: top;
  font-style: italic;
  font-size: 120%;
  width: 200px;
}
</style>