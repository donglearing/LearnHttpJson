-- ----------------------------
-- Table structure for `loyalty_cartyid_dic`
-- ----------------------------
create table loyalty_memberAndpoint_customer(
cty_id bigint(20) NOT NULL COMMENT '卡类型ID',
card_id bigint(20) NOT NULL COMMENT '卡ID',
plat_code bigint(20) NOT NULL COMMENT '平台code',
customerno varchar(255) NOT NULL COMMENT '客户账号',
point_type_id bigint(20) NOT NULL COMMENT '积分类型id',
point_all bigint(20) NOT NULL COMMENT '总积分',
priority bigint(20) NOT NULL COMMENT '会员优先级',
grade_start_time date DEFAULT NULL COMMENT '会员等级生效时间',
grade_end_time date DEFAULT NULL COMMENT '会员等级失效时间',
birthday date DEFAULT NULL COMMENT '客户生日',
mobile varchar(128) DEFAULT NULL COMMENT '用户手机号',
email varchar(100) DEFAULT NULL COMMENT '用户email',
is_subscribe_email int NOT NULL COMMENT '1是，0否',
update_at date  DEFAULT NULL COMMENT '更新时间',
create_at date DEFAULT NULL COMMENT '生成时间',
UNIQUE KEY index_member_cty_type (cty_id, card_id,point_type_id)
)COMMENT='客户积分和等级信息';

-- 积分明细
create table loyalty_detailed_point(
detail_id bigint(20) NOT NULL ,
cty_id bigint(20) NOT NULL COMMENT '卡类型ID',
card_id bigint(20) NOT NULL COMMENT '卡ID',
point_type_id bigint(20) NOT NULL COMMENT '积分类型id',
point bigint(20) NOT NULL COMMENT '积分',
point_start_time date DEFAULT NULL COMMENT '积分生效时间',
point_end_time date DEFAULT NULL COMMENT '积分失效时间',
create_at date DEFAULT NULL COMMENT '生成时间',
update_at date  DEFAULT NULL COMMENT '更新时间',
UNIQUE KEY index_detail_id (detail_id)
)COMMENT='客户积分明细';