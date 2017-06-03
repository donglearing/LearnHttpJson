--// Create Changelog

-- Default DDL for changelog table that will keep
-- a record of the migrations that have been run.

-- You can modify this to suit your database before
-- running your first migration.

-- Be sure that ID and DESCRIPTION fields exist in
-- BigInteger and String compatible fields respectively.

CREATE TABLE `config` (
  `prop_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数ID,仅作主键,不应该被其他表应用',
  `prop_group` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '参数所属组别,取值：FTP、MQ、CHANNEL、CCMS',
  `prop_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '配置参数名',
  `prop_value` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '配置值',
  `prop_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`prop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000009 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='应用级属性参数配置表';

INSERT ignore INTO config (prop_group,prop_name,prop_value,prop_desc) VALUES('CCMS','customer_most_used_high_priority','0','plt_taobao_customer中买家使用最多信息优先级标识：1(使用最多字段phone_most信息优先级高)0(淘宝字段phone优先级高)');


