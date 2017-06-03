--// create report detail list
-- Migration SQL that makes the change goes here.

-- 优惠券下载详情数据表
CREATE TABLE report_detail_list_coupon (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  campaign_id bigint(20) NOT NULL COMMENT '活动ID',
  node_id bigint(20) NOT NULL COMMENT '节点ID',
  job_id bigint(20) NOT NULL COMMENT 'jobId',
  customer_name varchar(255) NOT NULL COMMENT '淘宝昵称',
  sender_status varchar(20) COMMENT '发送状态',
  fail_reason varchar(50) COMMENT '失败原因',
  updated datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='优惠券下载详情数据表';


