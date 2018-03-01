/* Due to corrupt install, we created a table 
  to track removed groups for reporting purposes */
  
CREATE TABLE `bad_group_ids` (
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
