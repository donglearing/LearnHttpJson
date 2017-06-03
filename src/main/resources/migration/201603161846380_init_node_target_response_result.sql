-- 目标组预览表
CREATE TABLE node_target_result(
  `node_execution_id` bigint(50) NOT NULL,
  `line` VARCHAR(1024) ,
   KEY `index_node_id` (`node_execution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='目标组预览表';
-- 响应组预览表
CREATE TABLE node_response_result(
  `node_execution_id` bigint(50) NOT NULL,
  `line` VARCHAR(1024) ,
   KEY `index_node_id` (`node_execution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='响应组预览表';

