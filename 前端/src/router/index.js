import Vue from 'vue'
import Router from 'vue-router'
import login from '@/views/login'
import yiyi from '@/views/yiyi'
import book from '@/views/book'
import details from '@/views/details'
import adminShop from '@/views/adminShop'
import searchUser from '@/views/searchUser'
import searchBook from '@/views/searchBook'
import addBook from '@/views/addBook'

Vue.use(Router)

const router = new Router({
    routes: [{
        path: '/',
        redirect: '/yiyi'
    }, {
        path: '/login',
        component: login
    }, {
        path: '/yiyi',
        component: yiyi
    }, {
        path: '/book',
        component: book
    }, {
        path: '/details',
        component: details
    }, {
        path: '/adminShop',
        component: adminShop,
        redirect: '/searchUser',
        children: [{
            path: '/searchUser',
            component: searchUser
        }, {
            path: '/searchBook',
            component: searchBook
        }, {
            path: '/addBook',
            component: addBook,
        }]
    }],
})

//路由跳转，若没有登录，则跳转到登陆页面
// router.beforeEach(function(to, from, next) {
//     console.log('to:  ' + to.path);
//     console.log('from:  ' + from.path);
//     // //获取vuex中的权限
//     var vuex = JSON.parse(window.sessionStorage.getItem("vuex"));
//     // console.log(vuex.userInfo.status);
//     if (to.path === '/yiyi') return next();
//     if (to.path != '/login' && vuex.userInfo.status != 0 && vuex.userInfo.status != 1) return next('/login');
//     next();
// })

export default router