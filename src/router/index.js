import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/flights',
    name: 'flights',
    component: () => import(/* webpackChunkName: "flights" */ '../views/Flight.vue')
  },
  {
    path: '/myorder',
    name: 'myorder',
    component: () => import(/* webpackChunkName: "flights" */ '../views/Payment.vue')
  },
  {
    path: '/login',
    name: 'login'
  }
]

const router = new VueRouter({
  routes
})

export default router


