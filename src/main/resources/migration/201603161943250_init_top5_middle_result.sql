CREATE TABLE `top5_middle_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `camp_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `create_time` datetime DEFAULT NULL COMMENT '统计时间时间',
  `return_num` bigint(20) DEFAULT NULL COMMENT '统计成功营销人数',
  `return_price` bigint(20) DEFAULT NULL COMMENT '统计成功营销人数总销售额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='统计top中间表纪录天级别活动销售额和成功销售额'