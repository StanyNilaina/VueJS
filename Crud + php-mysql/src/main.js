import App from './App.vue'
import { createApp } from 'vue'
import * as VueRouter  from 'vue-router'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'


const routes = [
                { path: '/', component: () => import('./components/CrudApi.vue')}
                ]

const router = new VueRouter.createRouter({
  history: VueRouter.createWebHistory(),
  routes
})
const app = createApp(App)

loadFonts()

app 
  .use(vuetify)
  .use(router)
  .mount('#app')
  .mount('app')
