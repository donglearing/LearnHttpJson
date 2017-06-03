CREATE TABLE `product_tags` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品标签ID',
  `tag_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品标签名称',
  `tag_describe` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标签描述',
  `creater_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '商品标签创建时间',
  `tag_category_id` bigint(20) DEFAULT NULL COMMENT '商品标签分类-预留字段',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品标签表';


-- ----------------------------
-- Table structure for `product_tags_relation`
-- ----------------------------
CREATE TABLE `product_tags_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) NOT NULL COMMENT '商品标签ID',
  `num_iid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品数字ID',
  PRIMARY KEY (`id`,`tag_id`,`num_iid`),
  UNIQUE KEY `unique_tagid_numiid` (`tag_id`,`num_iid`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1314 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品标签与商品对应关系表';

