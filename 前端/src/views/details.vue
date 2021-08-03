<template>
  <div>
      <i-header/>
      <div class="details-box">
        <div class="details-img-box">
          <div class="bread-sort">
            <el-breadcrumb separator-class="el-icon-arrow-right">
              <el-breadcrumb-item>图书</el-breadcrumb-item>
              <el-breadcrumb-item>{{bookDetail.category_id}}</el-breadcrumb-item>
            </el-breadcrumb>
          </div>
          <img :src=bookDetail.image alt="" width="300px" height="375px">
        </div>
        <div class="details-all-box">
          <div class="details-all-box-name" :title=bookDetail.name>{{bookDetail.name}}</div>
          <div class="details-all-box-detail" :title=bookDetail.detail>{{bookDetail.detail}}</div>
          <div class="details-all-author-box">作者：{{bookDetail.author}}</div>
          <div class="details-all-price-box">￥{{bookDetail.price}}</div>
          <div class="details-all-shop-box">
            <el-button type="primary" icon="el-icon-plus" circle @click='numAdd'></el-button>
            <input type="text" class="input-number" v-model="num" @blur="numBlur">
            <el-button type="danger" icon="el-icon-minus" circle @click='numReduce'></el-button>
            <el-button type="primary" round @click="addCar">加入购物车</el-button>
          </div>
        </div>
      </div>
  </div>
</template>

<script>

import header from '@/views/header';

export default {
    data(){
        return{
          bookDetail:this.$store.state.bookDetail,
          num:1,
        }
    },
    components: {
      iHeader:header,
    },
    methods:{
      //购买数量加一
      numAdd(){
        if(this.num < 100){
          this.num++;
        }
      },
      //购买数量减一
      numReduce(){
        if(this.num == 1){
          this.num = 1;
        }else{
          this.num--;
        }
      },
      //数量框失焦
      numBlur(){
        //验证输入的账号是否合法
        let reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
        if(!reg.test(this.num)){
          this.$message.error('请输入 正数 ');
          this.num = 1;
        }
        if(this.num > 100){
          this.$message({
            message: '请输入 大于0小于100 的正数',
            type: 'warning'
          });
          this.num = 100;
        }
        if(this.num == 0){
          this.$message({
            message: '请输入 大于0小于100 的正数',
            type: 'warning'
          });
          this.num = 1;
        }
      },
      //加入购物车
      addCar(){
        //判断是否登录
        if(this.$store.state.userInfo.status != 1 && this.$store.state.userInfo.status != 0){
          this.$message({
              message: '请先登录',
              type: 'warning'
          });
          return;
        }else{
          for(var i = 0;i < this.$store.state.shopCar.length;i++){
            if(this.bookDetail.id == this.$store.state.shopCar[i].bookDetail.id){
              this.$message({
                  message: '此物品已存在于购物车 , 请勿重复添加',
                  type: 'error'
              });
              return;
            }
          }
          this.$store.commit('addCar',{
            num:this.num,
            bookDetail:this.$store.state.bookDetail
          });
          this.$message({
              message: '添加成功',
              type: 'success'
          });
          this.$router.push('/yiyi');
        }
      }
    }
}
</script>

<style scoped>
.bread-sort{
  margin-top:10px ;
  margin-left:100px ;
  font-weight: bold;
}
.details-box{
  width: 80%;
  margin: 0 auto;
}
.details-img-box{
  float: left;
  width: 40%;
}
.details-img-box img{
  margin: 15px 90px 40px 93px;
}
.details-all-box{
  float: right;
  width: 59%;
}
.details-all-box-name{
  width: 100%;
  height: 55px;
  margin: 25px 0 0 0;
  color: #383232;
  font-size: 20px;
  font-weight: bolder;
  line-height: 25px;
  /*-webkit-line-clamp用来限制在一个块元素显示的文本的行数。 为了实现该效果，它需要组合其他的WebKit属性。
  常见结合属性：
  display: -webkit-box; 必须结合的属性 ，将对象作为弹性伸缩盒子模型显示 。
  -webkit-box-orient 必须结合的属性 ，设置或检索伸缩盒对象的子元素的排列方式 。
  text-overflow: ellipsis;，可以用来多行文本的情况下，用省略号“…”隐藏超出范围的文本 。*/
  overflow: hidden;
  -webkit-line-clamp: 2;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
.details-all-box-detail{
  width: 100%;
  height: 125px;
  color: #383232;
  font-size: 17px;
  line-height: 25px;
  font-family: Sans-serif;
  overflow: hidden;
  -webkit-line-clamp: 5;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
.details-all-author-box{
  width: 100%;
  height: 75px;
  line-height: 75px;
  color:#646464;
  font-size: 14px;
}
.details-all-price-box{
  width: 100%;
  height: 75px;
  font-size: 30px;
  color: #e52222;
}
.details-all-shop-box{
  width: 100%;
  height: 75px;
}
.input-number{
  border: 1px solid #409eff;
  border-radius: 8px;
  width: 100px;
  height: 30px;
  text-align: center;
}
.details-all-shop-box input:focus{
  background:none;
  outline:none;
  border:0px;
  border: 1px solid #ffcc33;
}
</style>