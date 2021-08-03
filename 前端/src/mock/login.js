import Mock from 'mockjs';

let userSet = [{
            id: '1',
            phone: '00000000000',
            password: '1',
            status: 0,
            username: '普通张'
        },
        {
            id: '2',
            phone: '11111111111',
            password: '1',
            status: 1,
            username: '管理王'
        },
        {
            id: '3',
            phone: '12222222222',
            password: '1',
            status: 1,
            username: '管理孙'
        },
        {
            id: '4',
            phone: '44444444444',
            password: '4',
            status: 1,
            username: '管理四'
        },
    ]
    //用mock模拟一个'/userlogin/login'的post请求，请求参数从req.body得到
Mock.mock('/login', 'post', (req) => {
    //解析请求体，前端传的可能是JSON字符串
    let body = JSON.parse(req.body);
    let phone = body.phone;
    let password = body.psw;
    //遍历模拟数据，检查该用户是否存在，并比对密码
    for (let user of userSet) {
        if (user.phone === phone) {
            if (user.password !== password) {
                return {
                    message: 'pswError',
                };
            } else {
                return {
                    message: 'success',
                    data: user
                };
            }
        }
    }
    //用户不存在
    return {
        message: 'userNotExist',
    };
})