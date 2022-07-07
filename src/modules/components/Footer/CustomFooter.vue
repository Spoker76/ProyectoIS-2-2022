<template>
  <footer style="text-align: center" class="foot">
      Ingenio's! - Compra y vende lo que quieras...<br/>
      <div style="font-weight:bold">KM - AG - JA - DG - JP</div>
      2022 - Todos los derechos reservados
  </footer>
</template>

<script>
import { defineComponent, ref } from "vue";
export default defineComponent({
  setup() {
    const name = ref("name");
    return {
      name,
    };
  },
});
</script>

<style>
.foot{
  z-index: 100;
  padding: 1rem;
  font-style: italic;
  background-color: #ECCBFF;
}
</style>
