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

// var mockUserInfo = {
//     "status": 'success',
//     "data": userInfo
// };

Mock.mock('/searchUser', 'get', (req) => {
    // return mockUserInfo;
    if (userInfo == '') {
        return {
            "message": 'error',
        };
    } else {
        return {
            "message": 'success',
            "data": userInfo
        };
    }

})