import Vue from 'vue'
import App from './App.vue'
import VueResource from 'vue-resource';
import VueRouter from 'vue-router';
import { routes } from './routes';

Vue.use(VueResource);
Vue.use(VueRouter);
Vue.http.options.root = process.env.API_URL ? process.env.API_URL : 'http://localhost:8180';

const router = new VueRouter({ 
  routes, 
  mode: 'history' 
});

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
