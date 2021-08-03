import Mock from 'mockjs';

let userInfo = {
    username: '',
    phone: '',
    pass: '',
    status: 0,
};
//用mock模拟一个'/userlogin/login'的post请求，请求参数从req.body得到
Mock.mock('/register', 'post', (req) => {
    console.log(req.body);
    //解析请求体，前端传的可能是JSON字符串
    let body = JSON.parse(req.body);
    userInfo.phone = body.phone;
    userInfo.username = body.username;
    userInfo.pass = body.pass;
    return {
        //回传注册信息给前端
        message: "success",
        data: userInfo
    };
})