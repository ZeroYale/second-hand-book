import Mock from 'mockjs';

Mock.mock('/deleteUser', 'post', (req) => {
    let body = JSON.parse(req.body);
    console.log(body);
    if (body) {
        return {
            message: 'success'
        };
    } else {
        return {
            message: 'error'
        };
    }
})