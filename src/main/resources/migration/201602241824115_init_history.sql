/*
Navicat MySQL Data Transfer

Source Server         : 塔内数据库
Source Server Version : 50518
Source Host           : jconnifcv45mb.mysql.rds.aliyuncs.com:3306
Source Database       : test_dynamic_04

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2016-02-22 10:50:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_dm_taobao_order_history_import`
-- ----------------------------
CREATE TABLE `tb_dm_taobao_order_history_import` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trade_file_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '阿里云主订单文件id',
  `order_file_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '阿里云子订单文件id',
  `trade_file_name` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '主订单文件名称',
  `order_file_name` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '子订单文件名称',
  `trade_total` int(20) DEFAULT '0' COMMENT '主订单总条数',
  `order_total` int(20) DEFAULT '0' COMMENT '子订单总条数',
  `is_import` int(1) DEFAULT '0' COMMENT '0:没有导入系统,1:导入系统 ,2:正在导入中',
  `dp_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺id',
  `msg_batch` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '消息批次',
  `import_successful_total` int(20) DEFAULT '0' COMMENT '导入成功数',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单历史数据导入表';


-- ----------------------------
-- Table structure for `tb_dm_taobao_order_history_import_analyze`
-- ----------------------------
CREATE TABLE `tb_dm_taobao_order_history_import_analyze` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) NOT NULL COMMENT '外键',
  `file_name` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `file_type` int(20) DEFAULT '0' COMMENT '文件类型：0，订单报表 ， 1，宝贝报表',
  `file_record_total` int(20) DEFAULT '0' COMMENT '文件记录数',
  `import_record_total` int(20) DEFAULT '0' COMMENT '导入记录数',
  `import_err_total` int(20) DEFAULT NULL COMMENT '导入失败记录数',
  `is_import` tinyint(1) DEFAULT '0' COMMENT '0:没有导入系统,1:导入系统',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单历史数据分析结果表';


-- ----------------------------
-- Table structure for `tb_dm_taobao_order_history_import_analyze_error`
-- ----------------------------
CREATE TABLE `tb_dm_taobao_order_history_import_analyze_error` (
  `pkid` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) NOT NULL COMMENT '外键',
  `file_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '阿里云文件id',
  `file_name` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `file_type` int(20) DEFAULT '0' COMMENT '文件类型：0，订单报表 ， 1，宝贝报表',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单历史数据分析结果错误表';

