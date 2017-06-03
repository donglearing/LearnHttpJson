CREATE TABLE IF NOT EXISTS `import_batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '批次ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次名称',
  `platform` int(11) DEFAULT NULL COMMENT '平台ID',
  `filename` varchar(100) DEFAULT NULL COMMENT '上传的文件存储地址',
  `table_name` varchar(100) DEFAULT NULL COMMENT '存放结果的表名',
  `delimiter` int(11) DEFAULT NULL COMMENT '分隔符',
  `has_column_name` varchar(50) DEFAULT NULL COMMENT '上传的文件中是否包含字段名',
  `verify` int(11) DEFAULT NULL COMMENT '校验类型',
  `total_num` int(11) DEFAULT NULL COMMENT '上传的中记录数量',
  `distinct_num` int(11) DEFAULT NULL COMMENT '排重后数量',
  `import_num` int(11) DEFAULT NULL COMMENT '导入的数量',
  `import_time` datetime DEFAULT NULL COMMENT '导入的时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `disabled` int(11) DEFAULT NULL COMMENT '是否可用',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8 COMMENT='外部数据导入批次表';

-- ----------------------------
-- Records of import_batch
-- ----------------------------

-- ----------------------------
-- Table structure for import_batch_column
-- ----------------------------
CREATE TABLE IF NOT EXISTS `import_batch_column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) DEFAULT NULL COMMENT '批次id',
  `column_id` bigint(20) DEFAULT NULL COMMENT '元字段id',
  `order` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据导入字段匹配配置';

-- ----------------------------
-- Records of import_batch_column
-- ----------------------------

-- ----------------------------
-- Table structure for import_meta_column
-- ----------------------------
CREATE TABLE IF NOT EXISTS `import_meta_column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL COMMENT '主题id',
  `name` varchar(50) DEFAULT NULL COMMENT '字段名字',
  `tips` varchar(50) DEFAULT NULL COMMENT '字段提示语',
  `db_name` varchar(50) DEFAULT NULL COMMENT '在数据库中的字段名字',
  `db_type` varchar(50) DEFAULT NULL COMMENT '在数据库中的字段类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='外部数据导入字段匹配元数据配置';

-- ----------------------------
-- Records of import_meta_column
-- ----------------------------
INSERT IGNORE INTO `import_meta_column` VALUES ('1', '1', '客户ID', '请保证客户ID不重复，如果有重复系统只保留第一条记录', 'customerno', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('2', '1', '姓名', null, 'full_name', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('3', '1', '性别', '要求是\"男\"或\"女\"', 'sex', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('4', '1', '职业', null, 'job', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('5', '1', '年龄', '要求是1-200的整数', 'birth_year', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('6', '1', '生日', '要求格式：YYYY-MM-DD，如1988-08-21/1988-8-21', 'birthday', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('7', '1', '手机号', null, 'mobile', 'varchar(50)');
INSERT IGNORE INTO `import_meta_column` VALUES ('8', '1', '邮箱', null, 'email', 'varchar(100)');

-- ----------------------------
-- Table structure for import_meta_subject
-- ----------------------------
CREATE TABLE IF NOT EXISTS `import_meta_subject` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部数据导入主题配置表';

-- ----------------------------
-- Records of import_meta_subject
-- ----------------------------
INSERT IGNORE INTO `import_meta_subject` VALUES ('1', '淘宝客户');

-- ----------------------------
-- Table structure for import_state
-- ----------------------------
CREATE TABLE IF NOT EXISTS `import_state` (
  `id` int(11) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据导入进度保存';

-- ----------------------------
-- Records of import_state
-- ----------------------------
INSERT IGNORE INTO `import_state` VALUES ('1', '0', null);

-- ----------------------------
-- Table structure for import_verify_type
-- ----------------------------
CREATE TABLE IF NOT EXISTS `import_verify_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据校验方式';

-- ----------------------------
-- Records of import_verify_type
-- ----------------------------
INSERT IGNORE INTO `import_verify_type` VALUES ('1', '系统已有客户校验（只允许导入系统内已有的客户ID）', '0');
INSERT IGNORE INTO `import_verify_type` VALUES ('2', '淘宝昵称合法性校验（只允许导入合法淘宝昵称的客户ID）', '0');
INSERT IGNORE INTO `import_verify_type` VALUES ('3', '不校验（所有客户ID均可导入）', '1');

-- ----------------------------
-- Table structure for plt_ext_batch_customer
-- ----------------------------
CREATE TABLE IF NOT EXISTS `plt_ext_batch_customer` (
  `batch_id` int(11) NOT NULL COMMENT '导入批次ID',
  `plat_code` char(8) COLLATE utf8_bin NOT NULL COMMENT '平台代码',
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户所属平台的客户ID',
  PRIMARY KEY (`batch_id`,`plat_code`,`customerno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of plt_ext_batch_customer
-- ----------------------------

-- ----------------------------
-- Table structure for plt_ext_customer
-- ----------------------------
CREATE TABLE IF NOT EXISTS `plt_ext_customer` (
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '外部客户ID。导入非接驳平台客户时无需指定客户ID，因此本字段由统一用户ID生成规则生成，逻辑关联 uni_customer.uni_id',
  `full_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `job` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '职业',
  `birth_year` smallint(6) DEFAULT NULL COMMENT '出生年份',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '座机号码',
  `zip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `country` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '国家',
  `state` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '城市（地级）',
  `district` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区县（县级）',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `changed` datetime DEFAULT NULL COMMENT '客户属性变更时间（仅限统一客户信息表uni_customer中包含的属性）',
  PRIMARY KEY (`customerno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='外部导入客户信息（非接驳平台）';

-- ----------------------------
-- Records of plt_ext_customer
-- ----------------------------

-- ----------------------------
-- Table structure for plt_ext_import_batch
-- ----------------------------
CREATE TABLE IF NOT EXISTS `plt_ext_import_batch` (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '导入批次名称',
  `plat_code` char(8) COLLATE utf8_bin NOT NULL COMMENT '导入客户所属平台的平台代码，与uni_plat.plat_code关联',
  `file_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `start_line` int(11) DEFAULT NULL COMMENT '起始行',
  `internal_file_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '对应内部文件名',
  `has_column_name` tinyint(1) DEFAULT NULL,
  `split_char` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分隔符',
  `import_table_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '导入数据的表名',
  `success_record` int(11) DEFAULT NULL COMMENT '成功记录数',
  `total_record` int(11) DEFAULT NULL COMMENT '总记录数',
  `has_clear` tinyint(1) DEFAULT NULL,
  `has_imported` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `cleared` datetime DEFAULT NULL COMMENT '清除时间',
  `creator` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '批次创建人的系统用户名，与tb_sysuser.username关联',
  `cleaner` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '批次清除人的系统用户名，与tb_sysuser.username关联',
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='外部导入客户批次信息表';

-- ----------------------------
-- Records of plt_ext_import_batch
-- ----------------------------

-- ----------------------------
-- Table structure for plt_extaobao_customer
-- ----------------------------
CREATE TABLE IF NOT EXISTS `plt_extaobao_customer` (
  `customerno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `full_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `job` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '职业',
  `birth_year` smallint(6) DEFAULT NULL COMMENT '出生年份',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '座机号码',
  `zip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `country` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '国家',
  `state` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '城市（地级）',
  `district` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区县（县级）',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `changed` datetime DEFAULT NULL COMMENT '客户属性变更时间（仅限统一客户信息表uni_customer中包含的属性）',
  PRIMARY KEY (`customerno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='外部导入客户信息（来源于“淘宝”平台）';



-- 更新主题id为string
alter table import_batch MODIFY column platform varchar(50) DEFAULT NULL COMMENT '平台id,也及是主题id';
alter table import_meta_column MODIFY column subject_id varchar(50) DEFAULT NULL COMMENT '主题id';
alter table import_meta_subject MODIFY column id varchar(50) DEFAULT NULL COMMENT '主题id';

-- 更新数据
update import_meta_column set subject_id='淘宝客户' where id in(1,2,3,4,5,6,7,8);
update import_meta_subject set id='淘宝客户' where id='1';







