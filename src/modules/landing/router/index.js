export default {
    name: 'landing',
    component: () => import(/* webpackChunkName: "LandingLayout" */ '@/modules/landing/layouts/LandingLayout.vue'),
}