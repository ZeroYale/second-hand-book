import Mock from 'mockjs';

//用mock模拟一个'/userlogin/login'的post请求，请求参数从req.body得到
Mock.mock('/changeBook', 'post', (req) => {
    var userInfo = {
        name: '',
        author: '',
        image: '',
        price: '',
        detail: '',
        status: 0,
    };
    console.log('back          ' + req.body);
    userInfo.author = req.body.author;
    userInfo.price = req.body.price;
    userInfo.detail = req.body.detail;
    if (req.body.image != '') {
        userInfo.image = 'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg';
    }
    userInfo.name = req.body.name;
    // userInfo.author = '1';
    // userInfo.price = '1';
    // userInfo.detail = '1';
    // userInfo.image = 'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg';
    // userInfo.name = '1';
    return {
        //回传注册信息给前端
        message: "success",
        data: userInfo
    };
})