<template>
  <a-carousel arrows autoplay>
    <template #prevArrow>
      <div class="custom-slick-arrow" style="left: 10px; z-index: 1">
        <left-circle-outlined />
      </div>
    </template>
    <template #nextArrow>
      <div class="custom-slick-arrow" style="right: 10px">
        <right-circle-outlined />
      </div>
    </template>
    <template v-for="item in products" :key="item.ID">
      <div class="carousel-item">
        <router-link :to="'/product/' + item.ID">
          <img :src="item.FOTO" />
        </router-link>
      </div>
    </template>
  </a-carousel>
</template>
<script>
import { LeftCircleOutlined, RightCircleOutlined } from "@ant-design/icons-vue";
import { defineComponent } from "vue";
export default defineComponent({
  props: {
    products: {
      type: Array,
      default: () => [],
    },
  },
  components: {
    LeftCircleOutlined,
    RightCircleOutlined,
  },
});
</script>
<style scoped>
.carousel-item {
  height: 500px;
  width: 720px !important;
  display: inline-flex !important;
  align-items: center;
  justify-content: center;
}
.carousel-item img {
  width: auto;
  height: 500px;
  object-fit: cover;
  vertical-align: middle;
  box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
}
.ant-carousel {
   padding: 30px 0;
   background: #CB73FF;
box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;
}
.ant-carousel :deep(.slick-slide) {
 
  text-align: center;
  height: 500px;
  line-height: 160px;
  background: #CB73FF;
  overflow: hidden;
}

.ant-carousel :deep(.slick-arrow.custom-slick-arrow) {
  width: 25px;
  height: 25px;
  font-size: 25px;
  color: #fff;
  background-color: rgba(31, 45, 61, 0.11);
  opacity: 0.3;
  z-index: 1;
}
.ant-carousel :deep(.custom-slick-arrow:before) {
  display: none;
}
.ant-carousel :deep(.custom-slick-arrow:hover) {
  opacity: 0.5;
}

.ant-carousel :deep(.slick-slide h3) {
  color: #fff;
}
</style>
