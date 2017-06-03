
CREATE TABLE `node_analysis_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `subjob_id` varchar(25) NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  `file_type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '文件类型，区分分析节点不同业务文件信息',
  `authority_code` varchar(100) COLLATE utf8_bin DEFAULT '0' COMMENT '权限编号,0表示无权限控制',
  `file_id` varchar(100) NOT NULL COMMENT '文件编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通用化配置-分析下载信息-文件信息表';

CREATE TABLE `node_analysis_order_result` (
  `result_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `display_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '显示名称',
  `attribute_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '属性KEY',
  PRIMARY KEY (`result_id`),
  KEY `idx_node_id_job_id` (`node_id`,`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单分析节点-结果展示-Tab模块';

CREATE TABLE `node_analysis_order_result_info` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `result_id` bigint(20) NOT NULL,
  PRIMARY KEY (`info_id`),
  KEY `idx_result_id` (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单分析节点-结果展示-Tab模块详细信息';

CREATE TABLE `node_analysis_order_result_info_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `info_id` bigint(20) NOT NULL,
  `attribute_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '属性KEY',
  `display_value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分析内容值',
  PRIMARY KEY (`id`),
  KEY `idx_info_id` (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单分析节点-结果展示-Tab模块详细信息数据值';

CREATE TABLE `node_analysis_order_result_th` (
  `th_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `result_id` bigint(20) NOT NULL COMMENT '结果展示Tab模块ID',
  `display_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '显示名称',
  `attribute_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '属性KEY',
  `display_order_id` bigint(20) DEFAULT NULL COMMENT '展示排序',
  PRIMARY KEY (`th_id`),
  KEY `idx_result_id` (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单分析节点-结果展示-Tab模块上层标签<th>';
