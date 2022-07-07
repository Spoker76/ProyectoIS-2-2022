<template>

  <div class="content">
    <suspense>
      <router-view />
      <template #fallback> Loading... </template>
    </suspense>
    <CustomFooter />
  </div>
</template>

<script>
import { defineComponent } from "vue";
import CustomFooter from "./modules/components/Footer/CustomFooter.vue";

export default defineComponent({
  components: {
    CustomFooter,
  },
});
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,700&family=Montserrat:wght@500;700&display=swap");
:root {
  --morado-oscuro: #6c2fad;
  --morado-claro: #a85cf9;
  --lila: #e6e1eb;
  --verde-oscuro: #37ad5c;
  --amarillo: #fac475;
  --blanco: #f9f9f9;
  --negro: #1f0e33;
}
#app {
  width: 100%;
  height: 100%;
  font-family: Montserrat, Fraunces;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: var(--negro);
  background: var(--blanco);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.content {
  z-index: 1;
  align-self: center;
  background: var(--blanco);
  height: 100%;
  width: 100%;
}
</style>
