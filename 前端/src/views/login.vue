<template>
  <div class="backImg">
    <div class="login-box">
      <h1 class="login-title" style="font-family: JMXMK,monospace">易易</h1>
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="手机号码" prop="phone">
          <el-input v-model="ruleForm.phone" placeholder="请输入手机号码" style="width:300px" maxlength=11></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="psw">
          <el-input placeholder="请输入密码" type="password" v-model="ruleForm.psw" autocomplete="off" style="width:300px"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login('ruleForm')">登陆</el-button>
          <el-button @click="toRegisterPage('ruleForm2')">注册</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div>
      <el-dialog
        title="注册"
        :visible.sync="registerPage"
        width="40%"
        :before-close="handleClose"
        center>
        <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm" style="margin-left:14%">
          <el-form-item label="姓名" prop="username">
            <el-input v-model="ruleForm2.username" style="width:270px" placeholder="请输入姓名"></el-input>
          </el-form-item>
          <el-form-item label="手机号码" prop="phone">
            <el-input v-model="ruleForm2.phone" style="width:270px" placeholder="请输入手机号码" maxlength=11></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="pass">
            <el-input type="password" v-model="ruleForm2.pass" autocomplete="off" style="width:270px" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPass">
            <el-input type="password" v-model="ruleForm2.checkPass" autocomplete="off" style="width:270px" placeholder="请再次输入密码"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="registerPage = false">取 消</el-button>
          <el-button type="primary" @click="register('ruleForm2')">立即注册</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      //登录相关
      //验证账号
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
      //验证密码
      var validatePsw = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          callback();
        }
      };
      //注册相关
      var validateUsername = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入姓名'));
        } else {
          callback();
        }
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm2.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        //登陆相关
        tempPhone:'',
        tempPsw:'',
        ruleForm: {
          phone: '',
          psw: '',
        },
        rules: {
          phone: [
            { validator: validateId, trigger: 'blur' },
          ],
          psw: [
            { validator: validatePsw, trigger: 'blur' }
          ]
        },
        //注册相关
        registerPage: false,
        ruleForm2: {
          username: '',
          phone: '',
          pass: '',
          checkPass: '',
        },
        rules2: {
          username: [
            {required: true,message: '请输入姓名', trigger: 'blur' },
            { validator: validateUsername, trigger: 'blur' }
          ],
          phone: [
            {required: true,message: '请输入手机号码', trigger: 'blur'},
            { validator: validateId, trigger: 'blur' },
          ],
          pass: [
            {required: true,message: '请输入密码', trigger: 'blur'},
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            {required: true,message: '请再次输入密码', trigger: 'blur'},
            { validator: validatePass2, trigger: 'blur' }
          ],
        }
      };
    },
    methods: {
      //登陆
      login(formName) {
        this.tempPhone = this.ruleForm.phone;
        this.temPsw = this.ruleForm.psw;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            //登陆接口
            this.$axios.post('http://localhost:8081/user/login', this.ruleForm)
            //this.$axios.post('/login', this.ruleForm)
            .then( res => {
              console.log('1111111           ' + res.data.data);
              if(res.data.message === 'pswError'){
                //清除表单内容
                this.$refs[formName].resetFields();
                this.ruleForm.phone = this.tempPhone;
                //使用的是element-ui的message组件
                this.$message({
                  message: '密码错误！',
                  type: 'error'
                })
              } else if(res.data.message === 'userNotExist'){
                //清除表单内容
                this.$refs[formName].resetFields();
                this.$message({
                  message: '用户不存在！',
                  type: 'error'
                });
              } else if(res.data.message === 'success'){
                //将用户信息保存到vuex中
                this.$store.commit('userInfo',res.data.data);
                //登陆成功
                this.$router.push('/');
                this.$message({
                    message: '登陆成功',
                    type: 'success'
                });
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
        this.ruleForm.phone = this.tempPhone;
        this.ruleForm.psw = this.temPsw;
      },
      //注册相关
      toRegisterPage(formName){
        this.registerPage = true;
        // this.$refs[formName].resetFields();
      },
      handleClose(done) {
        // this.$confirm('确认关闭？')
        //   .then(_ => {
        //     done();
        //   })
        //   .catch(_ => {});
        done();
      },
      register(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            //注册接口
            this.$axios.post('http://localhost:8081/user/register',{
            //this.$axios.post('/register',{
              phone:this.ruleForm2.phone,
              password:this.ruleForm2.pass,
              username:this.ruleForm2.username,
            })
            .then(res => {
              console.log(res.data);
              if(res.data.message === 'success'){
                //将用户注册信息保存到vuex中
                this.$store.commit('userInfo',{
                  phone:this.ruleForm2.phone,
                  pass:this.ruleForm2.pass,
                  username:this.ruleForm2.username,
                  status:0,
                });
                // console.log(res.data.data.pass);
                this.$confirm('注册成功，是否现在登陆？')
                .then(_ => {
                  this.$router.push('/');
                  //使用的是element-ui的message组件
                  this.$message({
                      message: '登录成功',
                      type: 'success'
                  });
                })
                .catch(_ => {
                  this.$message({
                      message: '注册成功',
                      type: 'success'
                  });
                  this.registerPage = false;
                  this.ruleForm.phone = this.ruleForm2.phone;
                  this.ruleForm.psw = this.ruleForm2.pass;
                });
              }else if(res.data.message === 'error'){
                this.$message.error('注册失败');
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
      },
    }
  }
</script>

<style scoped>
.backImg{
  width:100%;  
  height:100%;  /**宽高100%是为了图片铺满屏幕 */
  z-index:-1;
  position: absolute;
  background-image: url('../assets/back.jpg');
  background-repeat: no-repeat;
  background-position: bottom center;
}
.login-box{
  width:446px;
  height:268px;
  margin: 13% auto;
  padding: 24px 0;
  background: #fff;
  opacity:0.85;/*Mozilla*/
}
.login-title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
</style>
