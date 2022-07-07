export default {
    name: 'home',
    component: () => import(/* webpackChunkName: "Home-Layout" */ '@/modules/Home/layouts/HomeLayout.vue'),
    children: [
        {
            path: '',
            name: 'start',
            component: () => import(/* webpackChunkName: "Login" */ '@/modules/Home/views/StartView.vue'),
        }
    ]

}