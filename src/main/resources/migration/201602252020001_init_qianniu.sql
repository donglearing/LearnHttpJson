--// Create Changelog

-- Default DDL for changelog table that will keep
-- a record of the migrations that have been run.

-- You can modify this to suit your database before
-- running your first migration.

-- Be sure that ID and DESCRIPTION fields exist in
-- BigInteger and String compatible fields respectively.

CREATE TABLE `workbench_attr_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(100) COLLATE utf8_bin NOT NULL,
  `attr_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '属性',
  `attr_id` bigint(20) NOT NULL,
  `attr_item_column` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '属性值对应的字段',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `create_at` datetime DEFAULT NULL COMMENT '生成时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workbench_attr_entry_uk` (`shop_id`,`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客服工作台数据-店铺&属性表' ;

CREATE TABLE `workbench_attr_enum` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `attr_id` bigint(50) NOT NULL COMMENT '枚举属性ID',
  `enum_id` bigint(50) NOT NULL,
  `enum_value` varchar(50) NOT NULL COMMENT '枚举值',
  `shop_id` varchar(100) NOT NULL COMMENT '店铺id',
  `created` datetime DEFAULT NULL COMMENT '生成时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  `disabled` tinyint(1) DEFAULT '0' COMMENT '此枚举值是否删除 1:已删除 0:未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_id_value` (`enum_id`),
  KEY `idx_workbench_attr_enum_attr_id` (`attr_id`),
  KEY `idx_workbench_attr_enum_enum_id` (`enum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='客服工作台数据枚举值表';

CREATE TABLE `workbench_attr_item_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(100) COLLATE utf8_bin NOT NULL,
  `buyer_nick` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性ID',
  `date_value` date DEFAULT NULL COMMENT '时间类型属性值',
  `string_value` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '字符类型属性值',
  `double_value` decimal(20,4) DEFAULT NULL COMMENT '数值类型属性值',
  `create_at` datetime DEFAULT NULL COMMENT '生成时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `dic_value` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workbench_attr_item_entry_uk` (`shop_id`,`buyer_nick`,`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺&属性&item表';


 CREATE TABLE `workbench_label_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL COMMENT '店铺ID',
  `buyer_nick` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `label` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '标签',
  `create_at` datetime DEFAULT NULL COMMENT '生成时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unshopid_nick_label` (`shop_id`,`buyer_nick`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客服工作台数据-标签' ;

 CREATE TABLE `workbench_meta` (
  `id` bigint(20) NOT NULL COMMENT '主题ID',
  `name` varchar(45) DEFAULT NULL COMMENT '主题名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服工作台主题配置' ;

CREATE TABLE `tds_qianniu_db_label` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `label_value` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签值',
  `update_time` datetime NOT NULL COMMENT '标签数据最后更新时间',
  `storage_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据入库更新时间',
  `shop_id` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unshopid_label` (`shop_id`,`label_value`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='千牛数据标签' ;


CREATE TABLE `qianniu_disposed_label` (
  `disposed_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '自增非业务主键',
  `workbench_label_entry_id` bigint(22) NOT NULL COMMENT '处理的千牛标签id',
  `query_item_id` bigint(22) NOT NULL COMMENT '对应映射到查询单元的queryItemId',
  `disposed_date` datetime NOT NULL COMMENT '处理的时间,就是定时扫描的时间',
  PRIMARY KEY (`disposed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `qianniu_disposed_property` (
  `disposed_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '自增非业务主键',
  `workbench_attr_entry_id` bigint(22) NOT NULL COMMENT '处理的千牛属性id',
  `query_item_id` bigint(22) NOT NULL COMMENT '对应映射到查询单元的queryItemId',
  `disposed_date` datetime NOT NULL COMMENT '处理的时间,就是定时扫描的时间',
  PRIMARY KEY (`disposed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

