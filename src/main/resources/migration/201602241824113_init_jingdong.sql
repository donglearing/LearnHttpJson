-- //none create plt jd tables
-- Migration SQL that makes the change goes here.

CREATE TABLE plt_jd_customer (
  pin varchar(50) COMMENT '买家账号',
  email varchar(50) COMMENT 'email',
  full_name varchar(20) COMMENT '姓名',
  zip varchar(20) COMMENT '邮编',
  address varchar(200) COMMENT '地址',
  city varchar(20) COMMENT '城市',
  state varchar(20) COMMENT '省份',
  district varchar(50) COMMENT '区域',
  mobile  varchar(20) COMMENT '手机',
  telephone varchar(50) COMMENT '电话',
  last_sync datetime COMMENT '最后同步时间',
  PRIMARY KEY (pin)
) COMMENT='京东顾客';

CREATE TABLE plt_jd_order (
  order_id varchar(50) COMMENT '订单数据',
  vender_id varchar(50) COMMENT '商家id',
  pay_type varchar(20) COMMENT '支付方式',
  order_total_price decimal(12,2) COMMENT '订单总金额',
  order_payment decimal(12,2) COMMENT '用户应付金额',
  order_seller_price decimal(12,2) COMMENT '订单货款金额',
  freight_price decimal(12,2) COMMENT '商品的运费',
  seller_discount decimal(12,2) COMMENT '商家优惠金额',
  order_state varchar(50) COMMENT '订单状态',
  delivery_type varchar(50) COMMENT '送货（日期）类型',
  invoice_info varchar(100) COMMENT '发票信息',
  order_remark varchar(50) COMMENT '买家下单时订单备注',
  order_start_time datetime COMMENT '下单时间',
  order_end_time datetime COMMENT '结单时间',
  fullname varchar(20) COMMENT '收货人姓名',
  full_address varchar(200) COMMENT '地址',
  telephone varchar(50) COMMENT '固定电话',
  mobile varchar(20) COMMENT '手机',
  province varchar(20) COMMENT '省',
  city varchar(20) COMMENT '市',
  county varchar(50) COMMENT '县',
  return_order varchar(10) COMMENT '换货订单标识',
  vender_remark varchar(500) COMMENT '商家订单备注',
  pin varchar(50) COMMENT '买家账号',
  balance_used decimal(12,2) COMMENT '余额支付金额',
  modified datetime COMMENT '订单更新时间',
  payment_confirm_time datetime COMMENT '付款确认时间',
  logistics_id varchar(200) COMMENT '物流公司ID',
  waybill varchar(200) COMMENT '运单号',
  parent_order_id varchar(50) COMMENT '父订单号',
  trade_insert datetime COMMENT '数据入库时间',
  trade_update datetime COMMENT '数据修改时间',
  PRIMARY KEY (order_id)
) COMMENT='京东订单';

CREATE TABLE plt_jd_order_item   (
  order_id varchar(50) COMMENT '订单数据',
  order_item_id varchar(100) COMMENT '子订单ID',
  vender_id varchar(50) COMMENT '商家id',
  pay_type varchar(20) COMMENT '支付方式',
  order_state varchar(50) COMMENT '订单状态',
  order_remark varchar(50) COMMENT '买家下单时订单备注',
  order_start_time datetime COMMENT '下单时间',
  order_end_time datetime COMMENT '结单时间',
  pin varchar(50) COMMENT '买家账号',
  modified datetime COMMENT '订单更新时间',
  payment_confirm_time datetime COMMENT '付款确认时间',
  sku_id varchar(50) COMMENT 'SKU的ID',
  outer_sku_id varchar(50) COMMENT 'SKU外部ID',
  sku_name varchar(200) COMMENT '商品的名称+SKU规格',
  jd_price decimal(12,2) COMMENT 'SKU的京东价',
  gift_point decimal(12,2) COMMENT '赠送积分',
  ware_id varchar(50) COMMENT '京东内部商品ID',
  item_total decimal(12,0) COMMENT '数量',
  order_insert datetime COMMENT '数据入库时间',
  order_update datetime COMMENT '数据修改时间',
  PRIMARY KEY (order_item_id)
) COMMENT='京东子订单';

CREATE TABLE plt_jd_coupon_detail(
  order_id varchar(50) COMMENT '订单数据',
  vender_id varchar(50) COMMENT '商家id',
  sku_id varchar(50) COMMENT 'sku编号',
  coupon_type varchar(20) COMMENT '优惠类型',
  coupon_price decimal(12,2) COMMENT '优惠金额',
  PRIMARY KEY (order_id, coupon_type, sku_id)
) COMMENT='京东子订单';

CREATE TABLE plt_jd_refund(
  id varchar(20) COMMENT '退款单id',
  buyer_id varchar(50) COMMENT '客户帐号',
  buyer_name varchar(50) COMMENT '客户姓名',
  check_time datetime COMMENT '审核日期',
  apply_time datetime COMMENT '申请时间',
  apply_refund_sum decimal(12,2) COMMENT '退款金额',
  status varchar(20) COMMENT '审核状态',
  check_username varchar(20) COMMENT '审核人',
  order_id varchar(50) COMMENT '订单号',
  PRIMARY KEY (id)
) COMMENT='京东订单退款';

CREATE TABLE plt_jd_shop(
  ender_id varchar(20) COMMENT '商家编号',
  shop_id varchar(20) COMMENT '店铺编号',
  shop_name varchar(50) COMMENT '店铺名称',
  open_time datetime COMMENT '开店时间',
  logo_url varchar(200) COMMENT 'logo地址',
  category_main int(8) COMMENT '主营类目编号',
  category_main_name varchar(50) COMMENT '主营类目名称',
  order_created_earliest datetime COMMENT '最早的订单创建时间',
  order_created_latest datetime COMMENT '最新的订单创建时间',
  PRIMARY KEY (shop_id)
) COMMENT='京东店铺';

CREATE TABLE plt_jd_ware(
  ware_id int(10) COMMENT '商品ID',
  spu_id varchar(50) COMMENT 'spu IDsku_outer_id',
  cid int(10) COMMENT '分类ID 三级类目ID',
  vender_id varchar(50) COMMENT '商家ID,',
  shop_id varchar(50) COMMENT '店铺ID',
  ware_status varchar(20) COMMENT '商品状态:',
  title varchar(200) COMMENT '商品标题',
  item_num varchar(50) COMMENT '外部商品编号',
  upc_code varchar(50) COMMENT 'UPC编码',
  transport_id int(10) COMMENT '运费模板',
  online_time datetime COMMENT '最后上架时间',
  offline_time datetime COMMENT '最后下架时间',
  attributes varchar(400) COMMENT '可选属性',
  item_desc text COMMENT '商品描述',
  producter varchar(50) COMMENT '生产厂商',
  wrap text COMMENT '包装规格',
  cubage text COMMENT '长:宽:高',
  pack_listing text COMMENT '包装清单',
  service text COMMENT '售后服务',
  cost_price decimal(12,2) COMMENT '进货价, 精确到2位小数，单位:元',
  market_price decimal(12,2) COMMENT '市场价, 精确到2位小数，单位:元',
  jd_price decimal(12,2) COMMENT '京东价,精确到2位小数，单位:元',
  stock_num int(10) COMMENT '库存',
  logo varchar(200) COMMENT '商品的主图',
  creator varchar(50) COMMENT '录入人',
  status varchar(20) COMMENT '状态',
  weight varchar(20) COMMENT '重量,单位:公斤',
  created datetime COMMENT 'WARE_WARE创建时间',
  modified datetime COMMENT 'WARE_WARE修改时间',
  shop_categorys varchar(200) COMMENT '自定义店内分类',
  is_pay_first boolean COMMENT '是否先款后货 支付方式 false：非? true：是',
  is_can_vat boolean COMMENT '发票限制：?true为限制，false为不限制开增值税发票',
  is_imported boolean COMMENT '是否进口商品：?false为否，true为是',
  is_health_product boolean COMMENT '是否保健品：?false为否，true为是',
  is_shelf_life boolean COMMENT '是否保质期管理商品, false为否，true为是',
  shelf_life_days int(5) COMMENT '保质期：?0-99999范围区间',
  is_serial_no boolean COMMENT '是否序列号管理：?false为否，true为是',
  is_appliances_card boolean COMMENT '大家电购物卡：?false为否，true为是',
  is_special_wet boolean COMMENT '是否特殊液体：?false为否，true为是',
  ware_big_small_model int(5) COMMENT '商品件型：0免费、1超大件、2超大件半件、3大件、4大件半件、5中件、6中件半件、7小件、8超小件',
  ware_pack_type int(5) COMMENT '商品包装：1普通商品、2易碎品、3裸瓶液体、4带包装液体、5按原包装出库',
  sku_id int(10) COMMENT 'sku的id',
  sku_status varchar(50) COMMENT 'SKU状态 Invalid:无效 Valid:有效',
  sku_attributes varchar(200) COMMENT 'sku的销售属性组合字符串',
  sku_stock_num int(10) COMMENT '库存',
  sku_jd_price decimal(12,2) COMMENT '京东价,精确到2位小数，单位元',
  sku_cost_price decimal(12,2) COMMENT '进货价, 精确到2位小数，单位元',
  sku_market_price decimal(12,2) COMMENT '市场价, 精确到2位小数，单位元',
  sku_outer_id varchar(100) COMMENT '外部id,商家设置的外部id',
  sku_created datetime COMMENT 'sku创建时间',
  sku_modified datetime COMMENT 'sku修改时间',
  sku_color_value varchar(50) COMMENT '颜色对应的值',
  sku_size_value varchar(50) COMMENT '尺码对应的值',
  PRIMARY KEY (sku_id)
) COMMENT='京东商品';

CREATE TABLE plt_jd_category(
  vender_id varchar(50) COMMENT '商家id',
  id int(10) COMMENT '类目id',
  index_id int(10) COMMENT '排序（越小越靠前）',
  fid int(10) COMMENT '父类目id',
  name varchar(50) COMMENT '类目名称',
  is_parent boolean COMMENT '该类目是否为父类目(即：该类目是否还有子类目)',
  status varchar(20) COMMENT '类目状态（DELETED，UNVALID, VALID）',
  lev int(5) COMMENT '等级(类目分为1、2、3级)',
  PRIMARY KEY (vender_id, id)
) COMMENT='京东类目';

CREATE TABLE plt_jd_shop_category(
  vender_id varchar(50) COMMENT '商家id',
  cid int(10) COMMENT '类目编号',
  parent_id int(10) COMMENT '父类目编号',
  name varchar(20) COMMENT '类目名称',
  is_parent boolean COMMENT '类目是否为父类目，即：该类目是否还有子类目',
  is_open boolean COMMENT '是否展开子分类',
  is_home_show boolean COMMENT '是否在首页展示分类',
  shop_id varchar(50) COMMENT '店铺ID',
  index_id int(5) COMMENT '排序号',
  PRIMARY KEY (shop_id, cid)
) COMMENT='京东自定义类目';


ALTER TABLE plt_jd_shop CHANGE ender_id vender_id VARCHAR(20) COMMENT '商家编号';

ALTER TABLE plt_jd_order
 MODIFY COLUMN fullname VARCHAR(50) DEFAULT NULL COMMENT '收货人姓名',
 MODIFY COLUMN full_address VARCHAR(255) DEFAULT NULL COMMENT '地址',
 MODIFY COLUMN province VARCHAR(50) DEFAULT NULL COMMENT '省',
 MODIFY COLUMN city VARCHAR(50) DEFAULT NULL COMMENT '市';

ALTER TABLE plt_jd_order_item
 MODIFY COLUMN sku_name VARCHAR(255) DEFAULT NULL COMMENT '商品的名称+SKU规格';

ALTER TABLE plt_jd_customer
	MODIFY COLUMN full_name VARCHAR(50) DEFAULT NULL COMMENT '姓名',
	MODIFY COLUMN address VARCHAR(255) DEFAULT NULL COMMENT '地址',
	MODIFY COLUMN city VARCHAR(50) DEFAULT NULL COMMENT '城市',
	MODIFY COLUMN state VARCHAR(50) DEFAULT NULL COMMENT '省份';

ALTER table plt_jd_ware
  MODIFY COLUMN logo VARCHAR(255) DEFAULT NULL COMMENT '商品的主图';



alter table plt_jd_shop_category  modify column name varchar(255);
alter table plt_jd_category   add  shop_id varchar(20) NOT NULL DEFAULT '' COMMENT '店铺编号';
alter table plt_jd_order add column item_total decimal(12,0) COMMENT '数量';
alter table plt_jd_order   add  shop_id varchar(20) NOT NULL DEFAULT '' COMMENT '店铺编号';
alter table plt_jd_order_item   add  shop_id varchar(20) NOT NULL DEFAULT '' COMMENT '店铺编号';
alter table plt_jd_coupon_detail   add  shop_id varchar(20) NOT NULL DEFAULT '' COMMENT '店铺编号';

CREATE INDEX idx_pin  ON plt_jd_order(pin);

CREATE INDEX idx_payment_confirm_time  ON plt_jd_order(payment_confirm_time);

alter table plt_jd_ware   modify column   attributes varchar(800);
alter table plt_jd_ware   modify column   ware_status varchar(30);
alter table plt_jd_ware   modify column   shop_categorys varchar(300);
alter table plt_jd_order   modify column   order_remark varchar(100);

create index idx_plt_jd_order_item_order_id on plt_jd_order_item(order_id);


CREATE TABLE `plt_jd_shop_customer` (
  `pin` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '买家账号',
  `shop_id` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '店铺编号',
  PRIMARY KEY (`shop_id`,`pin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='京东店铺客人映射表';


drop table if EXISTS  plt_jd_order;
 CREATE TABLE `plt_jd_order` (
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单数据',
  `vender_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商家id',
  `pay_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `order_total_price` decimal(12,2) DEFAULT NULL COMMENT '订单总金额',
  `order_payment` decimal(12,2) DEFAULT NULL COMMENT '用户应付金额',
  `order_seller_price` decimal(12,2) DEFAULT NULL COMMENT '订单货款金额',
  `freight_price` decimal(12,2) DEFAULT NULL COMMENT '商品的运费',
  `seller_discount` decimal(12,2) DEFAULT NULL COMMENT '商家优惠金额',
  `order_state` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单状态',
  `delivery_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '送货（日期）类型',
  `invoice_info` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发票信息',
  `order_remark` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `order_start_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_end_time` datetime DEFAULT NULL COMMENT '结单时间',
  `fullname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
  `full_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `telephone` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `county` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `return_order` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '换货订单标识',
  `vender_remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '商家订单备注',
  `pin` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家账号',
  `balance_used` decimal(12,2) DEFAULT NULL COMMENT '余额支付金额',
  `modified` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_confirm_time` datetime DEFAULT NULL COMMENT '付款确认时间',
  `logistics_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司ID',
  `waybill` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号',
  `parent_order_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父订单号',
  `trade_insert` datetime DEFAULT NULL COMMENT '数据入库时间',
  `trade_update` datetime DEFAULT NULL COMMENT '数据修改时间',
  `item_total` decimal(12,0) DEFAULT NULL COMMENT '数量',
  `shop_id` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '店铺编号',
  PRIMARY KEY (`order_id`),
  KEY `idx_pin` (`pin`),
  KEY `idx_payment_confirm_time` (`payment_confirm_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='京东订单';







