<template>
  <div>
    <el-menu :default-active="activeIndex1" class="el-menu-demo" mode="horizontal" @select="handleSelect" style="font-weight:bold;">
      <el-menu-item index="1" @click="toHome">首页</el-menu-item>
      <!-- <el-menu-item index="2">书籍良品</el-menu-item> -->
      <!-- <el-menu-item index="3">热门书</el-menu-item> -->
      <el-menu-item index="4" @click="judgeLogin">个人中心</el-menu-item>
      <el-menu-item index="5" v-show="this.$store.state.userInfo.status == 1" @click="adminShop">商城管理中心</el-menu-item>
      <el-menu-item index="6" v-show="this.$store.state.userInfo.status == 0" @click="toUploadBook">上传图书</el-menu-item>
      <el-button type="text" @click="exit" class="exit" style="color:red">退出</el-button>
      <div class="welcome" v-show="this.$store.state.userInfo.status == 0 || this.$store.state.userInfo.status == 1">
        欢迎光临易易，<el-button type="text" @click="judgeLogin">{{this.$store.state.userInfo.username}}</el-button>
      </div>
      <div class="please-login" v-show="this.$store.state.userInfo.status != 0 && this.$store.state.userInfo.status != 1">
        欢迎光临易易，请
        <el-button type="text" style="color:red;" @click="login">登陆</el-button>
        成为会员
      </div>
    </el-menu>
    <div class="search-box">
      <img src="@/assets/yiyi.png" alt="" class="yiyi-logo" width="243px" height="79px">
      <div class="search">
        <input type="text" class="search-all" v-model="searchContent" @focus="searchFocus" @blur="searchBlur">
        <el-button slot="append" icon="el-icon-search" class="search-button" @click="searchBook"></el-button>
      </div>
      <div class="shopping-car">
        <el-button type="warning" round @click="shopCar">购物车</el-button>
        <el-button type="danger" round @click="ownOrder">我的订单</el-button>
      </div>
    </div>
    <div class="sort-box">
      <el-menu
          router
          class="el-menu-demo"
          mode="horizontal"
          @select="handleSelect"
          background-color="#ffffff"
          text-color="#323232">
          <el-submenu index=''>
            <template slot="title">
              <i class="el-icon-menu"></i><span style="color:red;font-weight:bold;">全部图书分类</span>
            </template>
            <ul class="allSort" style="width:400px">
              <li v-for="(item, index) in allSort" :key=index @click="toSort(item.name)">
                {{item.name}}/
              </li>
            </ul>
          </el-submenu>
          <el-menu-item
              style="color: red; border-bottom-color: transparent; background-color: rgb(255, 255, 255);font-weight:bold;"
              v-for="(item, index) in partSort"
              :index="item.pathname"
              :key="index">
              {{ item.name }}
          </el-menu-item>
      </el-menu>
      <!-- <div class="lun-dividing-line">
      </div>  -->
    </div>
    <el-dialog title="个人中心" :visible.sync="outerVisible" :show-close=false center>
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="header-ruleForm">
        <el-form-item label="姓名" prop="username">
          <el-input v-model="ruleForm.username" style="width:270px;" placeholder="请输入姓名"></el-input>
        </el-form-item>
        <el-form-item label="手机号码" prop="phone">
            <el-input v-model="ruleForm.phone" style="width:270px" placeholder="请输入手机号码" maxlength=11></el-input>
          </el-form-item>
        <el-form-item label="密码" prop="psw">
          <el-input v-model="ruleForm.psw" style="width:270px" placeholder="请输入密码"></el-input>
        </el-form-item>
      </el-form>
      <el-dialog
        width="30%"
        title="修改"
        :visible.sync="innerVisible"
        append-to-body
        :show-close=false
        center>
        <span>检测到个人信息被修改，请保存后再离开</span>
        <div slot="footer" class="dialog-footer">
          <el-button @click="secondCancel">取 消</el-button>
          <el-button type="primary" @click="secondSave('ruleForm')">保 存</el-button>
        </div>
      </el-dialog>
      <div slot="footer" class="dialog-footer">
        <el-button @click="firstCancel">取 消</el-button>
        <el-button type="primary" @click="firstSave('ruleForm')">保 存</el-button>
      </div>
    </el-dialog>
    <!-- 上传图书 -->
    <el-dialog title="上传图书" :visible.sync="uploadBookVisible" :show-close=false center>
      <i-addBook/>
    </el-dialog>
    <!-- 查看购物车 -->
    <el-dialog
      title="购物车"
      :visible.sync="shopCarDialogVisible"
      width="40%"
      center>
      <div class="no-shop" v-show="this.shopCarData.length == 0">
        暂无商品,
        <el-button type="text" style="font-size:25px" @click="toShop">前往购物</el-button>
      </div>
      <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
      <div style="margin: 10px 0;"></div>
      <el-checkbox-group v-model="checkedBuy" @change="handleCheckedBuyChange">
        <el-checkbox v-for="(s,index) in shopCarData" :label="s" :key="index">
          <div class="shop-car">
            <ul>
              <img :src="s.bookDetail.image" width="130px" height="150px" @click.prevent="preventDetail(index)">
              <li class="shop-car-name" :title=s.bookDetail.name>{{ s.bookDetail.name }}</li>
              <li class="shop-car-name" :title=s.bookDetail.author>{{ s.bookDetail.author }}</li>
              <li class="shop-car-price">￥{{ s.bookDetail.price }}</li>
              <li>
                <el-button type="primary" icon="el-icon-plus" circle @click.prevent='numAdd(index)'></el-button>
                <input type="text" class="input-number" v-model="s.num" disabled>
                <el-button type="danger" icon="el-icon-minus" circle @click.prevent='numReduce(index)'></el-button>
              </li>
              <el-button type="danger" plain style="width:130px" @click.prevent="deleteOne(index)">删除</el-button>
            </ul>
          </div>
        </el-checkbox>
      </el-checkbox-group>
      <div class="shop-car-cost">
          <span style="font-size:20px;margin-right:5px">费用:</span>
          <span :cost="cost" style="color:red;font-size:22px">{{this.cost}}</span>
        </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="clearCar">清 空</el-button>
        <el-button type="primary" @click="buyBook">购 买</el-button>
      </span>
    </el-dialog>
    <!-- 我的订单对话框 -->
    <el-dialog title="我的订单" :visible.sync="orderDialogTableVisible">
      <el-table
        :data="myShopOrder"
        style="width: 100%">
        <el-table-column
          label="下单时间"
          width="200">
          <template slot-scope="scope">
            <span>{{ scope.row.shopTime }}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="本数"
          width="130">
          <template slot-scope="scope">
            <span>{{ scope.row.allNum }}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="总价"
          width="130">
          <template slot-scope="scope">
            <span>{{ scope.row.allPrice }}</span>
          </template>
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          width="240">
          <template slot-scope="scope">
            <el-button @click="clickSee(scope.$index)" type="primary">查看</el-button>
            <el-button @click="clickDelete(scope.$index)" type="warning">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <!-- 查看订单详情 -->
    <el-dialog
      title="订单详情"
      :visible.sync="orderDetailDialogVisible"
      width="40%"
      center>
        <div class="order-detail">
          <ul v-for="(s,index) in orderDetailArr" :key="index" @click="toDetail(index)">
            <img :src="s.bookDetail.image" width="130px" height="150px">
            <li class="shop-car-name" :title=s.bookDetail.name>{{ s.bookDetail.name }}</li>
            <li class="shop-car-name" :title=s.bookDetail.author>{{ s.bookDetail.author }}</li>
            <li class="shop-car-price">￥{{ s.bookDetail.price }}</li>
            <li>
              <span>数量: </span>{{ s.num }}
            </li>
          </ul>
        </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="cancelOrderDetail">确 认</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>

import addBook from '@/views/addBook';

export default {
    data(){
      //个人中心相关验证
      //验证手机号码
      var validatePhone = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入手机号码'));
        } else {
          //验证输入的账号是否合法
          let reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
          if(!reg.test(value)){
            this.$message.error('手机号码由 0-9之间的数字 组成');
          }else{
            if(value.length == 11){
              callback();
            }else{
              this.$message.error('手机号码由 11 位数字组成');
            }
          }
        }
      };
      //验证姓名
      var validateUserName = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入姓名'));
        } else {
          callback();
        }
      };
      //验证密码
      var validatePsw = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          callback();
        }
      };
      return{
        //订单详情
        orderDetailArr:[],
        orderDetailDialogVisible:false,
        //我的订单相关
        orderData:[],
        orderArr: {},
        myShopOrder:[],
        allNum:0,
        orderDialogTableVisible: false,
        //购物车相关
        shopCarDialogVisible:false,//购物车弹框
        shopFlag:false,//是否购买 解决删除已购物品后将部分选结果减一
        checkFlag:false,//选中后 是否修改数量
        idNum:[],//只对选中后的数量变化 做总价修改
        cost:0,
        checkAll: false,//是否全选
        checkedBuy: [],
        isIndeterminate: true,//表示 checkbox 的不确定状态，用于实现全选的效果
        shopCarData:[],
        //个人中心相关
        outerVisible: false,
        innerVisible: false,
        //上传图书
        uploadBookVisible:false,
        //购买相关
        //需要购买的标志
        checkedCountFlag:0,
        //搜索框相关
        //接受返回的图书数据
        //bookData:[],
        ruleForm: {
          psw: '',
          username: '',
          phone:''
        },
        rules: {
          psw: [
            { validator: validatePsw, trigger: 'blur' }
          ],
          name: [
            { validator: validateUserName, trigger: 'blur' }
          ],
          phone: [
            { validator: validatePhone, trigger: 'blur' }
          ]
        },
        // userInfo:this.$store.state.userInfo,
        //是否显示“请登录文字”
        // pleaseFlag:true,
        activeIndex1:'1',
        searchContent:'编译原理',
        partSort: [
            {
                name: '图书',
                pathname: '/book'
            }
        ],
        allSort: [
              {
                  name: '全部',
              },
              {
                  name: '文学',
              },
              {
                  name: '生活',
              },
              {
                  name: '科技',
              },
              {
                  name: '童话',
              },
          ],
      }
    },
    components: {
        iAddBook:addBook,
    },
    methods:{
        //分类相关
        toSort(val){
          if(val == "全部"){
            //刷新页面
            this.$router.go(0);
          }else{
            this.$emit("listenToChildEventSearch",val);
          }
        },
        //首页搜索框相关
        //搜索框聚焦
        searchFocus(){
          this.searchContent = '';
          this.$message({
              message: '可输入书名或者作者名',
              type: 'success'
          });
        },
        //搜索框失焦
        searchBlur(){
          if(this.searchContent == ''){
            this.searchContent = '编译原理';
          }
        },
        //点击搜索
        searchBook(){
          this.$emit("listenToChildEventSearch",this.searchContent);
        },
        //购物车相关
        //删除某一个购物车商品
        deleteOne(index){
          for(var i = 0;i < this.idNum.length;i++){
            if(this.$store.state.shopCar[index].bookDetail.id == this.idNum[i]){
              if(this.checkFlag){
                this.cost -= this.$store.state.shopCar[index].num * this.$store.state.shopCar[index].bookDetail.price;
                this.$store.commit('deleteOneBook',index);
              }
            }
          }
          this.$store.commit('deleteOneBook',index);
        },
        //购买数量加一
        numAdd(index){
          if(this.$store.state.shopCar[index].num < 100){
            //alert("this.$store.state.shopCar[index].num   " + this.$store.state.shopCar[index].num);
            var oldCost = this.$store.state.shopCar[index].num * this.$store.state.shopCar[index].bookDetail.price;
            this.$store.state.shopCar[index].num++;
            
            console.log('this.idNum.length  ' + this.idNum.length);
            //只对选中的商品数量加减时 总价才发生变化
            for(var i = 0;i < this.idNum.length;i++){
              if(this.$store.state.shopCar[index].bookDetail.id == this.idNum[i]){
                if(this.checkFlag){
                  this.cost -= oldCost;
                  this.cost += this.$store.state.shopCar[index].num * this.$store.state.shopCar[index].bookDetail.price;
                }
              }
            }
          }
        },
        //购买数量减一
        numReduce(index){
          //若数量只有1 再减少即为删除
          if(this.$store.state.shopCar[index].num == 1){
            this.deleteOne(index);
          }else{
            var oldCost = this.$store.state.shopCar[index].num * this.$store.state.shopCar[index].bookDetail.price;
            this.$store.state.shopCar[index].num--;
            for(var i = 0;i < this.idNum.length;i++){
              if(this.$store.state.shopCar[index].bookDetail.id == this.idNum[i]){
                if(this.checkFlag){
                  this.cost -= oldCost;
                  this.cost += this.$store.state.shopCar[index].num * this.$store.state.shopCar[index].bookDetail.price;
                }
              }
            }
          }
        },
        //全选
        handleCheckAllChange(val) {
          this.idNum.splice(0, this.idNum.length);
          this.orderData.splice(0, this.orderData.length);
          this.allNum = 0;
          //this.checkedCountFlag = 0;
          //选中后 修改数量 引起修改价格标志
          this.checkFlag = true;
          this.cost = 0;
          this.checkedBuy = val ? this.shopCarData : [];
          this.isIndeterminate = false;
          if(val){
            this.checkedCountFlag = this.shopCarData.length;
            for(var i = 0;i < this.shopCarData.length;i++){
              this.cost += this.shopCarData[i].bookDetail.price * this.shopCarData[i].num;
              //将所选商品存入订单数组
              this.orderData.push(
                {
                  'num':this.shopCarData[i].num,
                  'bookDetail':this.shopCarData[i].bookDetail
                }
              );
              this.allNum += this.shopCarData[i].num;
              //记录所选商品id
              this.idNum.push(this.shopCarData[i].bookDetail.id);
            }
          }else{
            this.cost = 0;
          }
        },
        //部分选
        handleCheckedBuyChange(value) {
          //删除存放要购买商品数组所有元素
          this.orderData.splice(0, this.orderData.length);
          this.idNum.splice(0, this.idNum.length);
          this.allNum = 0;
          //this.checkedCountFlag = 0;
          console.log("value     " + value);
          this.checkFlag = true;
          this.cost = 0;
          let checkedCount = value.length;
          if(this.shopFlag){
            checkedCount--;
          }
          //是否勾选物品标志
          this.checkedCountFlag = checkedCount;
          this.checkAll = checkedCount === this.shopCarData.length;
          this.isIndeterminate = checkedCount > 0 && checkedCount < this.shopCarData.length;
          for(var i = 0;i < checkedCount;i++){
            this.cost += value[i].bookDetail.price * value[i].num;
            //将所选商品存入订单数组
            this.orderData.push(
              {
                'num':value[i].num,
                'bookDetail':value[i].bookDetail
              }
            );
            this.allNum += value[i].num;
            //记录所选商品id
            this.idNum.push(value[i].bookDetail.id);
          }
        },
        //阻止购物车中点击图片跳转详情页的默认事件
        preventDetail(index){
          this.$store.commit('bookDetail',this.shopCarData[index].bookDetail);
          this.$router.push('/details');
        },
        //购物车为空
        toShop(){
          this.shopCarDialogVisible = false;
          window.scrollTo(0, 550)//第二个0表示竖直滚动距离
        },
        //点击购物车
        shopCar(){
          //判断是否登录
          if(this.$store.state.userInfo.status == 1 || this.$store.state.userInfo.status == 0){
            this.shopCarDialogVisible = true;
            this.shopCarData = this.$store.state.shopCar;
          }else{
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
          }
          console.log(this.$store.state.shopCar);
        },
        //购买相关
        //买书
        buyBook(){
          this.orderArr = {};
          if(this.checkedCountFlag == 0){
            this.$message({
              message: '请勾选购物车的物品',
              type: 'error'
            });
          }else{
            this.$message({
              message: '成功购买',
              type: 'success'
            });
            //获取购买时间
            var _this = this;
            let yy = new Date().getFullYear();
            let mm = new Date().getMonth()+1;
            let dd = new Date().getDate();
            let hh = new Date().getHours();
            let mf = new Date().getMinutes()<10 ? '0'+new Date().getMinutes() : new Date().getMinutes();
            let ss = new Date().getSeconds()<10 ? '0'+new Date().getSeconds() : new Date().getSeconds();
            _this.gettime = yy+'-'+mm+'-'+dd+' '+hh+':'+mf+':'+ss;
            this.orderArr = {
                'allNum':this.allNum,
                'allPrice':this.cost,
                'shopTime':_this.gettime,
                'orderData':this.orderData
            };
            this.$store.commit('addOrder',this.orderArr);
            //从购物车中 删除已购物品
            for(var i = 0;i < this.orderData.length;i++){
              this.$store.commit('deleteHadShop',this.orderData[i].bookDetail.id);
            }
            this.shopFlag = true;
            this.cost = 0;
            this.shopCarDialogVisible = false;
          }
        },
        //清空购物车
        clearCar(){
          this.$store.commit('clearCar');
          this.$message({
              message: '成功清空购物车',
              type: 'success'
          });
        },
        //跳转
        handleSelect(key, keyPath) {
          console.log(key, keyPath);
        },
        toHome(){
          this.$router.push('/yiyi');
            //this.$router.go(0);
        },
        login(){
          this.$router.push('/login');
        },
        exit(){
          this.$router.push('/login');
        },
        adminShop(){
          this.$router.push('/adminShop');
        },
        //用户上传图书
        toUploadBook(){
          if(this.$store.state.userInfo.status == 0){
            this.uploadBookVisible = true;
          }else{
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
          }
        },
        //个人中心相关
        //判断是否登录
        judgeLogin(){
          if(this.$store.state.userInfo.status == 1 || this.$store.state.userInfo.status == 0){
            this.outerVisible = true;
            this.ruleForm.username = this.$store.state.userInfo.username;
            this.ruleForm.psw = this.$store.state.userInfo.password;
            this.ruleForm.phone = this.$store.state.userInfo.phone;
          }else{
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
          }
        },
        //第二个保存按钮
        secondSave(formName){
          this.firstSave(formName);
        },
        //第一个取消按钮
        firstCancel(){
          if(this.$store.state.userInfo.username != this.ruleForm.username || this.$store.state.userInfo.phone != this.ruleForm.phone || this.$store.state.userInfo.password != this.ruleForm.psw){
            this.innerVisible = true;
          }else{
            this.outerVisible = false;
            this.innerVisible = false;
          }
        },
        //第二个取消按钮
        secondCancel(){
          this.outerVisible = false;
          this.innerVisible = false;
        },
        //第一个保存按钮
        firstSave(formName){
          //判断是否修改内容
          if(this.$store.state.userInfo.username == this.ruleForm.username && this.$store.state.userInfo.phone == this.ruleForm.phone && this.$store.state.userInfo.psw == this.ruleForm.psw){
            //关闭个人中心
            this.secondCancel();
          }else{
            //做了修改
            this.$refs[formName].validate((valid) => {
              if (valid) {
                //修改用户信息接口
                this.$axios.post('http://localhost:8081/user/update',{
                //this.$axios.post('/changeUser',{
                  id:this.$store.state.userInfo.id,
                  phone:this.ruleForm.phone,
                  username:this.ruleForm.username,
                  psw:this.ruleForm.psw,
                  status:0,
                })
                .then(res => {
                  console.log(res.data);
                  if(res.data.message === 'success'){
                    console.log('fore           ' + res.data.data);
                    this.$message({
                        message: '修改成功',
                        type: 'success'
                    });
                    //更新用户信息
                    this.$store.state.userInfo.phone = this.ruleForm.phone;
                    this.$store.state.userInfo.username = this.ruleForm.username;
                    this.$store.state.userInfo.psw = this.ruleForm.psw;
                    console.log('22222222222         ' + this.$store.state.userInfo.psw,this.$store.state.userInfo.username,this.$store.state.userInfo.phone);
                    //关闭个人中心
                    this.secondCancel();
                  }else if(res.data.message === 'error'){
                    this.$message.error('修改失败');
                  } 
                }).catch( err => {
                  //请求异常
                  console.log(err);
                });
              } else {
                this.$message.error('请根据提示重新填写');
                return false;
              }
            });
          }
        },
        //我的订单相关
        //点击我的订单
        ownOrder(){
          //判断是否登录
          if(this.$store.state.userInfo.status == 1 || this.$store.state.userInfo.status == 0){
            this.orderDialogTableVisible = true;
            this.myShopOrder = this.$store.state.myOrder;
          }else{
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
          }
        },
        //查看订单详情
        clickSee(index){
          this.orderDetailDialogVisible = true;
          this.orderDetailArr = this.$store.state.myOrder[index].orderData;
        },
        //删除订单
        clickDelete(index){
          this.$store.commit('deleteOneOrder',index);
        },
        toDetail(index){
          this.$store.commit('bookDetail',this.orderDetailArr[index].bookDetail);
          this.$router.push('/details');
        },
        cancelOrderDetail(){
          this.orderDetailDialogVisible = false;
        },
    }
}
</script>

<style scoped>
/*购物车相关*/
.no-shop{
  /* border: 1px solid red; */
  font-size:20px ;
  color: #f56c6c;
  text-align: center;
}
.input-number{
  border: 1px solid #409eff;
  border-radius: 8px;
  width: 40px;
  height: 30px;
  text-align: center;
}
.shop-car-cost{
  float: right;
  margin-right: 60px;
}
.shop-car{
  /* border: 1px solid red; */
  width: 130px;
  margin-bottom: 10px;
}
.shop-car li{
  list-style: none;
}
.shop-car-name{
  white-space:nowrap;
  overflow:hidden;
  margin: 5px 0;
}
.shop-car-price{
  color: #cc3300;
  font-weight: bold;
}
/* 我的订单相关 */
.order-detail li{
  list-style: none; 
}
.order-detail ul{
  /* border: 1px solid red; */
  width: 130px;
  display: inline-block;
  margin: 10px 27px;
  cursor: pointer;
}
/*轮播图分割线*/
.lun-dividing-line{
  /*背景色渐变*/
  width: 100%;
  height: 5px;
  background: linear-gradient(right, #e97e7e, #86e6b6);
}
/*标题，搜索框，购物车样式*/
.shopping-car{
  margin-right: 3%;
}
.search-box{
  display: flex;
  justify-content: space-between;
  align-items:center;
  /* border: 1px solid red; */
}
.search{
  display: flex;
  flex-direction: row;
  align-items:center;
  width: 500px;
  height: 100px;
  line-height: 100px;
  animation: fade-in;/*动画名称*/  
  animation-duration: 2s;/*动画持续时间*/  
  -webkit-animation:fade-in 2s;/*针对webkit内核*/ 
}
.search-all{
  border: 2px solid #e6a23c;
  width: 430px;
  height: 36px;
  padding-left: 10px;
}
.search input:focus{
  background:none;
  outline:none;
  border:0px;
  border: 2px solid#ff2832;
}

/* 个人中心相关 */
.header-ruleForm{
  margin-left: 150px;
}
.please-login,.welcome{
  float: right;
  margin-right: 95px;
  height: 60px;
  line-height: 60px;
}
.exit{
  float: right;
  margin-right: 25px;
  margin-top: 12px;
}
@keyframes fade-in {  
  0% {opacity: 0;}/*初始状态 透明度为0*/  
  40% {opacity: 0;}/*过渡状态 透明度为0*/  
  100% {opacity: 1;}/*结束状态 透明度为1*/  
}  
@-webkit-keyframes fade-in {/*针对webkit内核*/  
  0% {opacity: 0;}  
  40% {opacity: 0;}  
  100% {opacity: 1;}  
}  
.sort-box{
  /* border: 1px solid red; */
}
.part-sort:hover{
}
.el-menu--horizontal>.el-submenu .el-submenu__title {
  height: 40px;
  line-height: 40px;
  border-bottom: 2px solid transparent;
  color: #909399;
}
.allSort li{
  float: left;
  list-style-type: none;
  margin: 20px;
}
.allSort li:hover{
  color: #409eff;
  border-bottom: 1.5px solid #ff7f27;
  cursor: pointer;
}
</style>