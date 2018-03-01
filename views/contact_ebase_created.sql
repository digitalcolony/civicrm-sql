CREATE VIEW `contact_ebase_created` AS
    SELECT 
        `C`.`id` AS `id`,
        `C`.`display_name` AS `display_name`,
        `C`.`created_date` AS `created_date`,
        `E`.`ebase_add_date_88` AS `eBase`,
        IF((`E`.`ebase_add_date_88` < `C`.`created_date`),
            `E`.`ebase_add_date_88`,
            `C`.`created_date`) AS `FirstCreated`
    FROM
        (`civicrm_contact` `C`
        LEFT JOIN `civicrm_value_1_additional_demographics` `E` ON ((`E`.`entity_id` = `C`.`id`)))