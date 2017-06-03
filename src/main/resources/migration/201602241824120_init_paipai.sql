CREATE TABLE plt_paipai_deal (
  seller_uin varchar(20) COMMENT '店铺id(卖家qq号)',
  deal_code varchar(50) COMMENT '定单编码',
  buyer_remark varchar(200) COMMENT '买家下单时的留言内容',
  pay_type varchar(20) COMMENT '订单的付款类型',
  rate_state varchar(50) COMMENT '订单的评价状态',
  tenpay_code varchar(50) COMMENT '财付通付款单号',
  wuliu_id varchar(50) COMMENT '物流的编码',
  pp_cod_id varchar(50) COMMENT '货到付款ppcod号,预约后产生:PPCOD前缀 + 数字',
  receiver_address varchar(100) COMMENT '收货人地址信息',
  receiver_mobile varchar(20) COMMENT '收货人手机号码',
  receiver_name varchar(20) COMMENT '收货人姓名',
  receiver_phone varchar(20) COMMENT '收货人电话号码',
  receiver_postcode varchar(10) COMMENT '收货人邮编',
  buyer_name varchar(20) COMMENT '买家名称',
  buyer_uin varchar(20) COMMENT '买家QQ号',
  freight decimal(12,2) COMMENT '运费',
  transport_type varchar(20) COMMENT '运送类型',
  pay_fee_total decimal(12,2) COMMENT '费用合计,包括可折合钱：积分、财付券之类',
  total_cash decimal(12,2) COMMENT '总支付现金',
  pay_fee_ticket decimal(12,2) COMMENT '财付券支付金额',
  combo_info varchar(50) COMMENT '促销信息',
  coupon_fee decimal(12,2) COMMENT '折扣优惠金额',
  state varchar(40) COMMENT '订单状态',
  propertymask varchar(50) COMMENT '订单属性串：各个属性之间用下划线_隔开',
  create_time datetime COMMENT '下单时间',
  end_time datetime COMMENT '订单结束时间',
  pay_time datetime COMMENT '买家付款时间',
  pay_return_time datetime COMMENT '付款返款时间',
  recvfee_return_time datetime COMMENT '收到返款的时间',
  recvfee_time datetime COMMENT '返款时间',
  seller_consignment_time datetime COMMENT '卖家标记发货时间',
  last_update_time datetime COMMENT '最后修改时间',
  note_type varchar(50) COMMENT '订单的备注类型',
  note varchar(200) COMMENT '订单的备注内容',
  deal_insert datetime COMMENT '数据入库时间',
  deal_update datetime COMMENT '数据最后修改时间',
  PRIMARY KEY (deal_code)
) COMMENT='拍拍订单';

CREATE TABLE plt_paipai_deal_item (
  seller_uin varchar(20) COMMENT '店铺id(卖家qq号)',
  deal_code varchar(50) COMMENT '定单编码',
  deal_paytype varchar(20) COMMENT '订单的付款类型',
  buyer_uin varchar(20) COMMENT '买家QQ号',
  deal_state varchar(40) COMMENT '订单状态',
  create_time datetime COMMENT '下单时间',
  end_time datetime COMMENT '订单结束时间',
  pay_time datetime COMMENT '买家付款时间',
  pay_return_time datetime COMMENT '付款返款时间',
  recvfee_return_time datetime COMMENT '收到返款的时间',
  recvfee_time datetime COMMENT '返款时间',
  seller_consignment_time datetime COMMENT '卖家标记发货时间',
  last_update_time datetime COMMENT '最后修改时间',
  deal_sub_code varchar(50) COMMENT '子订单id',
  item_code varchar(50) COMMENT '商品编码',
  item_code_history varchar(50) COMMENT '订单的商品快照编码',
  item_local_code varchar(50) COMMENT '商家编码',
  sku_id varchar(20) COMMENT '商品的库存唯一标识码,由拍拍平台生成',
  stock_local_code varchar(50) COMMENT '商品库存编码',
  stock_attr varchar(50) COMMENT '买家下单时选择的库存属性',
  item_name varchar(50) COMMENT '商品名称',
  item_deal_price decimal(12,2) COMMENT '买家下单时的商品价格',
  item_adjust_price decimal(12,2) COMMENT '订单的调整价格:正数为订单加价,负数为订单减价',
  item_discount_fee decimal(12,2) COMMENT '购买商品的红包值、折扣优惠价',
  item_deal_count int(8) COMMENT '购买的数量',
  trade_propertymask varchar(100) COMMENT '自订单属性串，多个属性之间用下划线_隔开',
  wanggou_quan_id varchar(50) COMMENT '网购券ID',
  wanggou_quan_amt decimal(12,2) COMMENT '网购券金额',
  PRIMARY KEY (deal_sub_code)
) COMMENT='拍拍子订单';

CREATE TABLE plt_paipai_customer (
  buyer_uin varchar(50) COMMENT '买家的账号信息',
  job varchar(50) COMMENT '职业',
  birth_year datetime COMMENT '生日',
  email varchar(50) COMMENT 'Email',
  full_name varchar(20) COMMENT '名称',
  zip varchar(20) COMMENT 'zip(拍拍字段receiverPostcode)',
  address varchar(200) COMMENT '地址',
  city varchar(20) COMMENT '拍拍没有提供',
  state varchar(20) COMMENT '拍拍没有提供',
  district varchar(20) COMMENT '拍拍没有提供',
  mobile varchar(20) COMMENT '手机',
  telephone varchar(50) COMMENT '固定电话',
  last_sync datetime COMMENT '最后更新时间',
  full_name_most varchar(20) COMMENT '',
  zip_most varchar(20) COMMENT '',
  address_most varchar(200) COMMENT '',
  city_most varchar(20) COMMENT '',
  state_most varchar(20) COMMENT '',
  district_most varchar(20) COMMENT '',
  mobile_most varchar(20) COMMENT '',
  tel_phone_most varchar(50) COMMENT '',
  last_sync_most datetime COMMENT '',
  PRIMARY KEY (buyer_uin)
) COMMENT='拍拍客户';

CREATE TABLE plt_paipai_shop (
  seller_uin varchar(20) COMMENT '店铺标识',
  shop_name varchar(50) COMMENT '店铺名称',
  order_created_earliest datetime COMMENT '最早下单时间',
  order_created_latest datetime COMMENT '最迟下单时间',
  PRIMARY KEY (seller_uin)
) COMMENT='拍拍店铺';

CREATE TABLE plt_paipai_refund (
  deal_code varchar(50) COMMENT '订单编码',
  buyer_consignment_desc varchar(200) COMMENT '买家发送退货描述',
  buyer_consignment_time datetime COMMENT '买家发送退货时间',
  buyer_consignment_wuliu varchar(200) COMMENT '买家发送退货物流信息',
  deal_create_time datetime COMMENT '订单生成时间',
  deal_sub_code varchar(50) COMMENT '子订单编号',
  last_update_time datetime COMMENT '最后更新时间',
  pre_refund_state varchar(20) COMMENT '之前的退款状态',
  refund_end_time datetime COMMENT '退款结束时间',
  refund_item_state boolean COMMENT '货物状态',
  refund_reason_desc varchar(200) COMMENT '申请退款附言',
  refund_reason_type int COMMENT '退款原因类型：',
  refund_reqitem_flag boolean COMMENT '是否需要退货，1需要退货，0不需要退货',
  refund_req_time datetime COMMENT '申请退款时间',
  refund_state datetime COMMENT '退款状态',
  refun_to_buyer decimal(12,2) COMMENT '申请退还买家金额',
  refund_to_buyer_num decimal(12,2) COMMENT '申请退还买家数量',
  refund_to_seller decimal(12,2) COMMENT '支付给卖家金额',
  seller_agree_giveback_time datetime COMMENT '卖家同意退货时间',
  seller_agree_item_msg varchar(200) COMMENT '卖家同意退货附言',
  seller_agree_msg varchar(200) COMMENT '卖家同意退款附言',
  seller_refuse_time datetime COMMENT '拒绝协议时间',
  seller_uin varchar(20) COMMENT '商家编号',
  refund_insert datetime COMMENT '数据创建时间',
  refund_update datetime COMMENT '数据更新时间',
  PRIMARY KEY (deal_sub_code)
) COMMENT='拍拍退款';

CREATE TABLE plt_paipai_item (
  seller_uin varchar(20) COMMENT '卖家QQ号',
  code varchar(20) COMMENT '商品编码',
  name varchar(50) COMMENT '商品名称1-60字节',
  local_code varchar(50) COMMENT '合作商家的私有商品编码',
  state varchar(20) COMMENT '商品状态',
  state_code int(5) COMMENT '商品状态码',
  property int(5) COMMENT '商品属性',
  properties varchar(200) COMMENT '商品属性串(拍拍助理)',
  category_id varchar(20) COMMENT '商品所属的店铺分类id',
  class_id varchar(20) COMMENT '商品所属的拍拍类目id。',
  attr varchar(50) COMMENT '原有商品属性信息',
  attr2 varchar(50) COMMENT '新商品属性串信息',
  custom_attr varchar(50) COMMENT '自定义属性字符串',
  sell_type varchar(50) COMMENT '出售类型',
  pay_type varchar(20) COMMENT '支付类型',
  market_price decimal(12,2) COMMENT '商品的市场参考价格，只对QQ会员特权卖家有效。',
  item_price decimal(12,2) COMMENT '商品价格',
  qqvip_item int(1) COMMENT '是否QQ会员商品1是0否。请求参数extendInfo=1时有效',
  qqvip_discount decimal(12,2) COMMENT '商品折扣。请求参数extendInfo=1时有效',
  seller_pay_freight int(5) COMMENT '买家或卖家承担运费',
  freight_id varchar(20) COMMENT '运费模版Id',
  cod_id varchar(20) COMMENT '货到付款运费模版Id',
  weight decimal(12,2) COMMENT '商品重量',
  mailPrice decimal(12,2) COMMENT '平邮价格',
  expressPrice decimal(12,2) COMMENT '快递价格',
  city_id varchar(20) COMMENT '商品所在城市',
  province_id varchar(20) COMMENT '所在省',
  country_id varchar(20) COMMENT '国家',
  recommend_item boolean COMMENT '是否推荐商品',
  window_item boolean COMMENT '是否橱窗商品',
  invoice_item boolean COMMENT '是否提供发票',
  guarantee_compensation boolean COMMENT '是否假一赔三诚信保证商品',
  guarantee_7_days boolean COMMENT '是否7天包退诚信保证商品',
  guarantee_14_days boolean COMMENT '是否14天先行赔付诚信保证商品',
  guarantee_repair boolean COMMENT '是否保修商品',
  support_tenpay boolean COMMENT '是否支持财付通',
  buy_limit int(9) COMMENT '购买限制，0，表示不限制。大于0的值表示单个买家购买该商品不得超过该数目。',
  valid_duration int(9) COMMENT '上架时长，单位为秒',
  theme varchar(50) COMMENT '商品详情页面颜色主题',
  reload_count int COMMENT '修改次数',
  visit_count int COMMENT '商品被访问次数',
  size_table_id varchar(20) COMMENT '尺码表id extendInfo=1 时有效',
  create_time datetime COMMENT '发布时间 yyyy-MM-dd HH:mm:ss',
  last_modify_time datetime COMMENT '最近修改时间 yyyy-MM-dd HH:mm:ss',
  last_to_sale_time datetime COMMENT '最近上架时间 yyyy-MM-dd HH:mm:ss',
  last_to_store_time datetime COMMENT '最近下架时间 yyyy-MM-dd HH:mm:ss',
  item_insert datetime COMMENT '数据入库时间',
  item_update datetime COMMENT '数据最后修改时间',
  PRIMARY KEY (code)
) COMMENT='拍拍商品';


ALTER TABLE plt_paipai_deal
  MODIFY COLUMN seller_uin VARCHAR(50) DEFAULT NULL COMMENT '店铺id(卖家qq号)',
  MODIFY COLUMN receiver_address VARCHAR(225) DEFAULT NULL COMMENT '收货人地址信息',
  MODIFY COLUMN receiver_name VARCHAR(50) DEFAULT NULL COMMENT '收货人姓名',
  MODIFY COLUMN receiver_phone VARCHAR(50) DEFAULT NULL COMMENT '收货人电话号码',
  MODIFY COLUMN buyer_uin VARCHAR(50) DEFAULT NULL COMMENT '买家QQ号',
  MODIFY COLUMN state VARCHAR(50) DEFAULT NULL COMMENT '订单状态';

ALTER TABLE plt_paipai_deal_item
  MODIFY COLUMN seller_uin VARCHAR(50) DEFAULT NULL COMMENT '店铺id(卖家qq号)',
  MODIFY COLUMN buyer_uin VARCHAR(50) DEFAULT NULL COMMENT '买家QQ号',
  MODIFY COLUMN deal_state VARCHAR(50) DEFAULT NULL COMMENT '订单状态',
  MODIFY COLUMN item_name VARCHAR(225) DEFAULT NULL COMMENT '商品名称',
  MODIFY COLUMN item_deal_count INT(11) DEFAULT NULL COMMENT '购买的数量';

ALTER TABLE plt_paipai_customer
  MODIFY COLUMN `full_name` VARCHAR(50) DEFAULT NULL COMMENT '名称',
  MODIFY COLUMN `address` VARCHAR(255) DEFAULT NULL COMMENT '地址',
  MODIFY COLUMN `city` VARCHAR(50) DEFAULT NULL COMMENT '拍拍没有提供',
  MODIFY COLUMN `state` VARCHAR(50) DEFAULT NULL COMMENT '拍拍没有提供',
  MODIFY COLUMN `district` VARCHAR(100) DEFAULT NULL COMMENT '拍拍没有提供';

ALTER TABLE plt_paipai_item
  MODIFY COLUMN `seller_uin` VARCHAR(50) DEFAULT NULL COMMENT '卖家QQ号',
  MODIFY COLUMN `code` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '商品编码',
  MODIFY COLUMN `name` VARCHAR(255) DEFAULT NULL COMMENT '商品名称1-60字节';


alter table  plt_paipai_customer modify buyer_uin   varchar(50) COMMENT   '买家的账号信息';
alter table  plt_paipai_customer modify job   varchar(50) COMMENT   '工作';
alter table  plt_paipai_customer modify birth_year   datetime COMMENT   '生日';
alter table  plt_paipai_customer modify email   varchar(50) COMMENT   ' buyerUin@qq.com';
alter table  plt_paipai_customer modify full_name   varchar(20) COMMENT   '收货人姓名';
alter table  plt_paipai_customer modify zip   varchar(20) COMMENT   '邮编(拍拍字段receiverPostcode)';
alter table  plt_paipai_customer modify address   varchar(200) COMMENT   '地址';
alter table  plt_paipai_customer modify city   varchar(20) COMMENT   '城市 拍拍没有提供';
alter table  plt_paipai_customer modify state   varchar(20) COMMENT   '省份 拍拍没有提供';
alter table  plt_paipai_customer modify district   varchar(20) COMMENT   '地区 拍拍没有提供';
alter table  plt_paipai_customer modify mobile   varchar(20) COMMENT   '手机';

alter table  plt_paipai_customer modify telephone   varchar(50) COMMENT   '固定电话';
alter table  plt_paipai_customer modify last_sync   datetime COMMENT   '最后更新时间';
alter table  plt_paipai_customer modify full_name_most   varchar(20) COMMENT   '计算后收货人姓名';
alter table  plt_paipai_customer modify zip_most   varchar(20) COMMENT   '计算后邮编';
alter table  plt_paipai_customer modify address_most   varchar(200) COMMENT   '计算后地址';
alter table  plt_paipai_customer modify city_most   varchar(20) COMMENT   '计算后城市';
alter table  plt_paipai_customer modify state_most   varchar(20) COMMENT   '计算后省份';

alter table  plt_paipai_customer modify district_most   varchar(20) COMMENT   '计算后地区';
alter table  plt_paipai_customer modify mobile_most   varchar(20) COMMENT   '计算后手机';
alter table  plt_paipai_customer modify tel_phone_most   varchar(50) COMMENT   '计算后固定电话';
alter table  plt_paipai_customer modify last_sync_most   datetime COMMENT   '计算后最后更新时间';
ALTER TABLE plt_paipai_deal add COLUMN item_deal_count INT(11) DEFAULT NULL COMMENT '购买的数量';

CREATE TABLE `plt_paipai_shop_customer` (
  `seller_uin` varchar(20) DEFAULT NULL COMMENT '店铺id(卖家qq号)',
  `buyer_uin` varchar(20) DEFAULT NULL COMMENT '买家QQ号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table plt_paipai_shop_customer add PRIMARY KEY (`seller_uin`,`buyer_uin`);

CREATE INDEX idx_buyer_uin  ON plt_paipai_deal(buyer_uin);

CREATE INDEX idx_pay_time  ON plt_paipai_deal(pay_time);
alter table plt_paipai_refund change refund_state  refund_state varchar(40);

alter table plt_paipai_refund   modify column   pre_refund_state varchar(40);
alter table plt_paipai_deal   modify column   combo_info varchar(150);
alter table plt_paipai_deal   modify column   buyer_name varchar(40);
alter table plt_paipai_deal   modify column   note  varchar(300);
alter table plt_paipai_customer   modify column   full_name varchar(30);





