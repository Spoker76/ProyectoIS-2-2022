export default {
    name: 'auth',
    component: () => import(/* webpackChunkName: "auth-Layout" */ '@/modules/authentication/layouts/AuthLayout.vue'),
    children: [
       {
           path: '',
           name: 'login',
           component: () => import(/* webpackChunkName: "Login" */ '@/modules/authentication/views/LoginView.vue'),
       },
       {
           path: 'register',
           name: 'register',
           component: () => import(/* webpackChunkName: "Register" */ '@/modules/authentication/views/RegisterView.vue'),
       },
       {
           path: 'terminos',
           name: 'terminos',
           component: () => import(/*webpackChunkName: "terminos" */ '@/modules/authentication/views/TerminosView.vue')
       }
    ]

}