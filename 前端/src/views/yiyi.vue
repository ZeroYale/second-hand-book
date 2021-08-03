<template>
  <div>
    <!-- 接受子组件传值 -->
    <i-header @listenToChildEventSearch="selectBook"></i-header>
    <div class="rotation-box">
      <div class="banner">
        <div class="item">
          <img :src="rotation[currentIndex]" @mouseover="stopScroll" @mouseout="startScroll">
        </div>
        <div class="page" v-if="this.rotation.length > 1">
            <ul>
                <li @click="gotoPage(prevIndex)">&lt;</li>
                <li 
                  v-for="(item,index) in rotation" 
                  @click="gotoPage(index)" 
                  :class="{current:currentIndex == index}" 
                  :key=index>  
                  {{index+1}}
                </li>
                <li @click="gotoPage(nextIndex)">&gt;</li>
            </ul>
        </div>
      </div>
    </div>
    <div class="book-box">
      <div class="book-ul1">
        <ul>
          <li 
            v-for="(i,index) in bookData" 
            :key=index 
            class="first-li"
            @click="toDetails(index)">
            <img :src="i.image" width="140px" height="170px">
            <div class="book-ul2">
              <ul>
                <li class="book-name" :title=i.name>{{i.name}}</li>
                <li class="book-author">{{i.author}}</li>
                <li class="book-price">￥{{i.price}}</li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="paging-box">
        <el-pagination
          background
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page.sync="pageNum"
          :page-sizes="[10,20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
        </el-pagination>
    </div>
    <div class="footer-copyright">
        Copyright © 2020 易易 All Rights Reserved
    </div>
  </div>
</template>

<script>

import header from '@/views/header';

export default {
  data() {
      return {
        currentIndex: 0,   //默认显示图片
        timer: null,    //定时器
        needBook:{},
        rotation:[
          "http://bookshop2.oss-cn-beijing.aliyuncs.com/book/1.jpg",
          "http://bookshop2.oss-cn-beijing.aliyuncs.com/book/2.jpg",
          "http://bookshop2.oss-cn-beijing.aliyuncs.com/book/3.jpg",
          "http://bookshop2.oss-cn-beijing.aliyuncs.com/book/4.jpg",
          "http://bookshop2.oss-cn-beijing.aliyuncs.com/book/5.jpg",
          "http://bookshop2.oss-cn-beijing.aliyuncs.com/book/6.jpg",
        ],
        // 分页相关
        pageNum:1,//当前页
        total:null,//总数
        pageSize:10,//页大小
        bookData:[],//存放返回的数据
        //首页搜索相关
        searchContent:'',
    }
  },
  components: {
      iHeader:header,
  },
  created() {
    //一打开查询图书页面，调用查询所有图书方法
    this.allBook();
    //轮播图滚动
    this.runInv();
    //路由跳转，若没有登录，则跳转到登陆页面
  },
  // mounted(){
  //   console.log('111111        ' + this.$route.path);
  //   if(this.$route.path == '/yiyi'){
  //     this.$router.push('/yiyi');
  //   }else if(this.$route.path != '/login' && this.$store.state.userInfo.status != 1 && this.$store.state.userInfo.status != 0){
  //     this.$router.push('/login');
  //   }
  // },
  computed: {
      //上一张
      prevIndex() {
          if(this.currentIndex == 0) {
            return this.rotation.length - 1;
          }else{
            return this.currentIndex - 1;
          }
      },
      //下一张
      nextIndex() {
          if(this.currentIndex == this.rotation.length - 1) {
            return 0;
          }else {
            return this.currentIndex + 1;
          }
      },
      //分页相关
  },
  methods: {
    //轮播图相关
    gotoPage(index) {
        this.currentIndex = index;
    },
    //定时器
    runInv() {
      this.timer = setInterval(() => {
          this.gotoPage(this.nextIndex)
      }, 3000);
    },
    stopScroll(){
      clearInterval(this.timer);
    },
    startScroll(){
      this.runInv();
    },
    toDetails(index){
      this.needBook = this.bookData[index];
      this.$store.commit('bookDetail',this.needBook);
      this.$router.push('/details');
    },
    // 分页相关
    //分页显示图书
    allBook(){
      //清空数组
      // this.bookData.splice(0,this.bookData.length);
      //查询所有图书接口
      this.$axios.post('http://localhost:8081/book/page',{
      //this.$axios.post('/page',{
        'pageNum':this.pageNum,    //当前页
        'pageSize':this.pageSize,   //页大小
        'searchContent':this.searchContent,
      })
      .then(res => {
        if(res.data.message === 'success'){
          console.log(res.data.data);
          //获取返回数据
          this.bookData = res.data.data.data;
          //获取总数
          this.total = res.data.data.total;
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
    handleSizeChange(val) {
      //监听当前页大小
      this.pageSize = val;
      //选择需要的页大小后重新获取相应数据
      this.allBook();
    },
    handleCurrentChange(val) {
      //监听当前页
      this.pageNum = val;
      //选择需跳转页后重新获取相应数据
      this.allBook();
    },
    //首页搜索相关
    //接受子组件传值
    selectBook(data){
      console.log("data  " + data);
      this.searchContent = data;
      this.allBook();
    },
  }
}
</script>

<style scoped>
.page li {
  list-style: none;
  float: left;
  width: 30px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
  color: white;
  font-size: 14px;
}
.banner {
  max-width: 700px;
  margin: 0 auto;
  position: relative;
}
.banner img {
  width: 100%;
  display: block;
  cursor:pointer;
}
.banner .page {
  background: rgba(0,0,0,.5);
  position: absolute;
  right: 0;
  bottom: 0;
  width: 100%;
}
.banner .page ul {
  float: right;
}
.current {
  color: #ff6700!important;
}
.book-box{
  /* border: 2px solid red; */
  margin: 20px 0;
}
.book-ul1{
  /* border: 2px solid blue; */
  width: 83%;
  margin: 0 auto;
  cursor: pointer;
}
.book-ul2{
  /* border: 2px solid black; */
  width: 140px;
}
.book-ul2 li{
  margin: 5px 0;
}
.book-ul1 li{
  list-style: none;
}
.first-li{
  float: left;
  margin: 20px;
}
.book-name{
  white-space:nowrap;
  overflow:hidden;
  color: #000000;
}
.book-name:hover{
  color:#ec7814;
}
.book-author{
  white-space:nowrap;
  overflow:hidden;
  color: #aaaaaa;
}
.book-author:hover{
  color:#0199f9;
}
.book-price{
  color: #cc3300;
  font-weight: bold;
}
/* 分页相关 */
.paging-box{
  position: fixed;
  bottom: 20px;
  width: 100%;
  text-align: center;
}
.footer-copyright{
  height: 20px;
  line-height: 20px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  background: #c1c1c1;
  color: black;
  font-family: Arial;
  font-size: 13px;
  letter-spacing: 1px;
}
</style>