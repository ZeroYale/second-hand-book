import Mock from 'mockjs';

let booksDetail = [{
        id: 1,
        name: '狗狗心事：它和你想的大不一样哇哇哇哇哇哇哇哇哇哇哇哇',
        price: 21,
        author: '费奈尔',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg'
    },
    {
        id: 2,
        name: '从你的全世界路过',
        price: 46,
        author: '张嘉佳',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg'
    }, {
        id: 3,
        name: '如何说孩子才会听 怎么听孩子才肯说',
        price: 21,
        author: '玛兹丽施',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg'
    }, {
        id: 4,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg'
    },
    {
        id: 5,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg'
    },
    {
        id: 6,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/2/11/6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg'
    },
    {
        id: 7,
        name: '狗狗心事：它和你想的大不一样',
        price: 21,
        author: '费奈尔',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg'
    },
    {
        id: 8,
        name: '从你的全世界路过',
        price: 46,
        author: '张嘉佳',
        category_id: '文学',
        detail: '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。',
        image: 'https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg'
    }, {
        id: 9,
        name: '如何说孩子才会听 怎么听孩子才肯说',
        price: 21,
        author: '玛兹丽施',
        image: 'https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg'
    }, {
        id: 10,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg'
    },
    {
        id: 11,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg'
    },
    {
        id: 12,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/2/11/6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg'
    },
    {
        id: 13,
        name: '狗狗心事：它和你想的大不一样',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg'
    },
    {
        id: 14,
        name: '从你的全世界路过',
        price: 46,
        author: '张嘉佳',
        image: 'https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg'
    }, {
        id: 15,
        name: '如何说孩子才会听 怎么听孩子才肯说',
        price: 21,
        author: '玛兹丽施',
        image: 'https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg'
    }, {
        id: 16,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg'
    },
    {
        id: 17,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg'
    },
    {
        id: 18,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/2/11/6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg'
    },
    {
        id: 19,
        name: '如何说孩子才会听 怎么听孩子才肯说',
        price: 21,
        author: '玛兹丽施',
        image: 'https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg'
    }, {
        id: 20,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg'
    },
    {
        id: 21,
        name: '计算机网络（第7版）',
        price: 21,
        author: '费奈尔',
        image: 'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg'
    },
]

var mockUserInfo = {
    "message": 'success',
    "data": booksDetail
};

Mock.mock('/searchBook', 'get', (req) => {
    return mockUserInfo;
})