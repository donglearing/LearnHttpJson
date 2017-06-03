-- ----------------------------
-- Table structure for `loyalty_cartyid_dic`
-- ----------------------------
CREATE TABLE `loyalty_cartyid_dic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cty_id` bigint(20) NOT NULL COMMENT '卡类型ID',
  `cty_name` varchar(50) NOT NULL COMMENT '卡类型名称',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺ID',
  `create_at` date DEFAULT NULL COMMENT '生成时间',
  `update_at` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cty_id` (`cty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='卡类型字典表';


-- ----------------------------
-- Table structure for `loyalty_point_type_dic`
-- ----------------------------
CREATE TABLE `loyalty_point_type_dic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `point_type_id` bigint(20) NOT NULL COMMENT '积分类型ID',
  `point_name` varchar(50) NOT NULL COMMENT '积分类型名称',
  `cty_id` bigint(20) NOT NULL COMMENT '卡类型ID',
  `create_at` date DEFAULT NULL COMMENT '生成时间',
  `update_at` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_point_type_id` (`point_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='积分类型字典表';

-- 会员类型字典表
CREATE TABLE `loyalty_membergrade_dic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` bigint(20) NOT NULL COMMENT '会员优先级',
  `membergrad_name` varchar(50) NOT NULL COMMENT '会员类型名称',
  `cty_id` bigint(20) NOT NULL COMMENT '卡类型ID',
  `create_at` date DEFAULT NULL COMMENT '生成时间',
  `update_at` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_member_cty_type` (`priority`,`cty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员类型字典表'
