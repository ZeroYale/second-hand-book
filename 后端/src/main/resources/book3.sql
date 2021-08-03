DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`acceptusername`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  tinyint(2) NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4
ROW_FORMAT=DYNAMIC;

INSERT INTO `address` VALUES (1, '白云大道2号', '张三', '13027140633', 'dzq', 1);
INSERT INTO `address` VALUES (2, '白云大道1号', '王五', '13027140633', 'dzq123', 1);
INSERT INTO `address` VALUES (3, '111', '莫凡', '13111112222', 'fanfan', 1);


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`phone`  char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`username`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_at`  datetime NULL DEFAULT NULL ,
`books_num`  int(11) NULL DEFAULT 0 , 
`status`  int(2) NULL DEFAULT NULL   COMMENT '0表示普通用户 1表示管理员',
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=25
ROW_FORMAT=DYNAMIC
;

INSERT INTO `user` VALUES (1, '12345678901', 'root', '123456', '2020-10-29 21:10:28', 4, 0);
INSERT INTO `user` VALUES (2, '09876543211', 'a111', '123456', '2020-10-29 21:11:58', 2, 0);
INSERT INTO `user` VALUES (3, '12332155555', '张三', '123456', '2020-12-5 17:34:17', 5, 0);
INSERT INTO `user` VALUES (4, '43453556222', '张三1', '123456', '2020-12-5 17:34:39', 4, 0);
INSERT INTO `user` VALUES (5, '11111111111', 'admin11', 'root', '2020-10-18 15:31:17', 0, 1);
INSERT INTO `user` VALUES (6, '64346352223', '张三3', '123456', '2020-12-5 17:34:57', 23, 0);
INSERT INTO `user` VALUES (7, '23452342342', '张三2', '123456', '2020-12-5 17:35:14', 2, 0);
INSERT INTO `user` VALUES (8, '12332322266', 'aa21', '123456', '2020-12-5 17:35:48', 2, 0);
INSERT INTO `user` VALUES (9, '75434353566', 'a1', '123456', '2020-12-5 17:36:05', 0, 0);
INSERT INTO `user` VALUES (27, '33333333333', '王五', '123456', '2020-10-29 15:27:03', 0, 0);
INSERT INTO `user` VALUES (28, '55555555555', '零四完', '123456', '2020-10-29 15:29:08', 0, 0);
INSERT INTO `user` VALUES (29, '00000000011', '欧阳狗蛋', '123456', '2020-10-29 15:31:34', 0, 0);


DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`price`  bigint(11) NULL DEFAULT NULL ,
`author`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`image`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`category_name`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12
ROW_FORMAT=DYNAMIC
;
INSERT INTO `book` VALUES (1, '狗狗心事：它和你想的大不一样', 21, '费奈尔', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/001.jpg', '生活', '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。\r\n　　本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。\r\n');
INSERT INTO `book` VALUES (5, '遇见未知的自己', 21, '张德芬', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/002.jpg', '文学', '华语世界第一部影响了数千万人的身心灵成长小说，销量过百万的《遇见未知的自己》，作者张德芬首次对内容进行修订，并精心续写全新结局，分享她最新的心灵成长心得。\r\n　　本书借由我们每天都可能遭遇到的种种事情，帮助我们看到主宰自己人生的模式是如何形成的，又如何在操控我们的身心。并以故事的形式来分享张德芬多年的心灵成长感悟，来帮助我们解除现有的人生模式，帮助我们从思想、情绪和身体的桎梏中解脱出来，从而活出自己想要的人生，找回原本真实、快乐的自己！');
INSERT INTO `book` VALUES (6, 'IT运维之道', 33, '李鹏', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/003.jpg', '科技', '《IT运维之道》是一本由人民邮电出版社出版的计算机类书籍。本书全面展现IT服务方法、标准、技巧、技术，让读者能纵览IT服务全貌；深入浅出的阐述了IT运维精髓和全方位要素，深刻剖析了IT运维的成功规律；系统概述了从硬件到软件的各类IT技术，让读者具备IT运维软功夫和硬功夫；让读者少走弯路，学会一套成熟、规范、有效的IT运维方法。');
INSERT INTO `book` VALUES (7, '计算机网络（第7版）', 33, '谢希仁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/004.jpg', '科技', '十年经久不衰，55次印刷，销量200万册，不断出新的经典教科书。');
INSERT INTO `book` VALUES (8, '平凡的世界', 47, '路遥', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/005.jpg', '文学', '平凡的世界》是中国作家路遥创作的一部百万字的小说。这是一部全景式地表现中国当代城乡社会生活的长篇小说，全书共三部。该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。');
INSERT INTO `book` VALUES (9, '郑渊洁十二生肖童话（全12册）', 126, '郑渊洁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/006.jpg', '童话', '郑渊洁十二生肖童话系列由《鼠王做寿》《牛王醉酒》《虎王出山》《兔王卖耳》《龙王闹海》《蛇王淘金》《马王登基》《羊王称霸》《猴王变形》《鸡王画虎》《狗王梦游》《猪王照相》共十二本组成。故事中的动物们可谓是“八仙过海，各显神通”。鼠王“掌握了”控制时间的诀窍；牛王脱掉了一身的牛皮癣；虎王离开森林，来到动物园“指点江山”；兔王卖掉了自己的大耳朵；龙王用计惩戒了妄图盗卖古董的坏蛋；蛇王摇身一变成为了人，来到人间淘金；马王不费一兵一卒就能直取他国领土……不过，他们这么做的结果到底如何？更多精彩尽在其中，十二生肖童话系列将给你意想不到的惊喜。');
INSERT INTO `book` VALUES (10, 'MINECRAFT我的世界', 52, '奥布莱恩（O‘Brien，S.）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/007.jpg', '科技', '本书共的13章，每章针对一个专题展开，伴随大家从求生存一直到成霸业。\r\n第1章“入手指南”向大家说明如何下载、安装Minecraft以及开启新游戏。第2章“初夜生存”将向大家传授如何平安度过Minecraft中艰苦的初期阶段。第3章“资源采集”将帮助大家掌握步入正轨所需要的技能。第4章“开山采矿”将帮助大家凿出离高效的采矿通道。第5章“战斗学院”将训练大家对付各种怪物。第6章“农业生产”之后，大家就可以过上自给自足、永\r\n不挨饿的好日子。第7章“农场与驯化”全是可爱的小动物，它们在Minecraft中繁衍生息的同时也为我们提供了各种宝贵资源。第8章“创意建造”，从宏伟的外观建筑到华丽的内部装潢都没问题。第9章“红石与铁路交通”介绍用红石能源自动控制门、自动分发矿车、建造车站、经停站等。第10章“附魔、锻造与酿造”介绍了各种有趣的玩法。第11章“村庄与其他建筑”主要讲解与大家息息相关的NPC村民们。第12章“一战到底：下界与末地”将告诉大家如何快速找到要塞、得到物品以及如何备战大Boss末影龙。第13章“Mod与多人游戏”，将向大家展示一个完全自主定制的游戏。\r\n事不宜迟，快来感受Minecraft的魅力吧。\r\n');
INSERT INTO `book` VALUES (11, '绽放自我——歪歪兔生命教育童话', 63, '吉葡乐', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/008.jpg', '童话', '这套童话具有天马行空的想象力，选材广泛，时空转换炫目灵动，故事或情节曲折，感情充沛，或幽默风趣，令人捧腹。该书系统地归纳了生命教育的10个主题，在引人入胜的故事中，让读者直面生命，感知生命中的痛苦、尊严、梦想、自由等一些本质的内涵，启发孩子思考生命的意义，呵护心灵的成长，学会珍爱和提升自我，学会积极的生存、健康的生活与独立的发展，实现自我生命的最大价值。既是生命教育的启蒙读物，也引导孩子由此开启独立思考的大门。7-12岁适读，全10册。');
INSERT INTO `book` VALUES (12, '从你的全世界路过', 46, '张嘉佳', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/009.jpg', '文学', '《从你的全世界路过》就像朋友在深夜跟你在叙述，叙述他走过的千山万水。当你辗转失眠时，当你需要安慰时，当你等待列车时，当你赖床慵懒时，当你饭后困顿时，应该都能找到一章合适的。[1] \r\n这算是一本睡前读物。采用讲故事的形式来讲述一个个平凡却引人深思的故事，它与那些纯粹的鸡汤文不同，故事的切合和说理更让人从心理上认同，因为书中的每一段故事似乎都发生在每一位读者身边。\r\n');
INSERT INTO `book` VALUES (13, '如何说孩子才会听 怎么听孩子才肯说', 21, '玛兹丽施', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/010.jpg', '文学', '要是有一本书能让你学会一种语言，说出话来孩子就会听，你会吃惊吗？\r\n　　不必惊奇，《如何说孩子才会听，怎么听孩子才肯说》将帮助你学会一种让孩子听话的神奇语言，这种爱的语言使孩子很容易接受您的要求和忠告。世界上数以千万的父母用自身的亲身实践证明了书中提供的方法非常有效。该书在美国畅销300多万册，并被翻译成30多种文字风靡全球。世界各地的父母和专家热情洋溢地赞誉两位作者，她们在长期的实践中摸索出的这套语言是那样行之有效，的的确确能缓解所有年龄段的孩子与父母的紧张关系，结束父母与孩子的冲突对抗，带来父母和孩子的合作。');
INSERT INTO `book` VALUES (14, ' 悲惨世界', 19, '维克多·雨果（法）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/011.jpg', '文学', '《悲惨世界》是由法国大作家维克多·雨果在1862年所发表的一部长篇小说，涵盖了拿破仑战争和之后的十几年的时间，是十九世纪最著名的小说之一。故事的主线围绕主人公土伦苦刑犯冉·阿让（Jean Valjean）的个人经历，融进了法国的历史、革命、战争、道德哲学、法律、正义、宗教信仰。多次被改编演绎成影视作品。');
INSERT INTO `book` VALUES (15, '遇见未知的自己', 21, '张德芬', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/001.jpg', '文学', '华语世界第一部影响了数千万人的身心灵成长小说，销量过百万的《遇见未知的自己》，作者张德芬首次对内容进行修订，并精心续写全新结局，分享她最新的心灵成长心得。\r\n　　本书借由我们每天都可能遭遇到的种种事情，帮助我们看到主宰自己人生的模式是如何形成的，又如何在操控我们的身心。并以故事的形式来分享张德芬多年的心灵成长感悟，来帮助我们解除现有的人生模式，帮助我们从思想、情绪和身体的桎梏中解脱出来，从而活出自己想要的人生，找回原本真实、快乐的自己！');
INSERT INTO `book` VALUES (16, 'IT运维之道', 33, '李鹏', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/002.jpg', '科技', '《IT运维之道》是一本由人民邮电出版社出版的计算机类书籍。本书全面展现IT服务方法、标准、技巧、技术，让读者能纵览IT服务全貌；深入浅出的阐述了IT运维精髓和全方位要素，深刻剖析了IT运维的成功规律；系统概述了从硬件到软件的各类IT技术，让读者具备IT运维软功夫和硬功夫；让读者少走弯路，学会一套成熟、规范、有效的IT运维方法。');
INSERT INTO `book` VALUES (17, '计算机网络（第7版）', 33, '谢希仁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/003.jpg', '科技', '十年经久不衰，55次印刷，销量200万册，不断出新的经典教科书。');
INSERT INTO `book` VALUES (18, '平凡的世界', 47, '路遥', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/004.jpg', '文学', '平凡的世界》是中国作家路遥创作的一部百万字的小说。这是一部全景式地表现中国当代城乡社会生活的长篇小说，全书共三部。该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。');
INSERT INTO `book` VALUES (19, '郑渊洁十二生肖童话（全12册）', 126, '郑渊洁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/005.jpg', '童话', '郑渊洁十二生肖童话系列由《鼠王做寿》《牛王醉酒》《虎王出山》《兔王卖耳》《龙王闹海》《蛇王淘金》《马王登基》《羊王称霸》《猴王变形》《鸡王画虎》《狗王梦游》《猪王照相》共十二本组成。故事中的动物们可谓是“八仙过海，各显神通”。鼠王“掌握了”控制时间的诀窍；牛王脱掉了一身的牛皮癣；虎王离开森林，来到动物园“指点江山”；兔王卖掉了自己的大耳朵；龙王用计惩戒了妄图盗卖古董的坏蛋；蛇王摇身一变成为了人，来到人间淘金；马王不费一兵一卒就能直取他国领土……不过，他们这么做的结果到底如何？更多精彩尽在其中，十二生肖童话系列将给你意想不到的惊喜。');
INSERT INTO `book` VALUES (20, 'MINECRAFT我的世界', 52, '奥布莱恩（O‘Brien，S.）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/006.jpg', '科技', '本书共的13章，每章针对一个专题展开，伴随大家从求生存一直到成霸业。\r\n第1章“入手指南”向大家说明如何下载、安装Minecraft以及开启新游戏。第2章“初夜生存”将向大家传授如何平安度过Minecraft中艰苦的初期阶段。第3章“资源采集”将帮助大家掌握步入正轨所需要的技能。第4章“开山采矿”将帮助大家凿出离高效的采矿通道。第5章“战斗学院”将训练大家对付各种怪物。第6章“农业生产”之后，大家就可以过上自给自足、永\r\n不挨饿的好日子。第7章“农场与驯化”全是可爱的小动物，它们在Minecraft中繁衍生息的同时也为我们提供了各种宝贵资源。第8章“创意建造”，从宏伟的外观建筑到华丽的内部装潢都没问题。第9章“红石与铁路交通”介绍用红石能源自动控制门、自动分发矿车、建造车站、经停站等。第10章“附魔、锻造与酿造”介绍了各种有趣的玩法。第11章“村庄与其他建筑”主要讲解与大家息息相关的NPC村民们。第12章“一战到底：下界与末地”将告诉大家如何快速找到要塞、得到物品以及如何备战大Boss末影龙。第13章“Mod与多人游戏”，将向大家展示一个完全自主定制的游戏。\r\n事不宜迟，快来感受Minecraft的魅力吧。\r\n');
INSERT INTO `book` VALUES (21, '绽放自我——歪歪兔生命教育童话', 63, '吉葡乐', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/007.jpg', '童话', '这套童话具有天马行空的想象力，选材广泛，时空转换炫目灵动，故事或情节曲折，感情充沛，或幽默风趣，令人捧腹。该书系统地归纳了生命教育的10个主题，在引人入胜的故事中，让读者直面生命，感知生命中的痛苦、尊严、梦想、自由等一些本质的内涵，启发孩子思考生命的意义，呵护心灵的成长，学会珍爱和提升自我，学会积极的生存、健康的生活与独立的发展，实现自我生命的最大价值。既是生命教育的启蒙读物，也引导孩子由此开启独立思考的大门。7-12岁适读，全10册。');
INSERT INTO `book` VALUES (22, '狗狗心事：它和你想的大不一样', 21, '费奈尔', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/008.jpg', '生活', '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。\r\n　　本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。\r\n');
INSERT INTO `book` VALUES (27, 'tt', 11, 'tt', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/009.jpg', '童话', 'tt');
INSERT INTO `book` VALUES (28, '红楼梦', 59, '曹雪芹', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/010.jpg', '童话', '一本好书');
INSERT INTO `book` VALUES (29, '12', 222, '2', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/011.jpg', '童话', '22');
INSERT INTO `book` VALUES (30, '1234', 32, '1234', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/001.jpg', '童话', '1243');
INSERT INTO `book` VALUES (31, '1212', 123, '23123', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/002.jpg', '童话', '2312312');
INSERT INTO `book` VALUES (32, '1', 2, '1', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/013.jpg', '童话', '12');
INSERT INTO `book` VALUES (33, '21', 33, '21', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/005.jpg', '科技', '3');
INSERT INTO `book` VALUES (34, '21', 22, '33', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/004.jpg', '科技', '33');
INSERT INTO `book` VALUES (35, '狗狗心事：它和你想的大不一样', 21, '费奈尔', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/006.jpg', '生活', '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。\r\n　　本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。\r\n');
INSERT INTO `book` VALUES (36, '从你的全世界路过', 46, '张嘉佳', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/003.jpg', '文学', '《从你的全世界路过》就像朋友在深夜跟你在叙述，叙述他走过的千山万水。当你辗转失眠时，当你需要安慰时，当你等待列车时，当你赖床慵懒时，当你饭后困顿时，应该都能找到一章合适的。[1] \r\n这算是一本睡前读物。采用讲故事的形式来讲述一个个平凡却引人深思的故事，它与那些纯粹的鸡汤文不同，故事的切合和说理更让人从心理上认同，因为书中的每一段故事似乎都发生在每一位读者身边。\r\n');
INSERT INTO `book` VALUES (37, '如何说孩子才会听 怎么听孩子才肯说', 21, '玛兹丽施', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/012.jpg', '科技', '要是有一本书能让你学会一种语言，说出话来孩子就会听，你会吃惊吗？\r\n　　不必惊奇，《如何说孩子才会听，怎么听孩子才肯说》将帮助你学会一种让孩子听话的神奇语言，这种爱的语言使孩子很容易接受您的要求和忠告。世界上数以千万的父母用自身的亲身实践证明了书中提供的方法非常有效。该书在美国畅销300多万册，并被翻译成30多种文字风靡全球。世界各地的父母和专家热情洋溢地赞誉两位作者，她们在长期的实践中摸索出的这套语言是那样行之有效，的的确确能缓解所有年龄段的孩子与父母的紧张关系，结束父母与孩子的冲突对抗，带来父母和孩子的合作。');
INSERT INTO `book` VALUES (38, ' 悲惨世界', 19, '维克多·雨果（法）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/013.jpg', '文学', '《悲惨世界》是由法国大作家维克多·雨果在1862年所发表的一部长篇小说，涵盖了拿破仑战争和之后的十几年的时间，是十九世纪最著名的小说之一。故事的主线围绕主人公土伦苦刑犯冉·阿让（Jean Valjean）的个人经历，融进了法国的历史、革命、战争、道德哲学、法律、正义、宗教信仰。多次被改编演绎成影视作品。');
INSERT INTO `book` VALUES (39, '遇见未知的自己', 21, '张德芬', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/t.jpg', '文学', '华语世界第一部影响了数千万人的身心灵成长小说，销量过百万的《遇见未知的自己》，作者张德芬首次对内容进行修订，并精心续写全新结局，分享她最新的心灵成长心得。\r\n　　本书借由我们每天都可能遭遇到的种种事情，帮助我们看到主宰自己人生的模式是如何形成的，又如何在操控我们的身心。并以故事的形式来分享张德芬多年的心灵成长感悟，来帮助我们解除现有的人生模式，帮助我们从思想、情绪和身体的桎梏中解脱出来，从而活出自己想要的人生，找回原本真实、快乐的自己！');
INSERT INTO `book` VALUES (40, 'IT运维之道', 33, '李鹏', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/010.jpg', '科技', '《IT运维之道》是一本由人民邮电出版社出版的计算机类书籍。本书全面展现IT服务方法、标准、技巧、技术，让读者能纵览IT服务全貌；深入浅出的阐述了IT运维精髓和全方位要素，深刻剖析了IT运维的成功规律；系统概述了从硬件到软件的各类IT技术，让读者具备IT运维软功夫和硬功夫；让读者少走弯路，学会一套成熟、规范、有效的IT运维方法。');
INSERT INTO `book` VALUES (41, '计算机网络（第7版）', 33, '谢希仁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/009.jpg', '科技', '十年经久不衰，55次印刷，销量200万册，不断出新的经典教科书。');
INSERT INTO `book` VALUES (42, '平凡的世界', 47, '路遥', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/007.jpg', '文学', '平凡的世界》是中国作家路遥创作的一部百万字的小说。这是一部全景式地表现中国当代城乡社会生活的长篇小说，全书共三部。该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。');
INSERT INTO `book` VALUES (43, '郑渊洁十二生肖童话（全12册）', 126, '郑渊洁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/008.jpg', '童话', '郑渊洁十二生肖童话系列由《鼠王做寿》《牛王醉酒》《虎王出山》《兔王卖耳》《龙王闹海》《蛇王淘金》《马王登基》《羊王称霸》《猴王变形》《鸡王画虎》《狗王梦游》《猪王照相》共十二本组成。故事中的动物们可谓是“八仙过海，各显神通”。鼠王“掌握了”控制时间的诀窍；牛王脱掉了一身的牛皮癣；虎王离开森林，来到动物园“指点江山”；兔王卖掉了自己的大耳朵；龙王用计惩戒了妄图盗卖古董的坏蛋；蛇王摇身一变成为了人，来到人间淘金；马王不费一兵一卒就能直取他国领土……不过，他们这么做的结果到底如何？更多精彩尽在其中，十二生肖童话系列将给你意想不到的惊喜。');
INSERT INTO `book` VALUES (44, '郑渊洁十二生肖童话（全12册）', 126, '郑渊洁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/t.jpg', '童话', '郑渊洁十二生肖童话系列由《鼠王做寿》《牛王醉酒》《虎王出山》《兔王卖耳》《龙王闹海》《蛇王淘金》《马王登基》《羊王称霸》《猴王变形》《鸡王画虎》《狗王梦游》《猪王照相》共十二本组成。故事中的动物们可谓是“八仙过海，各显神通”。鼠王“掌握了”控制时间的诀窍；牛王脱掉了一身的牛皮癣；虎王离开森林，来到动物园“指点江山”；兔王卖掉了自己的大耳朵；龙王用计惩戒了妄图盗卖古董的坏蛋；蛇王摇身一变成为了人，来到人间淘金；马王不费一兵一卒就能直取他国领土……不过，他们这么做的结果到底如何？更多精彩尽在其中，十二生肖童话系列将给你意想不到的惊喜。');
INSERT INTO `book` VALUES (45, '平凡的世界', 47, '路遥', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/012.jpg', '文学', '平凡的世界》是中国作家路遥创作的一部百万字的小说。这是一部全景式地表现中国当代城乡社会生活的长篇小说，全书共三部。该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。');
INSERT INTO `book` VALUES (46, '计算机网络（第7版）', 33, '谢希仁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/002.jpg', '科技', '十年经久不衰，55次印刷，销量200万册，不断出新的经典教科书。');
INSERT INTO `book` VALUES (47, 'IT运维之道', 33, '李鹏', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/013.jpg', '科技', '《IT运维之道》是一本由人民邮电出版社出版的计算机类书籍。本书全面展现IT服务方法、标准、技巧、技术，让读者能纵览IT服务全貌；深入浅出的阐述了IT运维精髓和全方位要素，深刻剖析了IT运维的成功规律；系统概述了从硬件到软件的各类IT技术，让读者具备IT运维软功夫和硬功夫；让读者少走弯路，学会一套成熟、规范、有效的IT运维方法。');
INSERT INTO `book` VALUES (48, '遇见未知的自己', 21, '张德芬', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/003.jpg', '文学', '华语世界第一部影响了数千万人的身心灵成长小说，销量过百万的《遇见未知的自己》，作者张德芬首次对内容进行修订，并精心续写全新结局，分享她最新的心灵成长心得。\r\n　　本书借由我们每天都可能遭遇到的种种事情，帮助我们看到主宰自己人生的模式是如何形成的，又如何在操控我们的身心。并以故事的形式来分享张德芬多年的心灵成长感悟，来帮助我们解除现有的人生模式，帮助我们从思想、情绪和身体的桎梏中解脱出来，从而活出自己想要的人生，找回原本真实、快乐的自己！');
INSERT INTO `book` VALUES (49, ' 悲惨世界', 19, '维克多·雨果（法）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/008.jpg', '文学', '《悲惨世界》是由法国大作家维克多·雨果在1862年所发表的一部长篇小说，涵盖了拿破仑战争和之后的十几年的时间，是十九世纪最著名的小说之一。故事的主线围绕主人公土伦苦刑犯冉·阿让（Jean Valjean）的个人经历，融进了法国的历史、革命、战争、道德哲学、法律、正义、宗教信仰。多次被改编演绎成影视作品。');
INSERT INTO `book` VALUES (50, '如何说孩子才会听 怎么听孩子才肯说', 21, '玛兹丽施', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/007.jpg', '科技', '要是有一本书能让你学会一种语言，说出话来孩子就会听，你会吃惊吗？\r\n　　不必惊奇，《如何说孩子才会听，怎么听孩子才肯说》将帮助你学会一种让孩子听话的神奇语言，这种爱的语言使孩子很容易接受您的要求和忠告。世界上数以千万的父母用自身的亲身实践证明了书中提供的方法非常有效。该书在美国畅销300多万册，并被翻译成30多种文字风靡全球。世界各地的父母和专家热情洋溢地赞誉两位作者，她们在长期的实践中摸索出的这套语言是那样行之有效，的的确确能缓解所有年龄段的孩子与父母的紧张关系，结束父母与孩子的冲突对抗，带来父母和孩子的合作。');
INSERT INTO `book` VALUES (51, '从你的全世界路过', 46, '张嘉佳', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/009.jpg', '文学', '《从你的全世界路过》就像朋友在深夜跟你在叙述，叙述他走过的千山万水。当你辗转失眠时，当你需要安慰时，当你等待列车时，当你赖床慵懒时，当你饭后困顿时，应该都能找到一章合适的。[1] \r\n这算是一本睡前读物。采用讲故事的形式来讲述一个个平凡却引人深思的故事，它与那些纯粹的鸡汤文不同，故事的切合和说理更让人从心理上认同，因为书中的每一段故事似乎都发生在每一位读者身边。\r\n');
INSERT INTO `book` VALUES (52, '狗狗心事：它和你想的大不一样', 21, '费奈尔', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/005.jpg', '生活', '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。\r\n　　本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。\r\n');
INSERT INTO `book` VALUES (53, 'MINECRAFT我的世界', 52, '奥布莱恩（O‘Brien，S.）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/003.jpg', '科技', '本书共的13章，每章针对一个专题展开，伴随大家从求生存一直到成霸业。\r\n第1章“入手指南”向大家说明如何下载、安装Minecraft以及开启新游戏。第2章“初夜生存”将向大家传授如何平安度过Minecraft中艰苦的初期阶段。第3章“资源采集”将帮助大家掌握步入正轨所需要的技能。第4章“开山采矿”将帮助大家凿出离高效的采矿通道。第5章“战斗学院”将训练大家对付各种怪物。第6章“农业生产”之后，大家就可以过上自给自足、永\r\n不挨饿的好日子。第7章“农场与驯化”全是可爱的小动物，它们在Minecraft中繁衍生息的同时也为我们提供了各种宝贵资源。第8章“创意建造”，从宏伟的外观建筑到华丽的内部装潢都没问题。第9章“红石与铁路交通”介绍用红石能源自动控制门、自动分发矿车、建造车站、经停站等。第10章“附魔、锻造与酿造”介绍了各种有趣的玩法。第11章“村庄与其他建筑”主要讲解与大家息息相关的NPC村民们。第12章“一战到底：下界与末地”将告诉大家如何快速找到要塞、得到物品以及如何备战大Boss末影龙。第13章“Mod与多人游戏”，将向大家展示一个完全自主定制的游戏。\r\n事不宜迟，快来感受Minecraft的魅力吧。\r\n');
INSERT INTO `book` VALUES (54, '绽放自我——歪歪兔生命教育童话', 63, '吉葡乐', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/002.jpg', '童话', '这套童话具有天马行空的想象力，选材广泛，时空转换炫目灵动，故事或情节曲折，感情充沛，或幽默风趣，令人捧腹。该书系统地归纳了生命教育的10个主题，在引人入胜的故事中，让读者直面生命，感知生命中的痛苦、尊严、梦想、自由等一些本质的内涵，启发孩子思考生命的意义，呵护心灵的成长，学会珍爱和提升自我，学会积极的生存、健康的生活与独立的发展，实现自我生命的最大价值。既是生命教育的启蒙读物，也引导孩子由此开启独立思考的大门。7-12岁适读，全10册。');
INSERT INTO `book` VALUES (55, '狗狗心事：它和你想的大不一样', 21, '费奈尔', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/001.jpg', '生活', '传统的驯狗方式——套项圈、惩罚、呵斥等在书中了无踪影。简·费奈尔在这部全球畅销书中，完全颠覆了我们看待狗狗的方式。她深入研究狗狗的隐形语言，并将其提炼成一种简单的指导原则，用来帮助每位主人和他们最好的朋友——狗狗，建立起一种全新的亲密关系。对狗狗的独特理解使她每到一处都能赢得热爱动物人士的尊敬，世界各地的狗狗主人被她在这《狗狗心事:它和你想的大不一样》中展现出的富有创造力的观点深深的打动着。\r\n　　本书向狗狗的主人们详细介绍了如何将费奈尔的方法引入狗狗的日常生活，从根本上改变狗狗的问题：在家中随地大小便，见到陌生人狂吠，出门散步麻烦不断。2周内，狗狗的主人就可以掌握一种让他们与狗狗生活得更美好、更幸福的实用训练体系。\r\n');
INSERT INTO `book` VALUES (56, '如何说孩子才会听 怎么听孩子才肯说', 21, '玛兹丽施', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/003.jpg', '文学', '要是有一本书能让你学会一种语言，说出话来孩子就会听，你会吃惊吗？\r\n　　不必惊奇，《如何说孩子才会听，怎么听孩子才肯说》将帮助你学会一种让孩子听话的神奇语言，这种爱的语言使孩子很容易接受您的要求和忠告。世界上数以千万的父母用自身的亲身实践证明了书中提供的方法非常有效。该书在美国畅销300多万册，并被翻译成30多种文字风靡全球。世界各地的父母和专家热情洋溢地赞誉两位作者，她们在长期的实践中摸索出的这套语言是那样行之有效，的的确确能缓解所有年龄段的孩子与父母的紧张关系，结束父母与孩子的冲突对抗，带来父母和孩子的合作。');
INSERT INTO `book` VALUES (57, ' 悲惨世界', 19, '维克多·雨果（法）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/005.jpg', '文学', '《悲惨世界》是由法国大作家维克多·雨果在1862年所发表的一部长篇小说，涵盖了拿破仑战争和之后的十几年的时间，是十九世纪最著名的小说之一。故事的主线围绕主人公土伦苦刑犯冉·阿让（Jean Valjean）的个人经历，融进了法国的历史、革命、战争、道德哲学、法律、正义、宗教信仰。多次被改编演绎成影视作品。');
INSERT INTO `book` VALUES (58, '遇见未知的自己', 21, '张德芬', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/010.jpg', '文学', '华语世界第一部影响了数千万人的身心灵成长小说，销量过百万的《遇见未知的自己》，作者张德芬首次对内容进行修订，并精心续写全新结局，分享她最新的心灵成长心得。\r\n　　本书借由我们每天都可能遭遇到的种种事情，帮助我们看到主宰自己人生的模式是如何形成的，又如何在操控我们的身心。并以故事的形式来分享张德芬多年的心灵成长感悟，来帮助我们解除现有的人生模式，帮助我们从思想、情绪和身体的桎梏中解脱出来，从而活出自己想要的人生，找回原本真实、快乐的自己！');
INSERT INTO `book` VALUES (59, 'IT运维之道', 33, '李鹏', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/001.jpg', '科技', '《IT运维之道》是一本由人民邮电出版社出版的计算机类书籍。本书全面展现IT服务方法、标准、技巧、技术，让读者能纵览IT服务全貌；深入浅出的阐述了IT运维精髓和全方位要素，深刻剖析了IT运维的成功规律；系统概述了从硬件到软件的各类IT技术，让读者具备IT运维软功夫和硬功夫；让读者少走弯路，学会一套成熟、规范、有效的IT运维方法。');
INSERT INTO `book` VALUES (60, '计算机网络（第7版）', 33, '谢希仁', '\r\nhttp://bookshop2.oss-cn-beijing.aliyuncs.com/book/002.jpg', '科技', '十年经久不衰，55次印刷，销量200万册，不断出新的经典教科书。');
INSERT INTO `book` VALUES (62, '郑渊洁十二生肖童话（全12册）', 126, '郑渊洁', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/007.jpg', '童话', '郑渊洁十二生肖童话系列由《鼠王做寿》《牛王醉酒》《虎王出山》《兔王卖耳》《龙王闹海》《蛇王淘金》《马王登基》《羊王称霸》《猴王变形》《鸡王画虎》《狗王梦游》《猪王照相》共十二本组成。故事中的动物们可谓是“八仙过海，各显神通”。鼠王“掌握了”控制时间的诀窍；牛王脱掉了一身的牛皮癣；虎王离开森林，来到动物园“指点江山”；兔王卖掉了自己的大耳朵；龙王用计惩戒了妄图盗卖古董的坏蛋；蛇王摇身一变成为了人，来到人间淘金；马王不费一兵一卒就能直取他国领土……不过，他们这么做的结果到底如何？更多精彩尽在其中，十二生肖童话系列将给你意想不到的惊喜。');
INSERT INTO `book` VALUES (63, 'MINECRAFT我的世界', 52, '奥布莱恩（O‘Brien，S.）', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/012.jpg', '科技', '本书共的13章，每章针对一个专题展开，伴随大家从求生存一直到成霸业。\r\n第1章“入手指南”向大家说明如何下载、安装Minecraft以及开启新游戏。第2章“初夜生存”将向大家传授如何平安度过Minecraft中艰苦的初期阶段。第3章“资源采集”将帮助大家掌握步入正轨所需要的技能。第4章“开山采矿”将帮助大家凿出离高效的采矿通道。第5章“战斗学院”将训练大家对付各种怪物。第6章“农业生产”之后，大家就可以过上自给自足、永\r\n不挨饿的好日子。第7章“农场与驯化”全是可爱的小动物，它们在Minecraft中繁衍生息的同时也为我们提供了各种宝贵资源。第8章“创意建造”，从宏伟的外观建筑到华丽的内部装潢都没问题。第9章“红石与铁路交通”介绍用红石能源自动控制门、自动分发矿车、建造车站、经停站等。第10章“附魔、锻造与酿造”介绍了各种有趣的玩法。第11章“村庄与其他建筑”主要讲解与大家息息相关的NPC村民们。第12章“一战到底：下界与末地”将告诉大家如何快速找到要塞、得到物品以及如何备战大Boss末影龙。第13章“Mod与多人游戏”，将向大家展示一个完全自主定制的游戏。\r\n事不宜迟，快来感受Minecraft的魅力吧。\r\n');
INSERT INTO `book` VALUES (64, '从你的全世界路过', 46, '张嘉佳', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/013.jpg', '文学', '《从你的全世界路过》就像朋友在深夜跟你在叙述，叙述他走过的千山万水。当你辗转失眠时，当你需要安慰时，当你等待列车时，当你赖床慵懒时，当你饭后困顿时，应该都能找到一章合适的。[1] \r\n这算是一本睡前读物。采用讲故事的形式来讲述一个个平凡却引人深思的故事，它与那些纯粹的鸡汤文不同，故事的切合和说理更让人从心理上认同，因为书中的每一段故事似乎都发生在每一位读者身边。\r\n');
INSERT INTO `book` VALUES (65, '232', 112, '232', 'http://bookshop2.oss-cn-beijing.aliyuncs.com/book/t.jpg', '文学', '232');

-- ----------------------------
-- Records of category
-- ----------------------------
-- INSERT INTO `category` VALUES (1, '科技');
-- INSERT INTO `category` VALUES (2, '生活');
-- INSERT INTO `category` VALUES (3, '文学');
-- INSERT INTO `category` VALUES (4, '童话');



DROP TABLE IF EXISTS `user_book`;
CREATE TABLE `user_book` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'id' ,
`user_id`  int(11) NULL DEFAULT NULL COMMENT '外键 用户id' ,
`book_id`  int(11) NULL DEFAULT NULL COMMENT '外键 书本id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=20
ROW_FORMAT=DYNAMIC
;

INSERT INTO `user_book` VALUES (1, 5, 77);
INSERT INTO `user_book` VALUES (4, 4, 94);
INSERT INTO `user_book` VALUES (5, 4, 94);
INSERT INTO `user_book` VALUES (6, 4, 94);
INSERT INTO `user_book` VALUES (8, 9, 90);



DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id' ,
`user_id`  int(11) NOT NULL COMMENT '用户id' ,
`book_id`  int(11) NOT NULL COMMENT '商品id' ,
`price`  float(11,0) NULL DEFAULT NULL COMMENT '订单价格' ,
`state`  int(11) NULL DEFAULT 1 COMMENT '订单状态 1待发货 2待收货 3已完成' ,
`information`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`date`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5
ROW_FORMAT=DYNAMIC
;

INSERT INTO `orders` VALUES (1, 11, 78, 10, 3, '买给爸爸看的', '2018-04-16 05:06:41');
INSERT INTO `orders` VALUES (2, 23, 90, 28, 3, '', '2018-05-07 11:16:27');
INSERT INTO `orders` VALUES (3, 23, 3, 23, 3, '', '2018-05-07 11:18:03');
INSERT INTO `orders` VALUES (4, 23, 81, 168, 1, '', '2018-05-18 11:16:49');


DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
`id`  int(5) NOT NULL AUTO_INCREMENT COMMENT '购物车编号' ,
`user_id`  int(5) NOT NULL COMMENT '用户编号' ,
`book_id`  int(5) NOT NULL COMMENT '图书编号' ,
`amount`  int(5) NOT NULL COMMENT '数量' ,
`price`  decimal(10,0) NULL DEFAULT NULL COMMENT '购物车金额' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1
ROW_FORMAT=DYNAMIC
;




