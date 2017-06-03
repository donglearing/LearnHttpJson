
create table plt_yhd_order(
dp_id   varchar(50) COMMENT   '店铺id ',
tid   varchar(50) COMMENT   '交易编号',
status   varchar(50) COMMENT   '交易状态',
discount_fee   decimal(12,2)  COMMENT   '满立减金额',
total_fee   decimal(12,2) COMMENT   '商品金额',
created   datetime COMMENT   '交易创建时间',
pay_time   datetime COMMENT   '付款时间',
modified   datetime COMMENT   '交易修改时间',
endtime   datetime COMMENT   '交易结束时间',
seller_memo   varchar(1000) COMMENT   '卖家备注',
customerno   varchar(50) COMMENT   '买家昵称',
buyer_email   varchar(100) COMMENT   '买家邮件地址',
trade_from   varchar(50) COMMENT   '交易内部来源',
receiver_city   varchar(50) COMMENT   '收货人的所在城市',
receiver_district   varchar(50) COMMENT   '收货人的所在地区',
payment   decimal(12,2)  COMMENT   '实付金额',
post_fee   decimal(12,2) COMMENT   '邮费',
receiver_name   varchar(50) COMMENT   '收货人的姓名',
receiver_state   varchar(50) COMMENT   '收货人的所在省份',
receiver_address   varchar(255) COMMENT   '收货人的详细地址',
receiver_zip   varchar(10) COMMENT   '收货人的邮编',
receiver_mobile   varchar(20) COMMENT   '收货人的手机号码',
receiver_phone   varchar(50) COMMENT   '收货人的电话号码',
consign_time   datetime COMMENT   '卖家发货时间。格式:yyyy-MM-dd HH:mm:ss',
received_payment   decimal(12,2) COMMENT   '实收款',
timeout_action_time   datetime COMMENT   '超时到期时间',
num   int(11) COMMENT   '商品购买数量',
trade_insert   datetime COMMENT   '入库时间',
trade_update   datetime COMMENT   '更新时间'
);

create table plt_yhd_order_item(
dp_id   varchar(50) COMMENT   '店铺id',
tid   varchar(50) COMMENT   '交易编号',
created   datetime COMMENT   '交易创建时间',
endtime   datetime COMMENT   '交易结束时间',
trade_from   varchar(50) COMMENT   '交易内部来源',
pay_time   datetime COMMENT   '付款时间',
consign_time   datetime COMMENT   '卖家发货时间',
status   varchar(50) COMMENT   '交易状态',
oid   varchar(50)  COMMENT   '子订单编号(暂不提供)',
title   varchar(255) COMMENT   '商品标题',
price   decimal(12,2) COMMENT   '商品价格',
num_iid   varchar(50) COMMENT   '商品数字ID',
sku_id   varchar(50) COMMENT   '商品的最小库存单位Sku的id.',
num   int(11) COMMENT   '购买数量。取值范围:大于零的整数',
outer_sku_id   varchar(50) COMMENT   '外部网店自己定义的Sku编号',
order_from   varchar(50) COMMENT   '子订单来源',
total_fee   decimal(12,2) COMMENT   '应付金额',
payment   decimal(12,2) COMMENT   '子订单实付金额',
discount_fee   decimal(12,2) COMMENT   '子订单级订单优惠金额',
modified   datetime COMMENT   '订单修改时间',
pic_path   varchar(1000) COMMENT   '商品图片的绝对路径',
outer_iid   varchar(50) COMMENT   '商家外部编码',
timeout_action_time   datetime COMMENT   '订单超时到期时间',
order_insert   datetime COMMENT   '入库时间',
order_update   datetime COMMENT   '更新时间'
);

create table plt_yhd_product(
dp_id   varchar(50) COMMENT   ' 店铺id',
num_iid   varchar(50) COMMENT   '商品数字ID',
title   varchar(255) COMMENT   '商品标题',
created   datetime COMMENT   '第一次',
pic_url   varchar(255) COMMENT   '商品图片的绝对路径',
price   decimal(12,2) COMMENT   '商品价格。精确到2位小数;单位:元。如:200.07，表示:200元7分',
last_sync   datetime COMMENT   ' 数据最后同步时间'
);

CREATE TABLE plt_yhd_shop_customer (
  shop_id varchar(50),
  customerno varchar(50)
);

create table plt_yhd_customer(
   tomerno   varchar(50) COMMENT   '买家昵称',
   full_name   varchar(50) COMMENT   '收货人的姓名',
   zip   varchar(20) COMMENT   '收货人的邮编',
   address   varchar(255) COMMENT   '收货人的详细地址',
   city   varchar(50) COMMENT   '收货人的所在城市',
   state   varchar(50) COMMENT   '收货人的所在省份',
   country   varchar(100) COMMENT   '国家',
   district   varchar(100) COMMENT   '收货人的所在地区',
   created   datetime COMMENT   '交易创建时间。格式:yyyy-MM-dd HH:mm:ss',
  email   varchar(100) COMMENT   '买家邮件地址',
  mobile   varchar(20) COMMENT   '收货人的手机号码',
  phone   varchar(50) COMMENT   '收货人的电话号码',
  last_sync   datetime COMMENT   '入库时间',
  job   varchar(50) COMMENT   '工作',
  birth_year   smallint(6) COMMENT   '生日',
  changed   datetime COMMENT   '修改时间',
  fullname_most   varchar(50) COMMENT   '收货人的姓名',
  mobile_most   varchar(20) COMMENT   '收货人的手机号码',
  phone_most   varchar(50) COMMENT   '收货人的电话号码',
  country_most   varchar(100) COMMENT   '国家',
  state_most   varchar(50) COMMENT   '收货人的所在省份',
  city_most   varchar(50) COMMENT   '收货人的所在城市',
  district_most   varchar(100) COMMENT   '收货人的所在地区',
  address_most   varchar(255) COMMENT   '收货人的详细地址',
  last_sync_most   datetime COMMENT   '入库时间'
);

CREATE TABLE  plt_yhd_shop (
   shop_id varchar(20)  COMMENT '店铺ID',
  shop_name varchar(50) COMMENT '店铺名称',
  order_created_earliest datetime  COMMENT '最早的订单创建时间',
  order_created_latest datetime    COMMENT '最新的订单创建时间'
);


alter table plt_yhd_order_item add column customerno varchar(50) COMMENT '买家昵称';
alter table plt_yhd_customer change column tomerno customerno varchar(50) COMMENT '买家昵称';

ALTER table plt_yhd_shop  ADD PRIMARY KEY(shop_id);
ALTER table plt_yhd_customer  ADD PRIMARY KEY(customerno);
ALTER table plt_yhd_shop_customer  ADD PRIMARY KEY(shop_id,customerno);
ALTER table plt_yhd_product  ADD PRIMARY KEY(num_iid);
ALTER table plt_yhd_order_item  ADD PRIMARY KEY(oid);
ALTER table plt_yhd_order  ADD PRIMARY KEY(tid);
CREATE INDEX idx_customerno  ON plt_yhd_order(customerno);

CREATE INDEX idx_pay_time  ON plt_yhd_order(pay_time);



