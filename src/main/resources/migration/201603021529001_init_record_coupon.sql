--// Create node_channel_execution_record

CREATE TABLE `node_channel_execution_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) NOT NULL COMMENT '节点ID',
  `subjob_id` bigint(20) NOT NULL,
  `target_group_customers` bigint(20) DEFAULT NULL COMMENT '目标组用户数',
  `control_group_customers` bigint(20) DEFAULT NULL COMMENT '控制组用户数',
  `valid_send_amount` bigint(20) DEFAULT NULL COMMENT '有效发送数',
  `invalid_send_amount` bigint(20) DEFAULT NULL COMMENT '无效发送数',
  `sending_total_num` bigint(20) DEFAULT NULL COMMENT '发送条数',
  `sending_price` decimal(15,3) DEFAULT NULL COMMENT '发送单价',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `node_type` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '节点类型',
  PRIMARY KEY (`id`),
  KEY `idx_node_id` (`node_id`),
  KEY `idx_subjob_id` (`subjob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12353 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='渠道发送节点执行后生成数据';