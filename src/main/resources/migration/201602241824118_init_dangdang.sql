CREATE TABLE plt_dd_customer (
  customerno varchar(100) COMMENT '顾客当当网帐号的标志符',
  full_name varchar(20) COMMENT '收货人姓名',
  address varchar(255) COMMENT '收货地址',
  country varchar(50) COMMENT '收货国家',
  state varchar(50) COMMENT '收货省份',
  city varchar(50) COMMENT '收货市',
  district varchar(50) COMMENT '收货区',
  zip varchar(20) COMMENT '收货地址邮编',
  phone varchar(50) COMMENT '收货人固定电话',
  mobile varchar(20) COMMENT '收货人移动电话',
  job varchar(50) COMMENT '职业',
  changed datetime COMMENT '操作时间',
  last_sync datetime COMMENT '同步时间',
  fullname_most varchar(50) COMMENT '优化后的收货人的姓名',
  mobile_most varchar(20) COMMENT '优化后的收货人的手机号码',
  phone_most varchar(50) COMMENT '优化后的收货人的电话号码',
  country_most varchar(100) COMMENT '优化后的国家',
  state_most varchar(50) COMMENT '优化后的收货人的所在省份',
  city_most varchar(50) COMMENT '优化后的收货人的所在城市',
  district_most varchar(100) COMMENT '优化后的收货人的所在地区',
  address_most varchar(255) COMMENT '优化后的收货人的详细地址',
  last_sync_most datetime COMMENT '优化后的入库时间',
  PRIMARY KEY (customerno)
) COMMENT='当当顾客';

CREATE TABLE plt_dd_order (
  dp_id varchar(50) COMMENT '店铺ID',
  order_id varchar(50) COMMENT '订单编号',
  order_state int(11) COMMENT '订单状态',
  is_courier_receipt_detail tinyint COMMENT '是否已打单',
  message varchar(1000) COMMENT '留言',
  remark varchar(1000) COMMENT '备注',
  label int(11) COMMENT '标记',
  modified datetime COMMENT '最后修改时间',
  payment_date datetime COMMENT '付款时间',
  order_mode int(11) COMMENT '订单类型',
  send_date datetime COMMENT '发货日期',
  is_presale tinyint COMMENT '是否为预售期',
  buyer_pay_mode varchar(20) COMMENT '买家付款方式',
  goods_money decimal(12) COMMENT '买家支付货款',
  real_paid_amount decimal(12) COMMENT '买家已支付金额',
  deduct_amount decimal(12) COMMENT '网银支付满额减优惠金额',
  promo_deduct_amount decimal(12) COMMENT '促销优惠金额',
  total_bargin_price decimal(12) COMMENT '顾客需为订单支付现金',
  postage decimal(12) COMMENT '买家支付邮费',
  gift_cert_money decimal(12) COMMENT '买家支付礼券金额',
  gift_card_money decimal(12) COMMENT '买家支付礼品卡金额',
  account_balance decimal(12) COMMENT '买家支付账户余额',
  customerno varchar(100) COMMENT '顾客当当网帐号的标志符',
  consignee_name varchar(20) COMMENT '收货人姓名',
  consignee_addr varchar(255) COMMENT '收货地址',
  consignee_addr__state varchar(50) COMMENT '收货国家',
  consignee_addr__province varchar(50) COMMENT '收货省份',
  consignee_addr__city varchar(50) COMMENT '收货市',
  consignee_addr__area varchar(50) COMMENT '收货区',
  consignee_postcode varchar(20) COMMENT '收货地址邮编',
  consignee_tel varchar(50) COMMENT '收货人固定电话',
  consignee_mobile_tel varchar(20) COMMENT '收货人移动电话',
  send_goods_mode varchar(100) COMMENT '送货方式',
  send_company varchar(100) COMMENT '物流公司',
  send_order_id varchar(50) COMMENT '送货单编号',
  dangdang_warehouse_addr varchar(255) COMMENT '把包裹发到当当仓库地址',
  total_count int(11) COMMENT '数量',
  receipt_name varchar(100) COMMENT '发票抬头',
  receipt_details varchar(255) COMMENT '发票内容',
  receipt_money decimal(12) COMMENT '发票金额',
  is__dangdang_receipt tinyint COMMENT '是否由当当代开发票',
  energy_subsidy varchar(500) COMMENT '节能补贴信息',
  individual_or_company varchar(20) COMMENT '购买方式',
  name varchar(100) COMMENT '购买姓名',
  code varchar(50) COMMENT '购买代码',
  bank varchar(50) COMMENT '开户行',
  banking_account varchar(50) COMMENT '银行账号',
  PRIMARY KEY (order_id)
) COMMENT='当当订单';

CREATE TABLE plt_dd_order_item (
  order_id varchar(50) COMMENT '订单编号',
  order_item_id varchar(50) COMMENT '子订单编号',
  order_state int(11) COMMENT '订单状态',
  total_fee decimal(12) COMMENT '支付总额',
  payment decimal(12) COMMENT '商品金额',
  modified datetime COMMENT '最后修改时间',
  payment_date datetime COMMENT '付款时间',
  send_date datetime COMMENT '发货日期',
  created datetime COMMENT '操作时间',
  customerno varchar(100) COMMENT '顾客当当网帐号的标志符',
  item_id varchar(50) COMMENT '商品标识符',
  outer_item_id varchar(50) COMMENT '企业商品标志符',
  item_name varchar(100) COMMENT '商品名称',
  item_type int(11) COMMENT '商品类型',
  special_attribute varchar(100) COMMENT '分色分码',
  market_price decimal(12) COMMENT '市场价',
  is_energy_subsidy tinyint COMMENT '是否节能补贴商品',
  subsidy_price decimal(12) COMMENT '节能补贴金额',
  unit_price decimal(12) COMMENT '成交价',
  order_count int(11) COMMENT '订购数量',
  send_goods_count int(11) COMMENT '发货数量',
  belong_products_promo_id varchar(30) COMMENT '所属商品集合促销编号',
  product_item_id varchar(30) COMMENT '商品明细编号',
  PRIMARY KEY (order_item_id)
) COMMENT='当当子订单';

CREATE TABLE plt_dd_product (
  item_id varchar(50) COMMENT '商品标识符',
  outer_item_id varchar(50) COMMENT '企业商品标志符',
  item_name varchar(100) COMMENT '商品名称',
  item_type int(11) COMMENT '商品类型',
  special_attribute varchar(200) COMMENT '分色分码',
  market_price decimal(12) COMMENT '市场价',
  is_energy_subsidy tinyint COMMENT '是否节能补贴商品',
  subsidy_price decimal(12) COMMENT '节能补贴金额',
  unit_price decimal(12) COMMENT '成交价',
  belong_products_promo_id varchar(20) COMMENT '所属商品集合促销编号',
  product_item_id varchar(20) COMMENT '商品明细编号',
  item_state varchar(20) COMMENT '商品状态',
  created datetime COMMENT '操作时间',
  modified datetime COMMENT '最后修改时间',
  last_sync datetime COMMENT '最后同步时间',
  PRIMARY KEY (item_id)
) COMMENT='当当商品';

CREATE TABLE plt_dd_promotion (
  order_id varchar(50) COMMENT '订单编号',
  promotion_id varchar(20) COMMENT '促销编号',
  promotion_name varchar(50) COMMENT '促销名称',
  promotion_type varchar(50) COMMENT '促销类型',
  promo_dicount decimal(12) COMMENT '单个促销的优惠金额',
  promo_amount int(11) COMMENT '促销在订单中的订购数量',
  PRIMARY KEY (promotion_id)
) COMMENT='当当促销';

CREATE TABLE plt_dd_shop (
  shop_id varchar(20) COMMENT '店铺ID',
  shop_name varchar(50) COMMENT '店铺名称',
  order_created_earliest datetime COMMENT '最早创建订单时间',
  order_created_latest datetime COMMENT '最晚创建订单时间',
  PRIMARY KEY (shop_id)
) COMMENT='当当店铺';

CREATE TABLE plt_dd_shop_customer (
  shop_id varchar(50) COMMENT '店铺ID',
  customerno varchar(50) COMMENT '顾客ID',
  PRIMARY KEY (shop_id,customerno)
) COMMENT='当当店铺顾客关系';

ALTER TABLE plt_dd_order
  MODIFY COLUMN `consignee_name` VARCHAR(50) DEFAULT NULL COMMENT '收货人姓名',
  MODIFY COLUMN `consignee_mobile_tel` VARCHAR(50) DEFAULT NULL COMMENT '收货人移动电话';


ALTER TABLE plt_dd_customer
  MODIFY COLUMN `full_name` VARCHAR(50) DEFAULT NULL COMMENT '收货人姓名',
  MODIFY COLUMN `country` VARCHAR(100) DEFAULT NULL COMMENT '收货国家',
  MODIFY COLUMN `district` VARCHAR(100) DEFAULT NULL COMMENT '收货区';

ALTER TABLE plt_dd_product
  MODIFY COLUMN `item_name` VARCHAR(255) DEFAULT NULL COMMENT '商品名称';

ALTER TABLE plt_dd_order_item ADD COLUMN dp_id VARCHAR(50) DEFAULT NULL COMMENT '店铺ID' AFTER order_item_id;

ALTER TABLE plt_dd_product ADD COLUMN dp_id VARCHAR(50) DEFAULT NULL COMMENT '店铺ID' AFTER item_id;

ALTER TABLE plt_dd_promotion ADD COLUMN dp_id VARCHAR(50) DEFAULT NULL COMMENT '店铺ID' AFTER order_id;

drop table if EXISTS plt_dd_product_sku;
ALTER  TABLE  plt_dd_product  RENAME TO  plt_dd_product_sku;
ALTER TABLE plt_dd_product_sku DROP created;
ALTER TABLE plt_dd_product_sku DROP item_state;
ALTER TABLE plt_dd_product_sku DROP unit_price;
ALTER TABLE plt_dd_product_sku CHANGE item_id sku_id varchar(50);

alter table plt_dd_order add column created datetime DEFAULT NULL comment '下单时间' after order_state;
alter table plt_dd_order add column order_insert datetime DEFAULT NULL comment 'etl订单数据插入新时间' ;

alter table plt_dd_order add column order_update datetime DEFAULT NULL comment 'etl订单数据更新新时间' ;


CREATE INDEX idx_customerno  ON plt_dd_order(customerno);

CREATE INDEX idx_payment_date  ON plt_dd_order(payment_date);


alter table plt_dd_order_item   modify column   item_name varchar(200);

alter table plt_dd_order_item   modify column   item_name varchar(300);
alter table plt_dd_order_item drop column total_fee;
alter table plt_dd_order_item drop column payment;









