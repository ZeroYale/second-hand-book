<template>
    <div>
        <div class="adminUser-welcome-box">
            <div class="adminUser-welcome-box-home" @click="toHome">
                首页
            </div>
            <div class="adminUser-welcome-box-title">
                商城管理
            </div>
            <div class="adminUser-welcome-box-name">
                <span style="color:#0087f3">
                    {{this.$store.state.userInfo.username}}
                </span>,
                <span style="color:#ff0000">
                    你好
                </span> 
            </div>
            <el-button type="text" @click="exit" class="adminUser-welcome-box-exit" style="color:red">退出</el-button>
        </div>
        <el-container>
            <el-aside width="200px">
                <el-radio-group v-model="isCollapse" style="margin-bottom: 20px;">
                    <el-radio-button :label="false">展开</el-radio-button>
                    <el-radio-button :label="true">收起</el-radio-button>
                </el-radio-group>
                <el-menu :default-active="activeIndex" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse" router>
                    <el-menu-item index="/searchUser">
                        <i class="el-icon-user"></i>
                        <span slot="title">查询用户</span>
                    </el-menu-item>
                    <el-submenu index="/searchBook">
                        <template slot="title">
                            <i class="el-icon-reading"></i>
                            <span slot="title">图书管理</span>
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="/searchBook">查询图书</el-menu-item>
                            <el-menu-item index="/addBook">新增图书</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                </el-menu>
            </el-aside>
            <el-main>
                <router-view/>
            </el-main>
        </el-container>
    </div>
</template>

<script>

export default {
    data(){
        return{
            isCollapse: false,
            activeIndex:'/searchUser'
        }
    },
    created(){
        console.log(this.$route.path);
        this.activeIndex = this.$route.path;
    },
    methods:{
        exit(){
            this.$router.push('/login');
        },
        toHome(){
            this.$router.push('/');
        },
        handleOpen(key, keyPath) {
            console.log(key, keyPath);
        },
        handleClose(key, keyPath) {
            console.log(key, keyPath);
        },
    }
}
</script>

<style scoped>
*{
    margin: 0;
    padding: 0;
}
.el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 198px;
    min-height: 400px;
}
.adminUser-welcome-box{
    display: flex;
    justify-content:space-between;
    width: 100%;
    background-color: #e9eef3;
    height: 65px;
}
.adminUser-welcome-box-home{
    align-self:center;
    cursor: pointer;
    color: #0087f3;
    font-size: 18px;
    margin-left: 2%;
}
.adminUser-welcome-box-name{
    align-self: flex-end;
    margin-bottom: 0.8%;
}
.adminUser-welcome-box-exit{
    margin-right: 2%;
    height: 65px;
    line-height: 65px;
}
.adminUser-welcome-box-title{
    margin-left: 21%;
    font-size: 30px;
    height: 65px;
    line-height: 65px;
}
</style>