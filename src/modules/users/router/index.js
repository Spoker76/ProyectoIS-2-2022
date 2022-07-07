export default {
    name: 'profileRouter',
    component: () => import(/* webpackChunkName: "userLayout" */ '@/modules/users/layouts/profileLayout.vue'),
    children: [
       {
           path: '',
           name: 'profile',
           component: () => import(/* webpackChunkName: "profileView" */ '@/modules/users/Views/ProfileView.vue'),
       }
    ]

}