<template>
  <div>
    <div class="addBook-changeImg-box">
      <div class="addBook-changeImg-word">
        图片
      </div>
      <el-upload
        class="addBook-avatar-uploader"
        action="http://localhost:8081/upload/toUpload"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload">
        <img v-if="imageUrl" :src="imageUrl" class="addBook-avatar">
        <i v-else class="el-icon-plus addBook-avatar-uploader-icon"></i>
      </el-upload>
    </div>
    <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
      <el-form-item label="书名" prop="name">
        <el-input v-model="ruleForm2.name" style="width:450px" placeholder="请输入书名"></el-input>
      </el-form-item>
      <el-form-item label="作者" prop="author">
        <el-input v-model="ruleForm2.author" style="width:270px" placeholder="请输入作者"></el-input>
      </el-form-item>
      <el-form-item label="简介" prop="detail">
        <el-input type="textarea" v-model="ruleForm2.detail" placeholder="请输入简介" style="width:400px"></el-input>
      </el-form-item>
      <el-form-item label="价格" prop="price">
        <el-input v-model="ruleForm2.price" style="width:270px" placeholder="请输入价格"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer" style="margin-left:100px">
      <el-button @click="resetForm('ruleForm2')" style="margin-right:50px">重置</el-button>
      <el-button type="primary" @click="sureChange('ruleForm2')">提交</el-button>
    </span>
  </div>
</template>

<script>
export default {
  data(){
    //验证书名
    var validateBookname = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入书名'));
      } else {
        callback();
      }
    };
    //验证作者
    var validateAuthor = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入作者'));
      } else {
        callback();
      }
    };
    //验证价格
    var validatePrice = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入价格'));
      } else {
        //只能输入正数
        let reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
        if(!reg.test(value)){
          this.$message.error('请输入 正数 ');
        }else{
          callback();
        }
      }
    };
    //验证简介
    var validateDetail = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入简介'));
      } else {
        callback();
      }
    };
    return{
      //上传图片相关
      imageUrl: '',
      // imageUrl: 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/test1.jpg',
      ruleForm2: {
        name: '',
        author: '',
        price: '',
        detail: '',
        image:'',
      },
      rules2: {
        name: [
          { validator: validateBookname, trigger: 'blur' }
        ],
        detail: [
          { validator: validateDetail, trigger: 'blur' }
        ],
        price: [
          { validator: validatePrice, trigger: 'blur' }
        ],
        author: [
          { validator: validateAuthor, trigger: 'blur' }
        ],
      }
    }
  },
  created(){
    this.imageUrl = '';
  },
  methods:{
    //重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields();
      this.imageUrl = '';
    },
    //上传相关
    handleAvatarSuccess(res, file) {
      this.imageUrl = res;
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isLt2M;
    },
    //点击确定按钮
    sureChange(formName){
      console.log('11111111111           ' + this.imageUrl);
      this.$refs[formName].validate((valid) => {
        if (valid) {
          //添加图书接口
          this.$axios.post('http://localhost:8081/book/save',{
            name:this.ruleForm2.name,
            price:this.ruleForm2.price,
            author:this.ruleForm2.author,
            detail:this.ruleForm2.detail,
            // image:'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/test1.jpg',
            image:this.imageUrl,
            status:0,
          })
          .then(res => {
            if(res.data.message === 'success'){
              console.log('fore           ');
              this.$message({
                  message: '添加成功',
                  type: 'success'
              });
              this.resetForm(this.ruleForm2);
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

<style>
.addBook-changeImg-box{
  position: relative;
  height: 220px;
}
.addBook-changeImg-word{
  position: absolute;
  color: #606266;
  line-height: 220px;
  margin-left: 60px;
  font-size: 14px;
}
/* 上传相关 */
.addBook-avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  margin:20px  0  20px 100px ;
}
.addBook-avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.addBook-avatar-uploader-icon {
  font-size: 40px;
  color: #66b1ff;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.addBook-avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
