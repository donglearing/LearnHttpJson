--// Create workflow_log_channel
CREATE TABLE `metas_node_impquery_config_subject` (
  `config_subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_id` bigint(20) NOT NULL COMMENT '导入查询节点配置ID',
  `subject_id` VARCHAR(50) NOT NULL COMMENT '主题ID',
  PRIMARY KEY (`config_subject_id`),
  KEY `idx_config_id` (`config_id`) USING BTREE,
  KEY `idx_subject_id` (`subject_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通用化配置-查询节点节点配置-主题配置表';

INSERT INTO metas_node_impquery_config_subject
(config_subject_id, config_id, subject_id)
VALUES(1, 1, '淘宝客户');


CREATE TABLE `node_impquery` (
  `id` bigint(20) NOT NULL COMMENT '节点ID',
  `subject_id` VARCHAR(50) DEFAULT NULL COMMENT '主题ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='导入查询节点';

CREATE TABLE `node_impquery_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) NOT NULL COMMENT '节点ID',
  `impbatch_id` bigint(20) DEFAULT NULL COMMENT '导入批次ID',
  `batch_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '批次名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='导入查询关联明细';

