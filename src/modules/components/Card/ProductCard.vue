<template>
    <div class="card" style="background-color: #CB73FF; padding: 15px;box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.3);cursor: pointer;">
        <router-link :to="'/product/' + item.ID">
        <a-card bordered="false">
            <p style="font-weight: bold"> {{ (props.item.NOMBRE).substr(0,21)+"..." }}</p>
           <hr><br>
            <div class="product-item"> 
                <img :src="props.item.FOTO" />
            </div>
            <br/>
            <p>Precio: L. {{props.item.PRECIO}} </p>
            <p style="font-style: italic">{{(props.item.CATEGORIA).substr(0,26)}}</p>    
        </a-card>
        </router-link>
    </div>
</template>


<script>
    import { defineComponent, ref } from "vue";
    export default defineComponent({
    props: {
        item: {
            type: Object,
            default: () => ({
                nombre: "nombre",
                foto: "../foto/id",
                precio: "precio",
                categoria: "categoria",
                id: 1
            })
        }
    },
    setup(props) {
        const name = ref("name");
        return {
        name,
        props
        };
    },
    });

</script>

<style>
.product-item img {
  width: auto;
  height: 100px;
  object-fit: cover;
  vertical-align: middle;
  
}

</style>