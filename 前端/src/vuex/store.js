import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate"

Vue.use(Vuex)

const store = new Vuex.Store({
    // 定义状态
    state: {
        bookDetail: {},
        userInfo: {},
        shopCar: [],
        //我的订单
        myOrder: []
    },
    //修改状态
    mutations: {
        //购买数量
        // bookNum(state, msg) {
        //     state.bookDetail.num = msg;
        // },
        //删除已购物品
        deleteHadShop(state, msg) {
            for (var i = 0; i < state.shopCar.length; i++) {
                if (state.shopCar[i].bookDetail.id == msg) {
                    state.shopCar.splice(i, 1);
                }
            }
        },
        //添加到购物车
        addCar(state, msg) {
            state.shopCar.push(msg);
        },
        //保存我的订单
        addOrder(state, msg) {
            console.log('msg  ' + msg);
            state.myOrder.push(msg);
        },
        //清空购物车
        clearCar(state) {
            state.shopCar.splice(0, state.shopCar.length);
        },
        //删除购物车某一项
        deleteOneBook(state, msg) {
            state.shopCar.splice(msg, 1);
        },
        //删除订单
        deleteOneOrder(state, msg) {
            state.myOrder.splice(msg, 1);
        },
        //图书详情
        bookDetail(state, msg) {
            state.bookDetail = msg;
        },
        //用户信息
        userInfo(state, msg) {
            state.userInfo = msg;
        }
    },
    plugins: [createPersistedState({
        storage: window.sessionStorage,
    })],
})

export default store