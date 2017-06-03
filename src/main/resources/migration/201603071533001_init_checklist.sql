--// Create workflow_log_channel

CREATE TABLE `checklist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `subject_id` varchar(50) NOT NULL COMMENT '主题ID',
  `customerno` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户id',
  `group_id` int(6) NOT NULL COMMENT '红名单分组id',
  `entry_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '录入方式',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  `last_operator` bigint(20) NOT NULL COMMENT '最后修改人',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_type_subject_customer` (`type`,`subject_id`,`customerno`),
  KEY `customer_index` (`customerno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `checklist_group` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `reserved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 插入初始化分组
INSERT INTO checklist_group VALUES (1003,'MOBILE','退订组',1);
INSERT INTO checklist_group VALUES (1004,'EMAIL','退订组',1);
INSERT INTO checklist_group VALUES (1005,'MOBILE','地址错误',1);
INSERT INTO checklist_group VALUES (1006,'EMAIL','邮件退回',1);

CREATE TABLE `checklist_download` (
  `id` varchar(50) NOT NULL COMMENT '记录id,ObjectId',
  `type` varchar(20) COLLATE utf8_bin NOT NULL,
  `file_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文件id',
  `file_name` varchar(255) NOT NULL COMMENT '文件名字',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '文件生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;