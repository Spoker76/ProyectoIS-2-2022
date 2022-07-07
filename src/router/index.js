import { createRouter, createWebHistory } from 'vue-router'
import authRouter from '@/modules/authentication/router'
import homeRouter from '@/modules/Home/router'
import landingRouter from '@/modules/landing/router'
import profileRouter from '@/modules/users/router'
import { isAuthenticatedGuard } from '@/modules/authentication/router/authGuard'

const routes = [
  {
    path: '/auth',
    ...authRouter
  },
  {
    path: '/',
    ...landingRouter
  },
  {
    path: '/home',
    beforeEnter: [isAuthenticatedGuard],
    ...homeRouter
  },
  {
    path: '/profile',
    beforeEnter: [isAuthenticatedGuard],
    ...profileRouter
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
