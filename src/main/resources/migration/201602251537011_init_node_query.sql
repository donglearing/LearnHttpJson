--// Create Changelog

-- Default DDL for changelog table that will keep
-- a record of the migrations that have been run.

-- You can modify this to suit your database before
-- running your first migration.

-- Be sure that ID and DESCRIPTION fields exist in
-- BigInteger and String compatible fields respectively.

CREATE TABLE `node_query_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `query_node_id` bigint(20) NOT NULL COMMENT '查询节点ID',
  `snap_shot_id` bigint(20) NOT NULL COMMENT '条件快照ID',
  `product_id` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=441427 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询节点商品选择器商品条件' ;

CREATE TABLE `node_query_product_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `query_node_id` bigint(20) NOT NULL COMMENT '查询节点ID',
  `snap_shot_id` bigint(20) NOT NULL COMMENT '条件快照ID',
  `sku_id` varchar(20) COLLATE utf8_bin NOT NULL COMMENT 'skuID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询节点商品选择器SKU条件';


CREATE TABLE `tempdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据类型',
  `source` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据来源',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据名称',
  `detail` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据详情',
  `usages` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据用途',
  `status` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据当前状态',
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`source`,`name`),
  KEY `idx_tempdata_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=427724 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `node_query_camp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `query_node_id` bigint(20) NOT NULL COMMENT '查询节点ID',
  `snap_shot_id` bigint(20) NOT NULL COMMENT '条件快照ID',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9451 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询节点活动选择器流程条件';

CREATE TABLE `node_query_group_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `query_node_id` bigint(20) NOT NULL COMMENT '查询节点ID',
  `snap_shot_id` bigint(20) NOT NULL COMMENT '条件快照ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询节点活动选择器节点条件';

CREATE TABLE `tempdata_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据类型',
  `source` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据来源',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据名称',
  `detail` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '临时数据详情',
  `action` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '对临时数据执行的动作',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '动作发生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452863 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;