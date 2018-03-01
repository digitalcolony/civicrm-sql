CREATE VIEW `contact_activity_report_v1` AS
    SELECT 
        `C`.`id` AS `ContactID`,
        `C`.`display_name` AS `display_name`,
        `A`.`id` AS `ActivityID`,
        `A`.`subject` AS `subject`,
        `A`.`activity_date_time` AS `activity_date_time`,
        `A`.`details` AS `details`
    FROM
        ((`civicrm_contact` `C`
        JOIN `civicrm_activity_contact` `AC` ON ((`C`.`id` = `AC`.`contact_id`)))
        JOIN `civicrm_activity` `A` ON ((`AC`.`activity_id` = `A`.`id`)))
    ORDER BY `C`.`id`