import Mock from 'mockjs';

let userInfo = [{
        username: 'lduldj1',
        phone: '17862821996',
        status: 0,
    },
    {
        username: 'hly2',
        phone: '15552201622',
        status: 0,
    },
    {
        username: 'user3',
        phone: '15880330001',
        status: 0,
    },
    {
        username: 'user4',
        phone: '15880330002',
        status: 0,
    },
    {
        username: 'user5',
        phone: '15880330003',
        status: 0,
    },
    {
        username: 'user6',
        phone: '15880330004',
        status: 0,
    },
    {
        username: 'user7',
        phone: '15880330005',
        status: 0,
    },
    {
        username: 'user8',
        phone: '15880330006',
        status: 0,
    },
    {
        username: 'user9',
        phone: '15880330007',
        status: 0,
    },
    {
        username: 'user10',
        phone: '15880330008',
        status: 0,
    },
    {
        username: 'user11',
        phone: '15880330009',
        status: 0,
    },
    {
        username: 'user12',
        phone: '15880330010',
        status: 0,
    },
    {
        username: 'user12',
        phone: '15880330011',
        status: 0,
    },
];

Mock.mock('/searchUserInfo', 'post', (req) => {
    var arrInfo = [];
    let body = JSON.parse(req.body);
    let data = body.data;
    for (let user = 0; user < userInfo.length; user++) {
        if (userInfo[user].phone === data || userInfo[user].username === data) {
            console.log('back    ' + user.username, user.phone);
            arrInfo.push(userInfo[user]);
        }
    }
    return {
        message: 'success',
        data: arrInfo
    };
})