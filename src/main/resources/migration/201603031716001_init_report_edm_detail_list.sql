--// Create node_channel_execution_record

-- ----------------------------
-- Table structure for `report_detail_list_edm`
-- ----------------------------
CREATE TABLE `report_detail_list_edm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) NOT NULL COMMENT '活动ID',
  `node_id` bigint(20) NOT NULL COMMENT '节点ID',
  `job_id` bigint(20) NOT NULL COMMENT 'jobId',
  `email` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '邮件地址',
  `sender_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '发送类型',
  `click_address` text COLLATE utf8_bin COMMENT '点击地址',
  `updated` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_node_job_email` (`node_id`,`job_id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='EDM下载详情数据表';