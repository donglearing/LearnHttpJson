-- ----------------------------
-- Table structure for `all_plt_tables`
-- ----------------------------
-- plt_taobao_wireless_behavior_log
alter table plt_taobao_wireless_behavior_log modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户名称';

-- plt_taobao_traderate
alter table plt_taobao_traderate modify nick varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评价者昵称';

-- plt_taobao_shop_customer
alter table plt_taobao_shop_customer modify customerno varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '';

-- plt_taobao_shipping
alter table plt_taobao_shipping
modify buyer_nick varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
modify receiver_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收件人姓名',
modify receiver_mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收件人手机号码';

-- plt_taobao_refund
alter table plt_taobao_refund modify  buyer_nick varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称';

-- plt_taobao_pc_behavior_log
alter table plt_taobao_pc_behavior_log modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户名称';

-- plt_taobao_order_rfm
alter table plt_taobao_order_rfm modify buyer_nick varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户';

-- plt_taobao_order_item_channel
alter table plt_taobao_order_item_channel modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID';

-- plt_taobao_order_item
alter table plt_taobao_order_item modify customerno  varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID';

-- plt_taobao_order_channel
alter table plt_taobao_order_channel
modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
modify receiver_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
modify receiver_mobile varchar(128) DEFAULT NULL COMMENT '收货人的手机号码';

-- plt_taobao_order
alter table plt_taobao_order
modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
modify receiver_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
modify receiver_mobile varchar(128) DEFAULT NULL COMMENT '收货人的手机号码';

-- plt_taobao_customer
alter table plt_taobao_customer
modify column customerno varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户id，CCMS系统用户ID,淘宝UID(number)',
modify column full_name  varchar(255) DEFAULT NULL COMMENT '客户姓名',
modify column mobile  varchar(128) DEFAULT NULL COMMENT '用户手机号',
modify column fullname_most  varchar(255) DEFAULT NULL COMMENT '买家最常用收货姓名',
modify column mobile_most varchar(128) DEFAULT NULL COMMENT '买家使用最多手机号',
modify column mobile_modified   varchar(128) DEFAULT NULL COMMENT '买家手动更新手机号',
modify column fullname_modified varchar(255) DEFAULT NULL COMMENT '买家动更新收货姓名';

-- plt_taobao_crm_member
alter table plt_taobao_crm_member modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '买家昵称';

-- plt_taobao_collect_shop_behavior
alter table plt_taobao_collect_shop_behavior modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户名称';

-- plt_taobao_collect_product_behavior
alter table plt_taobao_collect_product_behavior modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户名称';

-- plt_taobao_chatpeer
alter table plt_taobao_chatpeer modify buyer_nick varchar(255) COLLATE utf8_bin NOT NULL COMMENT '访客ID对应的淘宝昵称';

-- plt_taobao_chat_log
alter table plt_taobao_chat_log modify buyer_nick varchar(255) COLLATE utf8_bin NOT NULL COMMENT '访客ID对应的淘宝昵称';

-- plt_extaobao_customer
alter table plt_extaobao_customer
modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
modify full_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码';

-- plt_taobao_acookie_visitorid
alter table plt_taobao_acookie_visitorid modify buyer_nick varchar(255) COLLATE utf8_bin NOT NULL COMMENT '访客ID对应的淘宝昵称';

-- plt_ext_customer
alter table plt_ext_customer
modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '外部客户ID。导入非接驳平台客户时无需指定客户ID，因此本字段由统一用户ID生成规则生成，逻辑关联 uni_customer.uni_id',
modify full_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码';

-- plt_ext_batch_customer
alter table plt_ext_batch_customer modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户所属平台的客户ID';

-- plt_suning_shop_customer
-- alter table plt_suning_shop_customer modify customerno varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '买家账号';

-- plt_suning_order_item
-- alter table plt_suning_order_item modify customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '买家帐号';

-- plt_suning_order
-- alter table plt_suning_order modify  customerno varchar(255) COLLATE utf8_bin NOT NULL COMMENT '买家帐号';

-- plt_suning_customer
-- alter table plt_suning_customer
-- modify customerno varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '买家帐号',
-- modify customer_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '顾客姓名',
-- modify customer_name_modify varchar(255)  COLLATE utf8_bin DEFAULT NULL COMMENT '顾客姓名修改',
-- modify customer_phone varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '买家联系电话',
-- modify customer_phone_modify  varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '买家联系电话修改',
-- modify invoice_recipient_hand_phone  varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人手机',
-- modify invoice_recipient_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名';

-- plt_jd_shop_customer
alter table plt_jd_shop_customer modify pin varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '买家账号';

-- plt_jd_order_item
alter table plt_jd_order_item modify pin varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家账号';

-- plt_jd_order
alter table plt_jd_order
modify pin varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家账号',
modify fullname varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '手机';

-- plt_jd_refund
alter table plt_jd_refund modify buyer_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名';

-- plt_jd_customer
alter table plt_jd_customer
modify pin varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '买家账号',
modify full_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '手机';

-- plt_dd_shop_customer
alter table plt_dd_shop_customer modify customerno varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '顾客ID';

-- plt_dd_order_item
alter table plt_dd_order_item modify customerno varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '顾客当当网帐号的标志符';

-- plt_dd_order
alter table plt_dd_order
modify customerno varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '顾客当当网帐号的标志符',
modify consignee_mobile_tel varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人移动电话',
modify consignee_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名';

-- plt_dd_customer
alter table plt_dd_customer
modify customerno  varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '顾客当当网帐号的标志符',
modify full_name  varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人移动电话',
modify fullname_most varchar(255)  COLLATE utf8_bin DEFAULT NULL COMMENT '优化后的收货人的姓名',
modify mobile_most varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '优化后的收货人的手机号码';

-- plt_yhd_shop_customer
alter table plt_yhd_shop_customer modify  customerno varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '';

-- plt_yhd_order_item
alter table plt_yhd_order_item modify customerno varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称';

-- plt_yhd_order
alter table plt_yhd_order
modify customerno varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
modify receiver_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
modify receiver_mobile  varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的手机号码';

-- plt_yhd_customer
alter table plt_yhd_customer
modify customerno varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '买家昵称',
modify full_name varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的手机号码',
modify fullname_most varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的姓名',
modify mobile_most varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人的手机号码';

-- loyalty_memberandpoint_customer
alter table loyalty_memberandpoint_customer
modify customerno  varchar(255) COLLATE utf8_bin NOT NULL COMMENT '客户账号',
modify mobile varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '用户手机号';

-- report_detail_list_coupon --还没写完 明天继续
alter table report_detail_list_coupon modify  customer_name varchar(255) COLLATE utf8_bin NOT NULL COMMENT '淘宝昵称';

-- workflow_log_channel_user
alter table workflow_log_channel_user modify uid varchar(255) COLLATE utf8_bin NOT NULL COMMENT '统一客户ID（当前主题流转主属性）';

-- ----------------------------
-- Table structure for `all_plt_tables`
-- ----------------------------
-- workflow_log_channel_user
ALTER TABLE workflow_log_channel_user DROP COLUMN info;


