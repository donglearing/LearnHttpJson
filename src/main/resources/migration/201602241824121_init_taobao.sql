/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_acookie_visitorid` (
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺id',
  `visitor_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '访客ID，与Acookie数据中的visitorid可以匹配',
  `buyer_nick` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '访客ID对应的淘宝昵称',
  `date_min` datetime DEFAULT NULL COMMENT '最早一笔订单的下单时间，无业务意义，只是标示数据作用',
  `date_max` datetime DEFAULT NULL COMMENT '最后一笔订单的下单时间，无业务意义，只是标示数据作用',
  PRIMARY KEY (`dp_id`,`visitor_id`,`buyer_nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='基于Acookie订单建立的visitorid与Buyer_nick的映射关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_chat_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_chat_log` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT,
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺id',
  `service_staff_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '客服人员id',
  `buyer_nick` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '访客ID对应的淘宝昵称',
  `direction` tinyint(4) NOT NULL COMMENT '消息方向 （卖家 --> 买家  or   买家 --> 卖家）',
  `chat_type` tinyint(4) NOT NULL COMMENT '消息类型',
  `content` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT ' 消息内容 （卖家 --> 买家）',
  `url_lists` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '消息中商品url列表 ',
  `num_iids` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '消息中商品id列表 ',
  `word_lists` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '消息中关键词列表：{关键词：出现次数} ',
  `length` int(11) DEFAULT NULL COMMENT '消息长度 （买家 --> 卖家）',
  `chat_time` datetime DEFAULT NULL COMMENT '消息时间',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='旺旺聊天记录模糊查询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_chatpeer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_chatpeer` (
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺id',
  `service_staff_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '客服人员id',
  `chat_time` datetime NOT NULL COMMENT '聊天时间',
  `buyer_nick` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '访客ID对应的淘宝昵称',
  `direction` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '表示消息方向 0:from_id->to_id 1:to_id->from_id',
  `chat_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'type & 1 ：自动回复 type & 2 : 陌生人消息（等于0是好友消息） type & 4 : 广播消息 type & 8 : 最近联系人陌生人消息 type & 16 : 离线消息 type & 32 : 子账号转发系统消息',
  `content` text COLLATE utf8_bin COMMENT '当direction=0有效，完整消息内容',
  `url_lists` text COLLATE utf8_bin COMMENT '当direction=1有效，url列表',
  `word_lists` text COLLATE utf8_bin COMMENT '当direction=1有效，（关键词，数量）列表',
  `length` int(10) DEFAULT '0' COMMENT '当direction=1有效，消息长度',
  PRIMARY KEY (`dp_id`,`service_staff_id`,`chat_time`,`buyer_nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='旺旺聊天对象表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_coupon`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_coupon` (
  `coupon_id` bigint(20) NOT NULL,
  `coupon_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '优惠券名',
  `shop_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime DEFAULT NULL COMMENT '生效日期',
  `end_time` datetime NOT NULL COMMENT '截止日期',
  `threshold` int(11) NOT NULL COMMENT '优惠券消费门槛(元)',
  `denomination_value` smallint(6) NOT NULL COMMENT '面额',
  `creator` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL COMMENT '优惠券是否启动',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝优惠券信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_coupon_denomination`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_coupon_denomination` (
  `denomination_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '面额名称',
  `denomination_value` smallint(6) NOT NULL DEFAULT '0' COMMENT '面额值',
  PRIMARY KEY (`denomination_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝优惠券面额字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_crm_member`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_crm_member` (
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '买家昵称',
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '会员的状态，normal正常，delete被买家删除，blacklist黑名单',
  `grade` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '会员等级，1：普通会员，2：高级会员，3：vip会员，4：至尊vip',
  `trade_count` int(11) DEFAULT NULL COMMENT '交易成功笔数',
  `trade_amount` double DEFAULT NULL COMMENT '交易成功的金额',
  `last_trade_time` datetime DEFAULT NULL COMMENT '最后交易时间',
  `last_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`dp_id`,`customerno`),
  KEY `idx_plt_taobao_crm_member_4view` (`customerno`,`dp_id`,`last_trade_time`),
  KEY `idx_plt_taobao_crm_member_grade` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺买家会员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_customer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_customer` (
  `customerno` varchar(50) NOT NULL COMMENT '用户id，CCMS系统用户ID,淘宝UID(number)',
  `full_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `sex` char(1) DEFAULT NULL COMMENT '性别。可选值:m(男),f(女)',
  `buyer_credit_lev` int(11) DEFAULT NULL COMMENT '买家信用等级',
  `buyer_credit_score` int(11) DEFAULT NULL COMMENT '买家信用评分',
  `buyer_credit_good_num` int(11) DEFAULT NULL COMMENT '买家好评订单数',
  `buyer_credit_total_num` int(11) DEFAULT NULL COMMENT '买家累计订单数',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `state` varchar(50) DEFAULT NULL COMMENT '省份',
  `country` varchar(100) DEFAULT NULL COMMENT '国家',
  `district` varchar(100) DEFAULT NULL COMMENT '区域',
  `created` datetime DEFAULT NULL COMMENT '用户淘宝注册时间',
  `last_visit` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `vip_info` varchar(20) DEFAULT NULL COMMENT '用户的全站vip信息，可取值如下：c(普通会员),asso_vip(荣誉会员)，vip1,vip2,vip3,vip4,vip5,vip6(六个等级的正式vip会员)，共8种取值，其中asso_vip是由vip会员衰退而成，与主站上的vip0对应。',
  `email` varchar(100) DEFAULT NULL COMMENT '用户email',
  `mobile` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户电话号码',
  `last_sync` datetime DEFAULT NULL COMMENT '数据最后一次同步时间',
  `job` varchar(50) DEFAULT NULL COMMENT '职业',
  `birth_year` smallint(6) DEFAULT NULL COMMENT '出生年份，四位整数',
  `changed` datetime DEFAULT NULL COMMENT '客户属性变更时间（仅限统一客户信息表uni_user中包含的属性）',
  `fullname_most` varchar(50) DEFAULT NULL COMMENT '买家最常用收货姓名',
  `mobile_most` varchar(20) DEFAULT NULL COMMENT '买家使用最多手机号',
  `phone_most` varchar(50) DEFAULT NULL COMMENT '买家使用最多电话',
  `country_most` varchar(100) DEFAULT NULL COMMENT '买家使用最多地址所在国家',
  `state_most` varchar(50) DEFAULT NULL COMMENT '买家使用最多地址所在省份',
  `city_most` varchar(50) DEFAULT NULL COMMENT '买家使用最多地址所在城市',
  `district_most` varchar(100) DEFAULT NULL COMMENT '买家使用最多地址所在区域',
  `address_most` varchar(255) DEFAULT NULL COMMENT '买家使用最多地址',
  `last_sync_most` datetime DEFAULT '2001-01-01 00:00:00' COMMENT '手机号最后更新时间',
  `fullname_modified` varchar(50) DEFAULT NULL COMMENT '买家动更新收货姓名',
  `mobile_modified` varchar(20) DEFAULT NULL COMMENT '买家手动更新手机号',
  `email_modified` varchar(100) DEFAULT NULL COMMENT '买家动更新邮箱',
  `birthday_modified` date DEFAULT NULL COMMENT '买家动更新生日',
  `sex_modified` char(1) DEFAULT NULL COMMENT '买家动更新性别',
  PRIMARY KEY (`customerno`),
  KEY `idx_plt_taobao_customer_last_sync` (`last_sync`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_favorite`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_favorite` (
  `type` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收藏对象类型：0为店铺；1为宝贝',
  `obj_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收藏对象id，如商品ID，店铺ID',
  `user_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '加密后的收藏者ID',
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收藏对象状态 若为宝贝 code=-1:小二删除商品 code= 0, 正常状态. code=101:卖家下架商品. code=102:小二下架商品.',
  `src` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收藏来源(无具体URL)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `dp_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`type`,`obj_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收藏夹表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_group_member`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_group_member` (
  `group_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '组名称',
  `member_list` text COLLATE utf8_bin COMMENT '组成员列表，逗号分隔',
  `group_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '组编号',
  `manager_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='旺旺客服表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_item_cat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_item_cat` (
  `cid` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品所属类目ID',
  `parent_cid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '类目名称',
  `is_leaf` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '该类目是否没有子类目',
  `sort_order` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `feature_list` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Feature对象列表 目前已有的属性： 若Attr_key为 udsaleprop，attr_value为1 则允许卖家在改类目新增自定义销售属性,不然为不允许',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_item_prop`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_item_prop` (
  `cid` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '类目ID',
  `pid` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '属性 ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '属性名',
  `is_key_prop` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '是否关键属性。可选值:true(是),false(否)',
  `is_sale_prop` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '是否销售属性。可选值:true(是),false(否)',
  `is_color_prop` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '是否颜色属性。可选值:true(是),false(否)',
  `child_template` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '子属性的模板（卖家自行输入属性时需要用到）',
  `parent_pid` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '上级属性ID',
  `parent_vid` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '上级属性值ID',
  `sort_order` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '排列序号。取值范围:大于零的整排列序号。取值范围:大于零的整数',
  `is_allow_alias` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许别名。可选值：true（是），false（否）',
  `type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `required` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`pid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_item_prop_val`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_item_prop_val` (
  `cid` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '类目ID',
  `pid` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '属性 ID',
  `vid` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '属性值ID',
  `prop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '属性名',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '属性值',
  `name_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '属性值别名',
  `sort_order` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '排列序号。取值范围:大于零的整数',
  `child_pid` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`vid`,`pid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='属性值列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_item_seller_cat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_item_seller_cat` (
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺类目类型：可选值：manual_type：手动分类，new_type：新品上价， tree_type：二三级类目树 ，property_type：属性叶子类目树， brand_type：品牌推广',
  `cid` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '卖家自定义类目编号',
  `parent_cid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父类目编号，值等于0：表示此类目为店铺下的一级类目，值不等于0：表示此类目有父类目',
  `dp_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺ID',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家自定义类目名称',
  `pic_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接图片地址',
  `sort_order` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '该类目在页面上的排序位置',
  `created` datetime DEFAULT NULL COMMENT '创建时间。格式：yyyy-MM-dd HH:mm:ss',
  `modified` datetime DEFAULT NULL COMMENT '修改时间。格式：yyyy-MM-dd HH:mm:ss',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='自定义类目维度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_message_bakup_ccms`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_message_bakup_ccms` (
  `mid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Messgae ID',
  `mcontent` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT 'Message 内容',
  `mtype` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='message 备份表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_message_bakup_tc`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_message_bakup_tc` (
  `mid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Messgae ID',
  `mcontent` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT 'Message 内容',
  `mtype` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='message 备份表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_order` (
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `created` datetime DEFAULT NULL COMMENT '交易创建时间',
  `endtime` datetime DEFAULT NULL COMMENT '交易结束时间',
  `status` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '交易状态,TRADE_NO_CREATE_PAY(没创建支付宝交易),WAIT_BUYER_PAY,WAIT_SELLER_SEND_GOODS,WAIT_BUYER_CONFIRM_GOODS,TRADE_BUYER_SIGNED(买家已签收,货到付款专用),TRADE_FINISHED,TRADE_CLOSED(付款以后用户退款成功，交易自动关闭),TRADE_CLOSED_BY_TAOBAO',
  `step_trade_status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '万人团订单状态 FRONT_NOPAID_FINAL_NOPAID(未付订金),FRONT_PAID_FINAL_NOPAID(已付订金未付尾款)',
  `trade_from` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易来源。 WAP(手机);HITAO(嗨淘);TOP(TOP平台);TAOBAO(普通淘宝);JHS(聚划算)',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。默认同时查询guarantee_trade, auto_delivery, ec, cod的4种交易类型的数据 可选值 fixed一口价 auction拍卖 guarantee_trade一口价、拍卖 auto_delivery自动发货 independent_simple_trade旺店入门版交易 independent_shop_trade旺店标准版交易 ec直冲 cod货到付款 fenxiao分销 game_equipment游戏装备...',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `total_fee` decimal(12,2) DEFAULT NULL COMMENT '商品金额',
  `post_fee` decimal(12,2) DEFAULT NULL COMMENT '邮费',
  `consign_time` datetime DEFAULT NULL COMMENT '卖家发货时间',
  `ccms_order_status` smallint(6) NOT NULL,
  `modified` datetime DEFAULT NULL COMMENT '订单修改时间',
  `alipay_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '支付宝交易号，如：2009112081173831',
  `payment` decimal(12,2) NOT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `discount_fee` decimal(12,2) DEFAULT NULL COMMENT '系统优惠金额（如打折，VIP，满就送等），精确到2位小数，单位：元。如：200.07，表示：200元7分',
  `point_fee` decimal(12,2) DEFAULT NULL COMMENT '买家使用积分。格式:100;单位:个.',
  `real_point_fee` decimal(12,2) DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分）。格式:100;单位:个',
  `shipping_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：ems, express, post, free, virtual。',
  `buyer_cod_fee` decimal(12,2) DEFAULT NULL COMMENT '买家货到付款服务费。精确到2位小数;单位:元。如:12.07，表示:12元7分',
  `seller_cod_fee` decimal(12,2) DEFAULT NULL COMMENT '卖家货到付款服务费。精确到2位小数;单位:元。如:12.07，表示:12元7分。卖家不承担服务费的订单：未发货的订单获取服务费为0，发货后就能获取到正确值。',
  `express_agency_fee` decimal(12,2) DEFAULT NULL COMMENT '快递代收款。精确到2位小数;单位:元。如:212.07，表示:212元7分',
  `adjust_fee` decimal(12,2) DEFAULT NULL COMMENT '卖家手工调整金额，精确到2位小数，单位：元。如：200.07，表示：200元7分。来源于订单价格修改，如果有多笔子订单的时候，这个为0，单笔的话则跟[order].adjust_fee一样',
  `buyer_obtain_point_fee` decimal(12,2) DEFAULT NULL COMMENT '买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。',
  `cod_fee` decimal(12,2) DEFAULT NULL COMMENT '货到付款服务费。精确到2位小数;单位:元。如:12.07，表示:12元7分。',
  `cod_status` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '货到付款物流状态。 初始状态 NEW_CREATED,接单成功 CANCELED,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 RECIEVE_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED',
  `buyer_alipay_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家支付宝账号',
  `receiver_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_state` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的电话号码',
  `buyer_email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家邮件地址',
  `commission_fee` decimal(12,2) DEFAULT NULL COMMENT '交易佣金。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `refund_fee` decimal(12,2) DEFAULT NULL COMMENT '子订单的退款金额合计',
  `num` int(11) DEFAULT NULL COMMENT '商品数量总计',
  `received_payment` decimal(12,2) DEFAULT NULL COMMENT '卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `buyer_memo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '买家备注',
  `seller_memo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家备注',
  `seller_flag` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家备注旗帜',
  `seller_rate` tinyint(1) DEFAULT NULL COMMENT '卖家是否已评价:true(已评价)，false(未评价)',
  `buyer_rate` tinyint(1) DEFAULT NULL COMMENT '买家是否已评价:true(已评价)，false(未评价)',
  `trade_insert` datetime DEFAULT '2001-01-01 00:00:00' COMMENT '订单入库时间',
  `trade_update` datetime DEFAULT '2001-01-01 00:00:00' COMMENT '订单最新更新时间',
  PRIMARY KEY (`tid`),
  KEY `idx_plt_taobao_order_customerno` (`customerno`),
  KEY `idx_plt_taobao_order_created` (`created`,`customerno`,`ccms_order_status`,`dp_id`),
  KEY `idx_plt_taobao_order_pay_time` (`pay_time`),
  KEY `idx_plt_taobao_order_consign_time` (`consign_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_order_channel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_order_channel` (
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `created` datetime DEFAULT NULL COMMENT '交易创建时间',
  `endtime` datetime DEFAULT NULL COMMENT '交易结束时间',
  `status` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '交易状态,TRADE_NO_CREATE_PAY(没创建支付宝交易),WAIT_BUYER_PAY,WAIT_SELLER_SEND_GOODS,WAIT_BUYER_CONFIRM_GOODS,TRADE_BUYER_SIGNED(买家已签收,货到付款专用),TRADE_FINISHED,TRADE_CLOSED(付款以后用户退款成功，交易自动关闭),TRADE_CLOSED_BY_TAOBAO',
  `step_trade_status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '万人团订单状态 FRONT_NOPAID_FINAL_NOPAID(未付订金),FRONT_PAID_FINAL_NOPAID(已付订金未付尾款)',
  `trade_from` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易来源。 WAP(手机);HITAO(嗨淘);TOP(TOP平台);TAOBAO(普通淘宝);JHS(聚划算)',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。默认同时查询guarantee_trade, auto_delivery, ec, cod的4种交易类型的数据 可选值 fixed一口价 auction拍卖 guarantee_trade一口价、拍卖 auto_delivery自动发货 independent_simple_trade旺店入门版交易 independent_shop_trade旺店标准版交易 ec直冲 cod货到付款 fenxiao分销 game_equipment游戏装备...',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `total_fee` decimal(12,2) DEFAULT NULL COMMENT '商品金额',
  `post_fee` decimal(12,2) DEFAULT NULL COMMENT '邮费',
  `consign_time` datetime DEFAULT NULL COMMENT '卖家发货时间',
  `ccms_order_status` smallint(6) NOT NULL,
  `modified` datetime DEFAULT NULL COMMENT '订单修改时间',
  `alipay_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '支付宝交易号，如：2009112081173831',
  `payment` decimal(12,2) NOT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `discount_fee` decimal(12,2) DEFAULT NULL COMMENT '系统优惠金额（如打折，VIP，满就送等），精确到2位小数，单位：元。如：200.07，表示：200元7分',
  `point_fee` decimal(12,2) DEFAULT NULL COMMENT '买家使用积分。格式:100;单位:个.',
  `real_point_fee` decimal(12,2) DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分）。格式:100;单位:个',
  `shipping_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：ems, express, post, free, virtual。',
  `buyer_cod_fee` decimal(12,2) DEFAULT NULL COMMENT '买家货到付款服务费。精确到2位小数;单位:元。如:12.07，表示:12元7分',
  `seller_cod_fee` decimal(12,2) DEFAULT NULL COMMENT '卖家货到付款服务费。精确到2位小数;单位:元。如:12.07，表示:12元7分。卖家不承担服务费的订单：未发货的订单获取服务费为0，发货后就能获取到正确值。',
  `express_agency_fee` decimal(12,2) DEFAULT NULL COMMENT '快递代收款。精确到2位小数;单位:元。如:212.07，表示:212元7分',
  `adjust_fee` decimal(12,2) DEFAULT NULL COMMENT '卖家手工调整金额，精确到2位小数，单位：元。如：200.07，表示：200元7分。来源于订单价格修改，如果有多笔子订单的时候，这个为0，单笔的话则跟[order].adjust_fee一样',
  `buyer_obtain_point_fee` decimal(12,2) DEFAULT NULL COMMENT '买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。',
  `cod_fee` decimal(12,2) DEFAULT NULL COMMENT '货到付款服务费。精确到2位小数;单位:元。如:12.07，表示:12元7分。',
  `cod_status` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '货到付款物流状态。 初始状态 NEW_CREATED,接单成功 CANCELED,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 RECIEVE_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED',
  `buyer_alipay_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家支付宝账号',
  `receiver_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_state` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的电话号码',
  `buyer_email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家邮件地址',
  `commission_fee` decimal(12,2) DEFAULT NULL COMMENT '交易佣金。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `refund_fee` decimal(12,2) DEFAULT NULL COMMENT '子订单的退款金额合计',
  `num` int(11) DEFAULT NULL COMMENT '商品数量总计',
  `received_payment` decimal(12,2) DEFAULT NULL COMMENT '卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `buyer_memo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '买家备注',
  `seller_memo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家备注',
  `seller_flag` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家备注旗帜',
  PRIMARY KEY (`tid`),
  KEY `idx_plt_taobao_order_channel_dp_id` (`dp_id`,`customerno`,`created`,`endtime`,`pay_time`,`modified`,`consign_time`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`ccms_order_status`),
  KEY `idx_plt_taobao_order_channel_created` (`created`,`customerno`,`endtime`,`pay_time`,`modified`,`consign_time`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`dp_id`,`ccms_order_status`),
  KEY `idx_plt_taobao_order_channel_endtime` (`endtime`,`customerno`,`created`,`pay_time`,`modified`,`consign_time`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`dp_id`,`ccms_order_status`),
  KEY `idx_plt_taobao_order_channel_pay_time` (`pay_time`,`customerno`,`created`,`endtime`,`modified`,`consign_time`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`dp_id`,`ccms_order_status`),
  KEY `idx_plt_taobao_order_channel_modified` (`modified`,`customerno`,`created`,`endtime`,`pay_time`,`consign_time`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`dp_id`,`ccms_order_status`),
  KEY `idx_plt_taobao_order_channel_consign_time` (`consign_time`,`customerno`,`created`,`endtime`,`pay_time`,`modified`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`dp_id`,`ccms_order_status`),
  KEY `idx_plt_taobao_order_channel_customerno` (`customerno`,`created`,`consign_time`,`endtime`,`pay_time`,`modified`,`payment`,`status`,`type`,`total_fee`,`refund_fee`,`num`,`received_payment`,`trade_from`,`dp_id`,`ccms_order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_order_item`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_order_item` (
  `oid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '子订单编号',
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `total_fee` decimal(12,2) DEFAULT NULL COMMENT '应付金额',
  `discount_fee` decimal(12,2) DEFAULT NULL COMMENT '订单优惠金额',
  `adjust_fee` decimal(12,2) DEFAULT NULL COMMENT '手工调整金额',
  `payment` decimal(12,2) DEFAULT NULL COMMENT '子订单实付金额',
  `status` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单状态',
  `step_trade_status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `num_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品数字ID',
  `created` datetime DEFAULT NULL COMMENT '交易创建时间',
  `endtime` datetime DEFAULT NULL COMMENT '交易结束时间',
  `trade_from` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易来源。 WAP(手机);HITAO(嗨淘);TOP(TOP平台);TAOBAO(普通淘宝);JHS(聚划算)',
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。默认同时查询guarantee_trade, auto_delivery, ec, cod的4种交易类型的数据 可选值 fixed一口价 auction拍卖 guarantee_trade一口价、拍卖 auto_delivery自动发货 independent_simple_trade旺店入门版交易 independent_shop_trade旺店标准版交易 ec直冲 cod货到付款 fenxiao分销 game_equipment游戏装备...',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '卖家发货时间',
  `refund_status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '退款状态。 可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `refund_fee` decimal(12,2) DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `ccms_order_status` smallint(6) NOT NULL COMMENT 'CCMS自定义的订单状态',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `modified` datetime DEFAULT NULL COMMENT '订单修改时间（冗余字段）',
  `pic_path` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片的绝对路径',
  `price` decimal(12,2) DEFAULT NULL COMMENT '商品价格',
  `sku_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的最小库存单位Sku的id',
  `sku_properties_name` text COLLATE utf8_bin COMMENT 'SKU的值',
  `cid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易商品对应的类目ID',
  `refund_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '最近退款ID',
  `item_meal_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '套餐ID',
  `item_meal_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '套餐的值',
  `outer_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)',
  `seller_rate` tinyint(1) DEFAULT NULL COMMENT '卖家是否已评价:true(已评价)，false(未评价)',
  `buyer_rate` tinyint(1) DEFAULT NULL COMMENT '买家是否已评价:true(已评价)，false(未评价)',
  `trade_insert` datetime DEFAULT '2001-01-01 00:00:00' COMMENT '订单入库时间',
  `trade_update` datetime DEFAULT '2001-01-01 00:00:00' COMMENT '订单最新更新时间',
  is_oversold tinyint(1) default NULL comment '是否超卖',
  logistics_company varchar(200) default NULL comment '子订单发货的快递公司名称',
  invoice_no varchar(50) comment '子订单运单号',
  zhengji_status varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '征集订单状态',
  divide_order_fee decimal(12,2) DEFAULT NULL COMMENT '分摊后的实付金额',
  part_mjz_discount decimal(12,2) DEFAULT NULL COMMENT '优惠分摊',
  PRIMARY KEY (`oid`),
  KEY `idx_plt_taobao_order_item_tid` (`tid`),
  KEY `idx_plt_taobao_order_item_num_iid` (`num_iid`),
  KEY `idx_plt_taobao_order_item_created` (`created`),
  KEY `idx_plt_taobao_order_item_pay_time` (`pay_time`),
  KEY `idx_plt_taobao_order_item_consign_time` (`consign_time`),
  KEY `idx_plt_taobao_order_item_modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单明细表（子订单/商品明细）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_order_item_channel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_order_item_channel` (
  `oid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '子订单编号',
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `total_fee` decimal(12,2) DEFAULT NULL COMMENT '应付金额',
  `discount_fee` decimal(12,2) DEFAULT NULL COMMENT '订单优惠金额',
  `adjust_fee` decimal(12,2) DEFAULT NULL COMMENT '手工调整金额',
  `payment` decimal(12,2) DEFAULT NULL COMMENT '子订单实付金额',
  `status` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单状态',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `num_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品数字ID',
  `created` datetime DEFAULT NULL COMMENT '交易创建时间',
  `endtime` datetime DEFAULT NULL COMMENT '交易结束时间',
  `trade_from` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易来源。 WAP(手机);HITAO(嗨淘);TOP(TOP平台);TAOBAO(普通淘宝);JHS(聚划算)',
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。默认同时查询guarantee_trade, auto_delivery, ec, cod的4种交易类型的数据 可选值 fixed一口价 auction拍卖 guarantee_trade一口价、拍卖 auto_delivery自动发货 independent_simple_trade旺店入门版交易 independent_shop_trade旺店标准版交易 ec直冲 cod货到付款 fenxiao分销 game_equipment游戏装备...',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '卖家发货时间',
  `refund_status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '退款状态。 可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `refund_fee` decimal(12,2) DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `ccms_order_status` smallint(6) NOT NULL COMMENT 'CCMS自定义的订单状态',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `modified` datetime DEFAULT NULL COMMENT '订单修改时间（冗余字段）',
  `price` decimal(12,2) DEFAULT NULL COMMENT '商品价格',
  `sku_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的最小库存单位Sku的id',
  `sku_properties_name` text COLLATE utf8_bin COMMENT 'SKU的值',
  `cid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易商品对应的类目ID',
  `refund_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '最近退款ID',
  `item_meal_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '套餐ID',
  `item_meal_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '套餐的值',
  `outer_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)',
  `pic_path` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片的绝对路径',
  PRIMARY KEY (`oid`),
  KEY `idx_plt_taobao_order_item_channel_tid` (`tid`),
  KEY `idx_plt_taobao_order_item_channel_num_iid` (`num_iid`),
  KEY `idx_plt_taobao_order_item_channel_created` (`created`),
  KEY `idx_plt_taobao_order_item_channel_pay_time` (`pay_time`),
  KEY `idx_plt_taobao_order_item_channel_consign_time` (`consign_time`),
  KEY `idx_plt_taobao_order_item_channel_modified` (`modified`),
  KEY `idx_plt_taobao_order_item_channel_dp_id` (`dp_id`),
  KEY `idx_plt_taobao_order_item_channel_ccms_order_status` (`ccms_order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单明细表（子订单/商品明细）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_pay_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_pay_type` (
  `pay_id` bigint(20) NOT NULL,
  `pay_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付类型',
  `pay_type_desc` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='零售版支付类型的数据字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_product` (
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品数字ID',
  `detail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品URL',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '商品标题，商品名称',
  `created` datetime DEFAULT NULL COMMENT 'Item的发布时间',
  `is_fenxiao` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '非分销商品：0，代销：1，经销：2',
  `cid` bigint(20) DEFAULT NULL COMMENT '商品所属的叶子类目 id',
  `pic_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  `list_time` datetime DEFAULT NULL COMMENT '商品上架时间',
  `delist_time` datetime DEFAULT NULL COMMENT '下架时间',
  `price` decimal(12,2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_status` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品上传后的状态。onsale出售中，instock库中',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `outer_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商家外部编码',
  `seller_cids` text COLLATE utf8_bin COMMENT '商品所属的店铺内卖家自定义类目列表',
  `props` text COLLATE utf8_bin COMMENT '商品属性 格式：pid:vid;pid:vid',
  `props_name` text COLLATE utf8_bin,
  `input_pids` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '用户自行输入的类目属性ID串',
  `input_str` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户自行输入的子属性名和属性值',
  `last_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`num_iid`),
  KEY `idx_plt_taobao_product_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_product_onsale`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_product_onsale` (
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品数字ID',
  `detail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品URL',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '商品标题，商品名称',
  `created` datetime DEFAULT NULL COMMENT 'Item的发布时间',
  `is_fenxiao` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '非分销商品：0，代销：1，经销：2',
  `cid` bigint(20) DEFAULT NULL COMMENT '商品所属的叶子类目 id',
  `pic_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  `list_time` datetime DEFAULT NULL COMMENT '商品上架时间',
  `delist_time` datetime DEFAULT NULL COMMENT '下架时间',
  `price` decimal(12,2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_status` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品上传后的状态。onsale出售中，instock库中',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `outer_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商家外部编码',
  `seller_cids` text COLLATE utf8_bin COMMENT '商品所属的店铺内卖家自定义类目列表',
  `props` text COLLATE utf8_bin COMMENT '商品属性 格式：pid:vid;pid:vid',
  `props_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '商品属性名称',
  `input_pids` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '用户自行输入的类目属性ID串',
  `input_str` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户自行输入的子属性名和属性值',
  PRIMARY KEY (`num_iid`),
  KEY `idx_plt_taobao_product_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_product_prop`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_product_prop` (
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品ID',
  `pid` varchar(150) COLLATE utf8_bin NOT NULL COMMENT '属性ID',
  `prop_name` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '属性名',
  `vid` varchar(150) COLLATE utf8_bin NOT NULL COMMENT '属性值ID',
  `name` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '属性值名称',
  `name_alias` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '属性值别名',
  `is_input_prop` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num_iid`,`pid`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品对应的商品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_product_seller_cat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_product_seller_cat` (
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `seller_cid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '卖家自定义类目编号',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家自定义类目名称',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺类目类型：可选值：manual_type：手动分类，new_type：新品上价， tree_type：二三级类目树 ，property_type：属性叶子类目树， brand_type：品牌推广',
  PRIMARY KEY (`num_iid`,`seller_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品对应的卖家自定义类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_product_skus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_product_skus` (
  `properties_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所对应的销售属性的中文名字串',
  `sku_spec_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '表示SKu上的产品规格信息',
  `with_hold_quantity` int(10) DEFAULT '0' COMMENT '商品在付款减库存的状态下，该sku上未付款的订单数量',
  `sku_delivery_time` datetime DEFAULT NULL COMMENT 'sku级别发货时间',
  `change_prop` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '基础色数据',
  `sku_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'sku的id',
  `dp_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `iid` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所属商品id',
  `num_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所属商品数字id',
  `properties` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku的销售属性组合字符串',
  `quantity` int(10) DEFAULT '0' COMMENT '属于这个sku的商品的数量',
  `price` decimal(12,2) DEFAULT NULL COMMENT '属于这个sku的商品的价格 ',
  `outer_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商家设置的外部id',
  `created` datetime DEFAULT NULL COMMENT 'sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `modified` datetime DEFAULT NULL COMMENT 'sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku状态。 normal:正常 ；delete:删除',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sku表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_product_skus_prop`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_product_skus_prop` (
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品ID',
  `sku_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'sku的id',
  `pid` varchar(150) COLLATE utf8_bin NOT NULL COMMENT '属性ID',
  `vid` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '属性值ID',
  `pidname` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '属性名',
  `vidname` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '属性值名',
  PRIMARY KEY (`num_iid`,`sku_id`,`pid`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sku的prop长表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_promotion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_promotion` (
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `oid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '子订单编号',
  `promotion_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '优惠信息的名称',
  `discount_fee` decimal(12,2) DEFAULT NULL COMMENT '优惠金额（免运费、限时打折时为空）,单位：元',
  `gift_item_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '满就送商品时，所送商品的名称',
  `gift_item_id` bigint(20) DEFAULT NULL COMMENT '赠品的宝贝id',
  `gift_item_num` bigint(20) DEFAULT NULL COMMENT '满就送礼物的礼物数量',
  `promotion_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '优惠活动的描述',
  `promotion_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '优惠id',
  KEY `idx_plt_taobao_promotion_id` (`tid`,`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单优惠信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_refund`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_refund` (
  `refund_id` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '退款单号',
  `tid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '淘宝交易单号',
  `oid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '子订单号',
  `dp_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺ID',
  `total_fee` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '交易总金额',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `seller_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `created` datetime DEFAULT NULL COMMENT '退款申请时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `order_status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '退款对应的交易状态',
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '退款状态',
  `good_status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '货物状态',
  `has_good_return` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买家是否需要退货.可选值:true, false',
  `refund_fee` decimal(12,2) DEFAULT NULL COMMENT '退还金额(退还给买家的金额)',
  `payment` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '支付给卖家的金额(交易总额-退还给买家的金额)',
  `reason` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '退款原因',
  `refund_desc` text COLLATE utf8_bin,
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `num` int(11) DEFAULT NULL COMMENT '商品购买数量',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司名称',
  `sid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '退货运单号',
  `cs_status` int(11) DEFAULT NULL COMMENT '不需客服介入1; 需要客服介入2; 客服已经介入3; 客服初审完成 4; 客服主管复审失败5; 客服处理完成6',
  `price` decimal(12,2) DEFAULT NULL COMMENT '商品价格。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `good_return_time` datetime DEFAULT NULL COMMENT '退货时间。格式:yyyy-MM-dd HH:mm:ss',
  `num_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '申请退款的商品数字编号',
  `remind_type` int(11) DEFAULT NULL COMMENT '提醒的类型（退款详情中提示信息的类型）',
  `exist_timeout` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否存在超时。可选值:true(是),false(否)',
  `timeout` datetime DEFAULT NULL COMMENT '超时时间',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='退款信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_shipping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_shipping` (
  `order_code` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '物流订单编号',
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '交易ID',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `is_quick_cod_order` tinyint(1) DEFAULT NULL,
  `seller_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '卖家昵称',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `delivery_end` datetime DEFAULT NULL COMMENT '预约取货结束时间',
  `delivery_start` datetime DEFAULT NULL COMMENT '预约取货开始时间',
  `out_sid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号.具体一个物流公司的运单号码.',
  `item_title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '货物名称',
  `receiver_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收件人手机号码',
  `receiver_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收件人电话',
  `status` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流订单状态,CREATED(已创建) RECREATED(重新创建) CANCELLED(订单已取消) CLOSED(订单关闭) SENDING(等候发送给物流公司) ACCEPTING(已发送给物流公司,等待接单) ACCEPTED(物流公司已接单) REJECTED(物流公司不接单) PICK_UP(物流公司揽收成功) PICK_UP_FAILED(物流公司揽收失败) LOST(物流公司丢单) REJECTED_BY_RECEIVER(拒签) ACCEPTED_BY_RECEIVER(已签收)',
  `type` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).',
  `freight_payer` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '谁承担运费.可选值:buyer(买家承担),seller(卖家承担运费).',
  `seller_confirm` tinyint(1) DEFAULT NULL,
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司名称',
  `is_success` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '运单创建时间',
  `modified` datetime DEFAULT NULL COMMENT '运单修改时间',
  PRIMARY KEY (`order_code`),
  KEY `idx_plt_taobao_shipping_dp_id` (`dp_id`),
  KEY `idx_plt_taobao_shipping_tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝物流运单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_shop`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_shop` (
  `shop_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '店铺名称，即店主用户昵称',
  `shop_type` char(5) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺类型，B天猫店，C淘宝店',
  `acookie_visit_date` date DEFAULT NULL,
  `order_created_earliest` datetime DEFAULT NULL COMMENT '店铺最早订单时间',
  `order_created_latest` datetime DEFAULT NULL COMMENT '店铺最新订单时间',
  `is_etl_switch` tinyint(1) DEFAULT '1' COMMENT '店铺ETL数据更新开关：1为打开，0为关闭',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝店普信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_shop_cid_relation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_shop_cid_relation` (
  `cid` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '类目id',
  `dp_id` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`cid`,`dp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_shop_customer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_shop_customer` (
  `shop_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`shop_id`,`customerno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝的顾客和店铺关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_shopping_cart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_shopping_cart` (
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品ID',
  `sku_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'SKU ID',
  `user_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '加密后的收藏者ID,可与其他api的buyer_id关联 ',
  `num` int(10) DEFAULT NULL COMMENT '购买数量',
  `status` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '-1、表示因为下单被删除. -2、用户以访客身份浏览商品并添加到访客购物车后，以会员身份再次登陆，\r\n则系统会将“访客”购物车与会员购物车合并，此时发现存在重复商品，则会删除其一，状态置为-2. -3、用户主动删除购物车内商品.\r\n-4、 A：商品已下架/删除.B：购物车内有两个相同的宝贝。由于客户端引致的并发请求，系统会作清理，将冗余的置-4\r\n0、 系统错误。1、正常购买状态. ',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `dp_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`num_iid`,`sku_id`,`user_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_sku_onsale`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_sku_onsale` (
  `properties_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所对应的销售属性的中文名字串',
  `sku_spec_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '表示SKu上的产品规格信息',
  `with_hold_quantity` int(10) DEFAULT '0' COMMENT '商品在付款减库存的状态下，该sku上未付款的订单数量',
  `sku_delivery_time` datetime DEFAULT NULL COMMENT 'sku级别发货时间',
  `change_prop` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '基础色数据',
  `sku_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'sku的id',
  `iid` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所属商品id',
  `num_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所属商品数字id',
  `properties` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku的销售属性组合字符串',
  `quantity` int(10) DEFAULT '0' COMMENT '属于这个sku的商品的数量',
  `price` decimal(12,2) DEFAULT NULL COMMENT '属于这个sku的商品的价格 ',
  `outer_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商家设置的外部id',
  `created` datetime DEFAULT NULL COMMENT 'sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `modified` datetime DEFAULT NULL COMMENT 'sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku状态。 normal:正常 ；delete:删除',
  `dp_id` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺的唯一标识',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sku表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_target_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_taobao_target_type` (
  `target_id` bigint(20) NOT NULL,
  `target_value` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `target_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单查询的客户汇总指标字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plt_taobao_traderate`
--


CREATE TABLE `plt_taobao_traderate` (
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '交易ID',
  `oid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '子订单ID',
  `num_iid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品数字id',
  `dp_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '店铺ID',
  `valid_score` tinyint(1) DEFAULT NULL,
  `role` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '评价者角色.可选值:seller(卖家),buyer(买家)',
  `nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '评价者昵称',
  `result` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '评价结果,可选值:good(好评),neutral(中评),bad(差评)',
  `created` datetime DEFAULT NULL COMMENT '评价创建时间,格式:yyyy-MM-dd HH:mm:ss',
  `rated_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '被评价者昵称',
  `item_title` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `item_price` decimal(12,2) DEFAULT NULL COMMENT '商品价格,精确到2位小数;单位:元.如:200.07，表示:200元7分',
  `content` text COLLATE utf8_bin,
  `reply` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '回评',
  PRIMARY KEY (`tid`,`oid`),
  KEY `idx_plt_taobao_traderate_nick` (`nick`),
  KEY `idx_plt_taobao_traderate_numiid` (`num_iid`),
  KEY `idx_plt_taobao_traderate_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='交易评价信息';


--
-- Table structure for table `plt_taobao_transitstepinfo`
--


CREATE TABLE `plt_taobao_transitstepinfo` (
  `tid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单ID',
  `out_sid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号.具体一个物流公司的运单号码.',
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单的物流状态 * 等候发送给物流公司 *已提交给物流公司,等待物流公司接单 *已经确认消息接收，等待物流公司接单 *物流公司已接单 *物流公司不接单 *物流公司揽收失败 *物流公司揽收成功 *签收失败 *对方已签收 *对方拒绝签收',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司名称',
  `transit_step_info` text COLLATE utf8_bin COMMENT '流转信息文件路径',
  `created` datetime DEFAULT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝物流流转数据表';


CREATE TABLE plt_taobao_transitstepinfo_tc (
  tid varchar(50) NOT NULL COMMENT '订单ID',
  out_sid varchar(50) DEFAULT NULL COMMENT '运单号.具体一个物流公司的运单号码.',
  status varchar(50) DEFAULT NULL COMMENT '订单的物流状态 * 等候发送给物流公司 *已提交给物流公司,等待物流公司接单 *已经确认消息接收，等待物流公司接单 *物流公司已接单 *物流公司不接单 *物流公司揽收失败 *物流公司揽收成功 *签收失败 *对方已签收 *对方拒绝签收',
  logistics_status int(11) DEFAULT NULL COMMENT '解析的订单物流状态',
  company_name varchar(200) DEFAULT NULL COMMENT '物流公司名称',
  transit_step_info text COMMENT '流转信息文件路径',
  shipping_status int(11) DEFAULT NULL COMMENT '流转状态：1:到同城，2、派件；3：已签收',
  dp_id varchar(50) DEFAULT NULL,
  receiver_state varchar(50) DEFAULT NULL,
  consign_time datetime DEFAULT NULL,
  signed_time datetime DEFAULT NULL COMMENT '签收时间',
  arrived_time datetime DEFAULT NULL COMMENT '到达同城时间',
  delivery_time datetime DEFAULT NULL COMMENT '派件时间',
  recently_time datetime DEFAULT NULL COMMENT '最近物流更新时间',
  abnormal_status varchar(20) DEFAULT NULL COMMENT '异常状态信息',
  created timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  updated datetime DEFAULT NULL COMMENT '数据修改时间',
  PRIMARY KEY (tid),
  KEY idx_plt_taobao_transitstepinfo_tc_status (status) USING BTREE,
  KEY idx_plt_taobao_transitstepinfo_tc_shipping_status (shipping_status) USING BTREE,
  KEY idx_plt_taobao_transitstepinfo_tc_updated (updated) USING BTREE
);

-- Dump completed on 2014-05-01 19:41:43


-- ----------------------------
CREATE TABLE `plt_taobao_order_type` (
  `type` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '交易类型，可选值 fixed一口价 auction拍卖 guarantee_trade一口价、拍卖 auto_delivery自动发货 independent_simple_trade旺店入门版交易 independent_shop_trade旺店标准版交易 ec直冲 cod货到付款 fenxiao分销 game_equipment游戏装备...',
  `type_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '交易类型名称',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='淘宝订单交易类型';

-- ----------------------------
-- Records of plt_taobao_order_type
-- ----------------------------
INSERT INTO `plt_taobao_order_type` VALUES ('auction', '拍卖');
INSERT INTO `plt_taobao_order_type` VALUES ('auto_delivery', '自动发货');
INSERT INTO `plt_taobao_order_type` VALUES ('cod', '货到付款');
INSERT INTO `plt_taobao_order_type` VALUES ('ec', '直冲');
INSERT INTO `plt_taobao_order_type` VALUES ('external_trade', '统一外部交易');
INSERT INTO `plt_taobao_order_type` VALUES ('fenxiao', '分销');
INSERT INTO `plt_taobao_order_type` VALUES ('fixed', '一口价');
INSERT INTO `plt_taobao_order_type` VALUES ('game_equipment', '游戏装备');
INSERT INTO `plt_taobao_order_type` VALUES ('guarantee_trade', '一口价、拍卖');
INSERT INTO `plt_taobao_order_type` VALUES ('independent_shop_trade', '旺店标准版交易');
INSERT INTO `plt_taobao_order_type` VALUES ('independent_simple_trade', '旺店入门版交易');
INSERT INTO `plt_taobao_order_type` VALUES ('netcn_trade', '万网交易');
INSERT INTO `plt_taobao_order_type` VALUES ('shopex_trade', 'ShopEX交易');
INSERT INTO `plt_taobao_order_type` VALUES ('step', '万人团');

alter table plt_taobao_customer  add updated datetime DEFAULT NULL COMMENT '最后更新时间';
ALTER TABLE plt_taobao_traderate MODIFY COLUMN reply VARCHAR(1000) DEFAULT NULL COMMENT '回评';
ALTER TABLE plt_taobao_product_skus MODIFY quantity int(11) DEFAULT '0' COMMENT '属于这个sku的商品的数量';
ALTER TABLE plt_taobao_customer MODIFY COLUMN customerno VARCHAR(50) BINARY NOT NULL COMMENT '用户id，CCMS系统用户ID,淘宝UID(number)';
ALTER TABLE plt_taobao_order ADD INDEX idx_plt_taobao_order_payment(payment);
ALTER TABLE plt_taobao_order ADD INDEX idx_plt_taobao_order_dp_id(dp_id);

CREATE TABLE plt_taobao_behavior_product_top5 (
  shop_id varchar(50) NOT NULL COMMENT '店铺ID',
  the_date date NOT NULL COMMENT '商品/店/天 算一条记录 当天日期前7天',
  num_iid varchar(50)  COMMENT '商品ID',
  gmv_auction_num bigint(20) COMMENT '商品被拍下的总件数',
  PRIMARY KEY (num_iid,shop_id,the_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '热销TOP5商品列表和销售数量汇总';


CREATE TABLE plt_taobao_pc_behavior_log (
  customerno varchar(100) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  shop_id varchar(50) NOT NULL COMMENT '店铺ID',
  the_date date NOT NULL COMMENT '人/店/天 算一条记录',
  PRIMARY KEY (customerno,shop_id,the_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '每天通过PC端浏览的客户,记录当天日期前7天数据';


CREATE TABLE plt_taobao_wireless_behavior_log (
  customerno varchar(100) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  shop_id varchar(50) NOT NULL COMMENT '店铺ID',
  the_date date NOT NULL COMMENT '人/店/天 算一条记录',
  PRIMARY KEY (customerno,shop_id,the_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '每天通过无线端浏览的客户,记录当天日期前7天数据';



CREATE TABLE plt_taobao_collect_shop_behavior (
  customerno varchar(100) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  shop_id varchar(50) NOT NULL COMMENT '店铺ID',
  collect_item_id varchar(50) NOT NULL COMMENT '收藏对象ID(店铺ID)',
  collect_time datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (shop_id,customerno,collect_item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '客户收藏夹行为-店铺';


CREATE TABLE plt_taobao_collect_product_behavior (
  customerno varchar(100) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  shop_id varchar(50) NOT NULL COMMENT '店铺ID',
  collect_item_id varchar(50) NOT NULL COMMENT '收藏对象ID(商品ID)',
  collect_time datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (shop_id,customerno,collect_item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '客户收藏夹行为-商品';












