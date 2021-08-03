// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import Vuex from 'vuex'
import store from './vuex/store'

import VueLazyload from 'vue-lazyload'

import Mock from './mock/index';

import Axios from 'axios';

//全局使用element
Vue.use(ElementUI);

//全局使用vuex
Vue.use(Vuex);

Vue.prototype.$axios = Axios;

Vue.config.productionTip = false

// Vue.use(VueLazyload)

// // or with options
// Vue.use(VueLazyload, {
//     preLoad: 1.3,
//     error: 'dist/error.png',
//     loading: 'dist/loading.gif',
//     attempt: 1
// })

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    components: { App },
    template: '<App/>'
})