<template>
  <nav class="navbar">
    <section class="left-content">
      <div class="logo">
        <router-link to="/">Ingenio's</router-link>
      </div>
      <div class="searchbox">
        <input type="text" placeholder="Buscar productos..." />
      </div>
    </section>
    <section class="right-content">
      <div class="content-button">
        <router-link :to="{name: 'profile'}">Mi Perfil</router-link>
      </div>
          <a-button type="primary" style="font-weight: bolder; letter-spacing: 1px;" danger @click="logOut">Cerrar Sesion <logout-outlined /> </a-button>
      <!--<div class="content-button">
        <router-link to="/profile">Mí perfíl</router-link>
      </div>
      <div class="content-button">
        <router-link to="/auth/logout">Cerrar sesión</router-link>
      </div>-->
    </section>
  </nav>

</template>

<script>
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { LogoutOutlined } from "@ant-design/icons-vue";
export default {
    components: {
        LogoutOutlined
    },
    setup() {
        const router = useRouter()
        const store = useStore()
        const logOut = () => {
            store.commit('authModule/logout')
            router.push({name: 'login'})
        }
        return {
            logOut
        }
    }
}

</script>

<style>
.navbar {
  position: sticky;
  top: 0;
  width: 100%;
  z-index: 2;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.25rem;
  background: var(--morado-claro);
  box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
}
.logo {
  margin: 0 2rem;
}
.logo a {
  font-family: Fraunces;
  font-size: 2rem;
  color: var(--negro);
}
.logo a:hover {
  color: var(--blanco)
}
.logo a.router-link-exact-active {
  color: var(--blanco)
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
  color: var(--blanco);
}
.searchbox input {
  font-family: Montserrat;
  font-style: italic;
  font-size: 1rem;
  font-weight: 500;
  border: 0;
  border-radius: 0.25rem;
  height: 2rem;
  outline: 0;
  width: 35rem;
  padding: 0 1rem;
  appearance: none;
}

section {
  display: flex;
  align-items: center;
}
</style>
