<template>
  <header>
    <div class="descripcion">
        <h2>Inicia vendiendo o comprando tus productos</h2>
        <p>Comience con la plataforma más fácil y segura para comprar y vender todo tipo de productos. Configure su cuenta gratuita una vez y consérvela todo el tiempo que desee.
        </p>
        <router-link :to="{name: 'login'}">Empezar</router-link>
    </div>
    <div class="descripcion-img">
       <figure>
        <img src="../../../public/Ilustraciones/undraw_web_shopping_re_owap.png" alt="Empresa">
       </figure>
    </div>
  </header>
</template>

<script>
export default {

}
</script>

<style scoped>
header {
    background: #ECCBFF;
    display: flex;
}

h2 {
    font-size: 2.5rem;
    margin-bottom: 50px;
    text-align: left;
}

p {
    font-size: 1rem;
    margin-bottom: 30px;
    letter-spacing: 1px;
    text-align: left;
}
a{
    width: 30%;
    display: inline-block;
    background-color: #CB73FF;
    border: none;
    padding: 10px 30px;
    color: white;
    font-weight: bolder;
    letter-spacing: 1px;
    transition: background-color .5s ;
    align-self: right;
}

a:hover {
    background-color: #c155ff
}

figure img {
    width: 480px;
    height: 400px;
}

.descripcion {
    width: 50%;
    height: 600px;
    padding: 90px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    /* align-items: center; */
}

.descripcion-img {
    width: 50%;
    height: 600px;
    padding: 90px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
</style>