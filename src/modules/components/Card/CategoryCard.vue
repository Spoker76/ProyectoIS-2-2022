<template>
    <div class="card" style="background-color: #DFA9FF; padding: 15px;box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.3);cursor: pointer;">
        <router-link :to="'/category/' + props.item.ID">
        <a-card :bordered="false">
            <p style="font-weight: bold;font-size:20px;x;"> {{ (props.item.CATEGORIA).substr(0,21) }}</p>
            <hr><br>
            <div class="category-item"> 
                <img :src="props.item.FOTO" />
            </div>
            <br>
            <p style="font-style: italic">Ventas: {{props.item.VENTAS}}</p>
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
                nombre: "Categoria",
                ventas: 0,
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
.card{
    border-radius: 5px;
}

.category-item img {
  width: auto;
  height: 100px;
  object-fit: cover;
  vertical-align: middle;
  
}
</style>