<template>
  <NavBar />
  <descripcion-emp></descripcion-emp>
  <customCarrusel :products="products" />

  <div class="landing">
    <!-- <div>
      <h1 style="font-weight: bold;text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);">Categorías más vendidas</h1>
      </div>
    
    <a-list
      class="categories"
      :grid="{ gutter: 16, column: 3 }"
      :data-source="categories"
    >
      <template #renderItem="{ item }">
        <a-list-item>
          <CategoryCard :item="item" />
        </a-list-item>
      </template>
    </a-list> -->
    
    <h1 style="font-weight: bold;text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);">Productos recientes</h1>
    <a-list
      class="categories"
      :grid="{ gutter: 16, column: 4 }"
      :data-source="products"
    >
      <template #renderItem="{ item }">
        <a-list-item>
          <ProductCard :item="item" class="card-hover" />
        </a-list-item>
      </template>
    </a-list>
  </div>
  <router-view />
</template>

<Suspense>

</Suspense>

<script>
import { apiRest } from "@/api/api.js";
import { defineComponent } from "vue";

import customCarrusel from "@/modules/components/carrusel/customCarrusel.vue";
// import CategoryCard from "@/modules/components/Card/CategoryCard.vue";
import ProductCard from "@/modules/components/Card/ProductCard.vue";
import DescripcionEmp from "@/modules/components/DescripcionEmp.vue";
import NavBar from "@/modules/components/NavBar/NavBar.vue";

export default defineComponent({
  async setup() {
    const categories = (await apiRest.get('/categories/top')).data;
    const products = (await apiRest.get('/products/resume')).data;
    return {
      categories,
      products,
    };
  },
  components: {
    customCarrusel,
    DescripcionEmp,
    ProductCard,
    NavBar
  },
});
</script>

<style>
.categories {
  width: 90%;
  justify-self: center;
}
.landing {
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

.card-hover {
  transition: transform 250ms;
}

.card-hover:hover{
  transform: translateY(-10px);
}
</style>