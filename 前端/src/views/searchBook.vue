<template>
  <div>
    <div class="searchBook-all-book">
      <el-button type="primary" @click="seeAllBook">查看所有图书</el-button>
    </div>
    <div class="searchBook-search-box">
      <el-input placeholder="请输入书名/作者" v-model="searchContent" class="input-with-select">
        <el-button slot="append" icon="el-icon-search" @click="searchBookInfo"></el-button>
      </el-input>
    </div>
    <el-table
      :data="bookData"
      style="width: 100%"
      :row-class-name="tableRowClassName">
      <el-table-column
        label="图片"
        width="180">
        <template slot-scope="scope">
          <el-image
            style="width: 130px; height: 150px"
            :src="scope.row.image" >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column
        label="书名"
        width="250">
        <template slot-scope="scope">
          <span class="searchBook-name">{{ scope.row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="作者"
        width="150">
        <template slot-scope="scope">
          <span class="searchBook-author">{{ scope.row.author }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="简介"
        width="450">
        <template slot-scope="scope">
          <span class="searchBook-detail">{{ scope.row.detail }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="价格"
        width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.price }}</span>
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
      width="60%"
      center>
      <el-image
        style="width: 130px; height: 150px;margin-left:370px"
        :src="this.ruleForm2.image">
      </el-image>
      <div class="searchBook-changeImg">
        更换图片
      </div>
      <el-upload
        class="avatar-uploader"
        action="/changeBook"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload">
          <img v-if="imageUrl" :src="imageUrl" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
      <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
        <el-form-item label="书名" prop="name">
          <el-input v-model="ruleForm2.name" style="width:450px" placeholder="请输入书名"></el-input>
        </el-form-item>
        <el-form-item label="作者" prop="author">
          <el-input v-model="ruleForm2.author" style="width:270px" placeholder="请输入作者"></el-input>
        </el-form-item>
        <el-form-item label="简介" prop="detail">
          <el-input type="textarea" v-model="ruleForm2.detail" placeholder="请输入简介"></el-input>
        </el-form-item>
        <el-form-item label="价格" prop="price">
          <el-input v-model="ruleForm2.price" style="width:270px" placeholder="请输入价格"></el-input>
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
        bookData:[],
        //搜索相关
        searchContent: '',
        //修改页面相关
        //当前点击的行
        tempIndex:'',
        //修改标志
        changeFlag:false,
        //关闭修改页面
        changePage: false,
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
    //一打开查询图书页面，调用查询所有图书方法
    this.allBook();
  },
  methods: {
    //查询所有图书
    allBook(){
      //查询所有图书接口
      this.$axios.get('http://localhost:8081/book/list')
      //this.$axios.get('/searchBook')
      .then(res => {
        if(res.data.message === 'success'){
          console.log(res.data.data);
          this.bookData = res.data.data;
        }else if(res.data.message === 'error'){
          this.$message.error('查询失败');
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
    //查询所有图书
    seeAllBook(){
      this.allBook();
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
      this.imageUrl = '';
      this.changeFlag = false;
      this.tempIndex = index;
      console.log(this.bookData[index].name);
      this.changePage = true;

      // this.ruleForm2 = this.bookData[index];
      this.ruleForm2.image = this.bookData[index].image;
      this.ruleForm2.name = this.bookData[index].name;
      this.ruleForm2.author = this.bookData[index].author;
      this.ruleForm2.price = this.bookData[index].price;
      this.ruleForm2.detail = this.bookData[index].detail;
    },
    //点击删除按钮
    clickDelete(index) {
      this.changeFlag = false;
      console.log(this.bookData[index].bookname);
      //删除接口
      this.$axios.post('http://localhost:8081/book/delete',{
      //this.$axios.post('/deleteBook',{
        id:this.bookData[index].id,
      })
      .then(res => {
        console.log(res.data);
        if(res.data.message === 'success'){
          //删除数组中的某个元素，一次删除一个
          this.bookData.splice(index,1);
          this.$message({
              message: '删除成功',
              type: 'success'
          });

        }else if(res.data.message === 'error'){
          this.$message.error('修改失败');
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
    //点击确定修改按钮
    sureChange(formName){
      console.log('11111111111           ' + this.imageUrl);
      //判断是否修改了内容
      if(this.bookData[this.tempIndex].name == this.ruleForm2.name && this.bookData[this.tempIndex].author == this.ruleForm2.author && this.bookData[this.tempIndex].price == this.ruleForm2.price && this.bookData[this.tempIndex].detail == this.ruleForm2.detail && this.imageUrl == ''){
      // if(this.bookData[this.tempIndex] == this.ruleForm2){
        this.$message({
            message: '未做任何修改，不予提交',
            type: 'warning'
        });
      }else{
        //做了修改
        this.$refs[formName].validate((valid) => {
          if (valid) {
            //修改接口
            this.$axios.post('http://localhost:8081/book/update',{
            //this.$axios.post('/changeBook',{
              name:this.ruleForm2.name,
              price:this.ruleForm2.price,
              author:this.ruleForm2.author,
              detail:this.ruleForm2.detail,
              image:this.imageUrl,
              id:this.bookData[this.tempIndex].id,
              status:0,
            })
            .then(res => {
              if(res.data.message === 'success'){
                console.log('fore           ' + res.data.data);
                this.$message({
                    message: '修改成功',
                    type: 'success'
                });
                //更新图书信息
                // this.bookData[this.tempIndex].name = res.data.data.name;
                // this.bookData[this.tempIndex].author = res.data.data.author;
                // this.bookData[this.tempIndex].price = res.data.data.price;
                // this.bookData[this.tempIndex].detail = res.data.data.detail;
                this.bookData[this.tempIndex].name = this.ruleForm2.name;
                this.bookData[this.tempIndex].price = this.ruleForm2.price;
                this.bookData[this.tempIndex].detail = this.ruleForm2.detail;
                this.bookData[this.tempIndex].author = this.ruleForm2.author;

                if(this.imageUrl == ''){
                  this.bookData[this.tempIndex].image = this.ruleForm2.image;
                }else{
                  // this.bookData[this.tempIndex].image = 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/test1.jpg';
                  this.bookData[this.tempIndex].image = res.data.data.image;
                }
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
    //查询某本图书
    searchBookInfo(){
      //查询某本图书接口
      this.$axios.post('http://localhost:8081/book/page',{
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
          this.bookData = res.data.data;
          console.log("fore         " + this.bookData);
        }else if(res.data.status === 'error'){
          this.$message.error('查询失败');
          this.searchContent = '';
        }
      }).catch( err => {
        //请求异常
        console.log(err);
      });
    },
    //上传相关
    handleAvatarSuccess(res, file) {
      this.imageUrl = res;
    },
    //对上传的图片的要求
    beforeAvatarUpload(file) {
      // const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      // if (!isJPG) {
      //   this.$message.error('上传头像图片只能是 JPG 格式!');
      // }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      // return isJPG && isLt2M;
      return isLt2M;
    }
  },
  }
</script>

<style>
/* 若使用scoped 则修改后的数据无法高亮 */
.el-table .warning-row {
  background: oldlace;
}
.searchBook-search-box{
  width: 500px;
  margin: 0 auto;
}
.searchBook-all-book{
  margin: 20px 0 0 20px;
}
.searchBook-detail{
  overflow: hidden;
  -webkit-line-clamp: 4;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
.searchBook-name{
  overflow: hidden;
  -webkit-line-clamp: 4;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
.searchBook-author{
  overflow: hidden;
  -webkit-line-clamp: 4;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
/* 上传相关 */
.searchBook-changeImg{
  color: #66b1ff;
  margin: 10px 0 10px 405px;
  font-size: 18px;
}
.avatar-uploader .el-upload {
  margin-left: 370px;
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 40px;
  color: #66b1ff;
  width: 130px;
  height: 150px;
  line-height: 150px;
  text-align: center;
}
.avatar {
  width: 130px;
  height: 150px;
  display: block;
}
</style>
