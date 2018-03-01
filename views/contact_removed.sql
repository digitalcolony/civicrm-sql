CREATE VIEW `contact_removed` AS
    SELECT 
        `C`.`id` AS `id`,
        `C`.`display_name` AS `display_name`,
        `RS`.`reason_removed` AS `reason_removed`,
        `RS`.`date_removed` AS `date_removed`
    FROM
        (`civicrm_contact` `C`
        JOIN `civicrm_value_1_record_status` `RS` ON ((`C`.`id` = `RS`.`entity_id`)))
    WHERE
        (`RS`.`contact_is_removed` = 1)
    ORDER BY `C`.`display_name`