-- // create tds period dic init
-- Migration SQL that makes the change goes here.

CREATE TABLE `plt_taobao_rfm` (
  `rfm_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '指标ID',
  `rfm_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '指标名称',
  `rfm_period` bigint(20) NOT NULL COMMENT 'RFM指标分组ID',
  `table_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'RFM指标结果表名',
  `column_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shop_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺ID',
  `creator` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `rfm_updated` datetime DEFAULT NULL COMMENT '最后计算时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态： 1- 启用 0:-禁用',
  `type` tinyint(11) DEFAULT '1' COMMENT 'RFM指标类型：1-系统预置 0-自定义',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`rfm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE  `plt_taobao_order_rfm` (
  `buyer_nick` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户',
  `shop_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '指标所属店铺',
  `period` bigint(20) NOT NULL COMMENT '指标周期',
  `updated_at` datetime DEFAULT NULL COMMENT '最后计算时间',
  `number_purchased` int(11) DEFAULT '0' COMMENT '购买次数',
  `total_trade_count` int(11) DEFAULT '0' COMMENT '购买订单数',
  `total_amount` decimal(9,2) DEFAULT '0.00' COMMENT '购买金额',
  `total_number_of_items` int(11) DEFAULT '0' COMMENT '购买件数',
  `number_refunded` decimal(9,2) DEFAULT '0.00' COMMENT '退款次数',
  `total_refunded` decimal(9,2) DEFAULT '0.00' COMMENT '退款金额',
  `date_most_recent` date DEFAULT NULL COMMENT '最后一次购买时间',
  `amount_most_recent` decimal(9,2) DEFAULT '0.00' COMMENT '最后一次购买金额',
  `interval_most_recent` int(10) DEFAULT '0' COMMENT '最后一次购买间隔',
  `date_least_recent` date DEFAULT NULL COMMENT '第一次购买时间',
  `amount_least_recent` decimal(9,2) DEFAULT '0.00' COMMENT '第一次购买金额',
  `interval_least_recent` int(11) DEFAULT '0' COMMENT '第一次购买间隔',
  `average_amount` decimal(9,2) DEFAULT '0.00' COMMENT '平均每次购买金额',
  `average_number_of_items` decimal(9,2) DEFAULT '0.00' COMMENT '平均每次购买件数',
  `average_interval` decimal(9,2) DEFAULT '0.00' COMMENT '平均每次购买间隔',
  `average_delivery_interval` decimal(9,2) DEFAULT '0.00' COMMENT '平均发货到确认收货间隔',
  `max_trade_amount` decimal(9,2) DEFAULT '0.00' COMMENT '最大单笔订单购买金额',
  `total_trade_discount_fee` decimal(9,2) DEFAULT '0.00' COMMENT '订单级优惠费用',
  `total_item_discount_fee` decimal(9,2) DEFAULT '0.00' COMMENT '商品级优惠费用',
  PRIMARY KEY (`buyer_nick`,`shop_id`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `plt_taobao_rfm_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'RFM分组ID',
  `category_name` varchar(50) NOT NULL COMMENT 'RFM分组组名',
  `category_code` int(20) NOT NULL COMMENT '0-5分别表示:0-时间不限1-最近30天2-最近60天3-最近90天4-最近180天5-最近1年',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父组ID',
  `is_preset` tinyint(4) NOT NULL COMMENT '是否预置分组:1-预置,0-自定义',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


CREATE TABLE tds_period_dic (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) COLLATE utf8_bin NOT NULL COMMENT '字典显示名称',
  value int(10) NOT NULL COMMENT '字典值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='周期字典表';

INSERT INTO tds_period_dic VALUES ('1', '时间不限', '6');
INSERT INTO tds_period_dic VALUES ('2', '最近30天', '1');
INSERT INTO tds_period_dic VALUES ('3', '最近60天', '2');
INSERT INTO tds_period_dic VALUES ('4', '最近90天', '3');
INSERT INTO tds_period_dic VALUES ('5', '最近180天', '4');
INSERT INTO tds_period_dic VALUES ('6', '最近1年', '5');

ALTER TABLE plt_taobao_rfm_category CHANGE category_code category_code int(20) NOT NULL COMMENT '1-6分别表示:1-最近30天2-最近60天3-最近90天4-最近180天5-最近1年6-时间不限' ;

DELETE FROM plt_taobao_rfm_category;
DELETE FROM plt_taobao_rfm;
-- //create tds period dic init
-- Migration SQL that makes the change goes here.
DROP PROCEDURE IF EXISTS proc_insert_into_rfm ;

CREATE PROCEDURE proc_insert_into_rfm(IN period INT,IN shopId VARCHAR(50))
BEGIN
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('购买次数',period,'plt_taobao_order_rfm','number_purchased',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('购买订单数',period,'plt_taobao_order_rfm','total_trade_count',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('购买金额',period,'plt_taobao_order_rfm','total_amount',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('购买件数',period,'plt_taobao_order_rfm','total_number_of_items',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('退款次数',period,'plt_taobao_order_rfm','number_refunded',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('退款金额',period,'plt_taobao_order_rfm','total_refunded',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('最后一次购买时间',period,'plt_taobao_order_rfm','date_most_recent',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('最后一次购买金额',period,'plt_taobao_order_rfm','amount_most_recent',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('最后一次购买间隔',period,'plt_taobao_order_rfm','interval_most_recent',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('第一次购买时间',period,'plt_taobao_order_rfm','date_least_recent',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('第一次购买金额',period,'plt_taobao_order_rfm','amount_least_recent',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('第一次购买间隔',period,'plt_taobao_order_rfm','interval_least_recent',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('平均每次购买金额',period,'plt_taobao_order_rfm','average_amount',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('平均每次购买件数',period,'plt_taobao_order_rfm','average_number_of_items',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('平均每次购买间隔',period,'plt_taobao_order_rfm','average_interval',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('平均发货到确认收货间隔',period,'plt_taobao_order_rfm','average_delivery_interval',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('最大单笔订单购买金额',period,'plt_taobao_order_rfm','max_trade_amount',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('订单级优惠费用',period,'plt_taobao_order_rfm','total_trade_discount_fee',shopId,'系统预置',NOW(),1,1);
  INSERT INTO plt_taobao_rfm(rfm_name,rfm_period,table_name,column_name,shop_id,creator,created,status,type) VALUES('商品级优惠费用',period,'plt_taobao_order_rfm','total_item_discount_fee',shopId,'系统预置',NOW(),1,1);
END;

DROP PROCEDURE IF EXISTS proc_config_taobao_shop_rfm ;
CREATE PROCEDURE proc_config_taobao_shop_rfm(IN p_shop_id varchar(50),IN p_shop_name varchar(100))
    COMMENT '配置“淘宝”平台新子店铺的预置RFM指标'
BEGIN
  DECLARE categoryid int;
  DECLARE category_parent_id int;
	select category_id INTO category_parent_id from plt_taobao_rfm_category where is_preset = 1 and shop_id = p_shop_id and parent_id IS NULL ;
	IF( category_parent_id IS NULL ) THEN
		BEGIN
			INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,is_preset) VALUES(p_shop_name,-1,p_shop_id,1);
			select LAST_INSERT_ID() into category_parent_id;#刚刚生成的目录数据主键


			SELECT category_id INTO categoryid FROM plt_taobao_rfm_category WHERE parent_id = category_parent_id AND shop_id = p_shop_id AND category_code = 6 ;
			IF(categoryid IS NULL) THEN
				BEGIN
					INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,parent_id,is_preset) VALUES('时间不限',6,p_shop_id,category_parent_id,1) ;
					CALL proc_insert_into_rfm(6,p_shop_id);
				END;
			END IF ;

			SELECT category_id INTO categoryid FROM plt_taobao_rfm_category WHERE parent_id = category_parent_id AND shop_id = p_shop_id AND category_code = 1 ;
			IF(categoryid IS NULL) THEN
				BEGIN
					INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,parent_id,is_preset) VALUES('最近30天',1,p_shop_id,category_parent_id,1) ;
					CALL proc_insert_into_rfm(1,p_shop_id);
				END;
			END IF ;

			SELECT category_id INTO categoryid FROM plt_taobao_rfm_category WHERE parent_id = category_parent_id AND shop_id = p_shop_id AND category_code = 2 ;
			IF(categoryid IS NULL) THEN
				BEGIN
					INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,parent_id,is_preset) VALUES('最近60天',2,p_shop_id,category_parent_id,1) ;
					CALL proc_insert_into_rfm(2,p_shop_id);
				END;
			END IF ;

			SELECT category_id INTO categoryid FROM plt_taobao_rfm_category WHERE parent_id = category_parent_id AND shop_id = p_shop_id AND category_code = 3 ;
			IF(categoryid IS NULL) THEN
				BEGIN
					INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,parent_id,is_preset) VALUES('最近90天',3,p_shop_id,category_parent_id,1) ;
					CALL proc_insert_into_rfm(3,p_shop_id);
				END;
			END IF ;

			SELECT category_id INTO categoryid FROM plt_taobao_rfm_category WHERE parent_id = category_parent_id AND shop_id = p_shop_id AND category_code = 4 ;
			IF(categoryid IS NULL) THEN
				BEGIN
					INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,parent_id,is_preset) VALUES('最近180天',4,p_shop_id,category_parent_id,1) ;
					CALL proc_insert_into_rfm(4,p_shop_id);
				END;
			END IF ;

			SELECT category_id INTO categoryid FROM plt_taobao_rfm_category WHERE parent_id = category_parent_id AND shop_id = p_shop_id AND category_code = 5 ;
			IF(categoryid IS NULL) THEN
				BEGIN
					INSERT INTO plt_taobao_rfm_category (category_name,category_code,shop_id,parent_id,is_preset) VALUES('最近一年',5,p_shop_id,category_parent_id,1) ;
					CALL proc_insert_into_rfm(5,p_shop_id);
				END;
			END IF ;
		END;
	END IF;
END;

CREATE TABLE `metas_rfm_segmentation_config` (
  `segmentation_id` bigint(20) NOT NULL COMMENT 'metas_segmentation_model的model_id',
  PRIMARY KEY (`segmentation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO metas_rfm_segmentation_config VALUES (1);


ALTER TABLE plt_taobao_order_rfm MODIFY COLUMN total_trade_count int DEFAULT 0 COMMENT '购买次数';
ALTER TABLE plt_taobao_order_rfm MODIFY COLUMN number_purchased int DEFAULT 0 COMMENT '购买订单数';
alter table plt_taobao_order_rfm   modify column   total_amount decimal(12,2);
alter table plt_taobao_order_rfm   modify column   total_refunded decimal(12,2);




