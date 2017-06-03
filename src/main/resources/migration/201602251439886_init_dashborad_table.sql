CREATE TABLE dashboard_crm_kpi_base (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  created datetime DEFAULT NULL COMMENT '统计时间',
  shop_id varchar(300) COLLATE utf8_bin NOT NULL COMMENT '店铺id',
  total_fee decimal(12,2) DEFAULT NULL COMMENT '总费用',
  crm_fee decimal(12,2) DEFAULT NULL COMMENT 'crm营销带来的费用',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='crm kpi base table';


CREATE TABLE dashboard_campaign_kpi_summary (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  created datetime DEFAULT NULL COMMENT '统计时间',
  investment_number bigint(20) DEFAULT NULL COMMENT '营销人数',
  investment_total decimal(12,2) DEFAULT NULL COMMENT '营销成本金额',
  return_number bigint(20) DEFAULT NULL COMMENT '营销成功人数',
  return_total decimal(12,2) DEFAULT NULL COMMENT '营销收益',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='首頁營銷匯總基表';


CREATE TABLE dashboard_channel_send_base (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  created datetime NOT NULL COMMENT '统计时间',
  node_type varchar(100) COLLATE utf8_bin NOT NULL COMMENT '渠道节点类型',
  total_number bigint(20) DEFAULT NULL COMMENT '发送的数量',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='首页渠道发送统计日表';


CREATE TABLE dashboard_top_rank_base (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  camp_id bigint(20) NOT NULL COMMENT '活动id',
  camp_name varchar(255) COLLATE utf8_bin NOT NULL COMMENT '活动名称',
  created datetime DEFAULT NULL COMMENT '统计时间',
  investment_num int(11) DEFAULT '0' COMMENT '渠道投入发送的人数',
  investment_price double(12,2) DEFAULT '0' COMMENT '渠道投入发送的金额',
  return_num int(11) DEFAULT '0' COMMENT '渠道回报购买的人数',
  return_price double(12,2) DEFAULT '0' COMMENT '渠道回报购买的金额',
  success_rate double(12,2) DEFAULT NULL COMMENT '营销成功率(return_num/investment_num)',
  roi double(12,2) DEFAULT NULL COMMENT '投资回报比(return_price/investment_price)',
  PRIMARY KEY (id),
  KEY idx_created (created)
) ENGINE=InnoDB AUTO_INCREMENT=9602 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='top rank base table';


