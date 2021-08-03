<template>
  <div>
    <div class="searchUser-all-user">
      <el-button type="primary" @click="seeAllUser">查看所有用户</el-button>
    </div>
    <div class="searchUser-search-box">
      <el-input placeholder="请输入姓名/手机号码" v-model="searchContent" class="input-with-select">
        <el-button slot="append" icon="el-icon-search" @click="searchUserInfo"></el-button>
      </el-input>
    </div>
    <el-table
      :data="userData"
      style="width: 100%"
      :row-class-name="tableRowClassName">
      <el-table-column
        label="姓名"
        width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.username }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="手机号码">
        <template slot-scope="scope">
          <span>{{ scope.row.phone }}</span>
        </template>
      </el-table-column>
      <el-table-column
        fixed="right"
        label="操作"
        width="200">
        <template slot-scope="scope">
          <el-button @click="clickEdit(scope.$index)" type="primary" size="mini">修改</el-button>
          <el-button @click="clickDelete(scope.$index)" type="danger" size="mini">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog
      title="修改"
      :visible.sync="changePage"
      width="30%"
      center>
      <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
        <el-form-item label="姓名" prop="username">
          <el-input v-model="ruleForm2.username" style="width:270px" placeholder="请输入姓名"></el-input>
        </el-form-item>
        <el-form-item label="手机号码" prop="phone">
          <el-input v-model="ruleForm2.phone" style="width:270px" placeholder="请输入手机号码" maxlength=11></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="changePage = false">取 消</el-button>
        <el-button type="primary" @click="sureChange('ruleForm2')">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  export default {
    data(){
      //修改页面相关
      //验证手机号码
      var validateId = (rule, value, callback) => {
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
      var validateUsername = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入姓名'));
        } else {
          callback();
        }
      };
      return{
        userData:[],
        //搜索相关
        searchContent: '',
        //修改页面相关
        //当前点击的行
        tempIndex:'',
        //修改标志
        changeFlag:false,
        changePage: false,
        ruleForm2: {
          username: '',
          phone: '',
        },
        rules2: {
          username: [
            {message: '请输入姓名', trigger: 'blur' },
            { validator: validateUsername, trigger: 'blur' }
          ],
          phone: [
            {message: '请输入手机号码', trigger: 'blur'},
            { validator: validateId, trigger: 'blur' },
          ],
        }
      }
  },
  created(){
    //一打开页面，调用查询所有用户的方法
    this.allUser();
  },
  methods: {
    //查询所有用户
    allUser(){
      //查询所有用户接口
      this.$axios.get('http://localhost:8081/user/list')
      //this.$axios.get('/searchUser')
      .then(res => {
        if(res.data.message === 'success'){
          console.log(res.data.data);
          this.userData = res.data.data;
        }else if(res.data.message === 'error'){
          this.$message.error('查询失败');
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
    //查询所有用户
    seeAllUser(){
      this.allUser();
    },
    //对修改后的内容高亮显示
    tableRowClassName({row, rowIndex}) {
      if (rowIndex === this.tempIndex && this.changeFlag) {
        return 'warning-row';
      }
      return '';
    },
    //点击修改按钮
    clickEdit(index) {
      this.changeFlag = false;
      this.tempIndex = index;
      console.log(this.userData[index].username);
      this.changePage = true;
      /*
        此处不使用this.ruleForm2 = this.userData[index];
        是因为this.ruleForm2存在数据的双向绑定，若使用
        则修改页面修改后无法判断是否做出了修改
      */
      this.ruleForm2.phone = this.userData[index].phone;
      this.ruleForm2.username = this.userData[index].username;
    },
    //删除用户
    clickDelete(index) {
      this.changeFlag = false;
      console.log(this.userData[index].username);
      //删除用户接口
      this.$axios.post('http://localhost:8081/user/delete',{
      //this.$axios.post('/deleteUser',{
        id:this.userData[index].id,
      })
      .then(res => {
        console.log(res.data);
        if(res.data.message === 'success'){
          //删除数组中的某个元素，一次删除一个
          this.userData.splice(index,1);
          this.$message({
              message: '删除成功',
              type: 'success'
          });
        }else if(res.data.message === 'error'){
          this.$message.error('删除失败');
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
    sureChange(formName){
      //判断是否修改内容
      if(this.userData[this.tempIndex].username == this.ruleForm2.username && this.userData[this.tempIndex].phone == this.ruleForm2.phone){
        this.$message({
            message: '未做任何修改，不予提交',
            type: 'warning'
        });
      }else{
        //未修改
        this.$refs[formName].validate((valid) => {
          if (valid) {
            //修改用户信息接口
            this.$axios.post('http://localhost:8081/user/update',{
            //this.$axios.post('/changeUser',{
              phone:this.ruleForm2.phone,
              username:this.ruleForm2.username,
              id:this.userData[this.tempIndex].id,
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
                this.userData[this.tempIndex].username = res.data.data.username;
                this.userData[this.tempIndex].phone = res.data.data.phone;
                this.changePage = false;
                this.changeFlag = true;
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
    //查询某个用户
    searchUserInfo(){
      //根据姓名或手机号码查询某个用户接口
      this.$axios.post('http://localhost:8081/user/page',{
        data:this.searchContent,
        status:0,
      })
      .then(res => {
        console.log("fore         " + res.data.data);
        if(res.data.message === 'success'){
          this.$message({
              message: '查询成功',
              type: 'success'
          });
          console.log("fore         " + res.data.data);
          this.userData = res.data.data;
          console.log("fore         " + this.userData);
        }else if(res.data.message === 'error'){
          this.$message.error('查询失败');
          this.searchContent = '';
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
  },
  }
</script>

<style>
/* 若使用scoped 则修改后的数据无法高亮 */
.el-table .warning-row {
  background: oldlace;
}
.searchUser-search-box{
  width: 500px;
  margin: 0 auto;
}
.searchUser-all-user{
  margin: 20px 0 0 20px;
}
</style>
