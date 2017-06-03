-- // alter node_time.
-- Migration SQL that makes the change goes here.
-- table init ------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS procedure_clear_taobao_data;
DROP PROCEDURE IF EXISTS procedure_sql_execute;
DROP PROCEDURE IF EXISTS proc_add_campaign_type;

DROP PROCEDURE IF EXISTS procedure_sql_execute;
CREATE PROCEDURE procedure_sql_execute(IN sql_str VARCHAR(500))
BEGIN

  SET @execute_sql = sql_str;

  PREPARE statement FROM @execute_sql;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END;

DROP PROCEDURE IF EXISTS procedure_clear_taobao_data;
CREATE PROCEDURE procedure_clear_taobao_data (IN DP_ID VARCHAR(50))
BEGIN

  SET @DP_ID = DP_ID;

  SET @delete_sql = CONCAT("DELETE a FROM customer_group_category a INNER JOIN plt_taobao_shop b ON a.category_name = b.shop_name WHERE b.shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_acookie_visitorid WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_chat_log WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_chatpeer WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_coupon WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);


  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_crm_member WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);


  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_shop_customer WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_favorite WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE a FROM plt_taobao_promotion a INNER JOIN plt_taobao_order b ON a.tid = b.tid WHERE b.dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE a FROM plt_taobao_transitstepinfo_tc a INNER JOIN plt_taobao_transitstepinfo b ON a.tid = b.tid INNER JOIN plt_taobao_order c ON c.tid = b.tid WHERE c.dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE a FROM plt_taobao_transitstepinfo a INNER JOIN plt_taobao_order b ON a.tid = b.tid WHERE b.dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_order WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_order_item WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_order_channel WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_order_item_channel WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_order_rfm WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_product_onsale WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE a FROM plt_taobao_product_skus_prop a INNER JOIN plt_taobao_product_skus b ON a.num_iid = b.num_iid WHERE b.dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_product_skus WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE a FROM plt_taobao_product_prop a INNER JOIN plt_taobao_product b ON a.num_iid = b.num_iid WHERE b.dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE a FROM plt_taobao_product_seller_cat a INNER JOIN plt_taobao_product b ON a.num_iid = b.num_iid WHERE b.dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_product WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_refund WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_rfm WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_rfm_category WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_shipping WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_shop WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_shop_cid_relation WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_shopping_cart WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_sku_onsale WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_taobao_traderate WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

END;

CREATE PROCEDURE `proc_add_campaign_type`(IN categoryValue varchar(50))
BEGIN
  DECLARE existnum BIGINT(20);

	SELECT
		count(a.category_value) INTO existnum
	FROM
		campaign_category_entry a
		WHERE a.category_value =categoryValue;

    IF existnum = 0 THEN
		 insert into  campaign_category_entry(category_value,disabled) VALUES(categoryValue,0);
	END if;

END;

-- 创建RFM视图
DROP VIEW IF EXISTS v_order_rfm; 
CREATE OR REPLACE VIEW v_order_rfm AS SELECT
	`plt_taobao_order_rfm`.`buyer_nick` AS `buyer_nick`,
	`plt_taobao_order_rfm`.`shop_id` AS `shop_id`,
	`plt_taobao_order_rfm`.`period` AS `period`,
	`plt_taobao_order_rfm`.`updated_at` AS `updated_at`,
	`plt_taobao_order_rfm`.`number_purchased` AS `number_purchased`,
	`plt_taobao_order_rfm`.`total_trade_count` AS `total_trade_count`,
	`plt_taobao_order_rfm`.`total_amount` AS `total_amount`,
	`plt_taobao_order_rfm`.`total_number_of_items` AS `total_number_of_items`,
	`plt_taobao_order_rfm`.`number_refunded` AS `number_refunded`,
	`plt_taobao_order_rfm`.`total_refunded` AS `total_refunded`,
	`plt_taobao_order_rfm`.`date_most_recent` AS `date_most_recent`,
	`plt_taobao_order_rfm`.`amount_most_recent` AS `amount_most_recent`,
	(
		to_days(curdate())- to_days(
			`plt_taobao_order_rfm`.`date_most_recent`
		)
	)AS `interval_most_recent`,
	`plt_taobao_order_rfm`.`date_least_recent` AS `date_least_recent`,
	`plt_taobao_order_rfm`.`amount_least_recent` AS `amount_least_recent`,
	(
		to_days(curdate())- to_days(
			`plt_taobao_order_rfm`.`date_least_recent`
		)
	)AS `interval_least_recent`,
	`plt_taobao_order_rfm`.`average_amount` AS `average_amount`,
	`plt_taobao_order_rfm`.`average_number_of_items` AS `average_number_of_items`,
	`plt_taobao_order_rfm`.`average_interval` AS `average_interval`,
	`plt_taobao_order_rfm`.`average_delivery_interval` AS `average_delivery_interval`,
	`plt_taobao_order_rfm`.`max_trade_amount` AS `max_trade_amount`,
	`plt_taobao_order_rfm`.`total_trade_discount_fee` AS `total_trade_discount_fee`,
	`plt_taobao_order_rfm`.`total_item_discount_fee` AS `total_item_discount_fee`
FROM
	`plt_taobao_order_rfm` ;


DROP FUNCTION IF EXISTS fn_choose_taobao_customer_field;
DROP FUNCTION IF EXISTS now_age;

CREATE FUNCTION `fn_choose_taobao_customer_field`(p_recentName varchar(255), p_mostName varchar(255), p_modifyName varchar(255)) RETURNS varchar(255) CHARSET utf8
BEGIN
  DECLARE v_priority varchar(255);

	IF p_modifyName IS NOT NULL AND trim(p_modifyName) <> '' THEN
		RETURN p_modifyName;
	END if;

  SELECT prop_value
    INTO v_priority
    FROM config
  WHERE prop_group = 'CCMS'
    AND prop_name = 'customer_most_used_high_priority'
  LIMIT 1;

  IF v_priority IS null OR v_priority = '0' THEN
    RETURN p_recentName;
  END if;

  RETURN p_mostName;
END ;



CREATE FUNCTION `now_age`(birthyear int) RETURNS int(11)
BEGIN

	IF(ISNULL(birthyear) OR birthyear = 0 OR YEAR (curdate()) < birthyear) THEN
		RETURN -1;
	END IF;

	RETURN (YEAR (curdate()) - birthyear + 1);

END ;


drop PROCEDURE if exists procedure_clear_jd_data;

 
CREATE  PROCEDURE procedure_clear_jd_data (IN DP_ID VARCHAR(50))
BEGIN

	SET @DP_ID = DP_ID;

	SET @delete_sql = CONCAT("DELETE FROM plt_jd_category WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);

	SET @delete_sql = CONCAT("DELETE FROM plt_jd_coupon_detail WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);


	SET @delete_sql = CONCAT("DELETE FROM plt_jd_shop_customer WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);
	
	SET @delete_sql = CONCAT("DELETE FROM plt_jd_order WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);
	
	SET @delete_sql = CONCAT("DELETE FROM plt_jd_order_item WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);
	
	SET @delete_sql = CONCAT("DELETE FROM plt_jd_shop WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);
	
	SET @delete_sql = CONCAT("DELETE FROM plt_jd_shop_category WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);

	


	SET @delete_sql = CONCAT("DELETE FROM plt_jd_ware WHERE shop_id = '", @DP_ID, "';");
	CALL procedure_sql_execute(@delete_sql);

END;

drop PROCEDURE if exists procedure_clear_yhd_data;


 
CREATE  PROCEDURE procedure_clear_yhd_data (IN DP_ID VARCHAR(50))
BEGIN

  SET @DP_ID = DP_ID;

  SET @delete_sql = CONCAT("DELETE FROM plt_yhd_order WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_yhd_order_item WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_yhd_product WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
    
  
  SET @delete_sql = CONCAT("DELETE FROM plt_yhd_shop WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  
  SET @delete_sql = CONCAT("DELETE FROM plt_yhd_shop_customer  WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);



END;


drop PROCEDURE if exists procedure_clear_paipai_data;



CREATE  PROCEDURE procedure_clear_paipai_data (IN DP_ID VARCHAR(50))
BEGIN

  SET @DP_ID = DP_ID;

  SET @delete_sql = CONCAT("DELETE FROM plt_paipai_deal WHERE seller_uin = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_paipai_deal_item WHERE seller_uin = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_paipai_item WHERE seller_uin = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_paipai_refund WHERE seller_uin = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_paipai_shop WHERE seller_uin = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  

  
  SET @delete_sql = CONCAT("DELETE FROM plt_paipai_shop_customer  WHERE  seller_uin = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

END;


drop PROCEDURE if exists procedure_clear_dangdang_data;


CREATE  PROCEDURE procedure_clear_dangdang_data (IN DP_ID VARCHAR(50))
BEGIN

  SET @DP_ID = DP_ID;

  SET @delete_sql = CONCAT("DELETE FROM plt_dd_order WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_dd_order_item  WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_dd_product_sku  WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);

  SET @delete_sql = CONCAT("DELETE FROM plt_dd_promotion  WHERE dp_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  
  SET @delete_sql = CONCAT("DELETE FROM plt_dd_shop  WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
  

  
    SET @delete_sql = CONCAT("DELETE FROM plt_dd_shop_customer  WHERE shop_id = '", @DP_ID, "';");
  CALL procedure_sql_execute(@delete_sql);
END;





























