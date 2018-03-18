CREATE VIEW `contact_activity_report_v4` AS
    SELECT 
        `C`.`id` AS `ContactID`,
        `C`.`display_name` AS `display_name`,
        `A`.`id` AS `ActivityID`,
        CAST(`A`.`activity_date_time` AS DATE) AS `Date`,
        CONCAT(IFNULL(`V`.`label`, ''),
                ': ',
                IFNULL(`A`.`subject`, ''),
                ': ',
                IFNULL(`A`.`details`, '')) AS `Note`
    FROM
        (((`civicrm_contact` `C`
        JOIN `civicrm_activity_contact` `AC` ON ((`C`.`id` = `AC`.`contact_id`)))
        JOIN `civicrm_activity` `A` ON ((`AC`.`activity_id` = `A`.`id`)))
        JOIN `civicrm_option_value` `V` ON (((`A`.`activity_type_id` = `V`.`value`)
            AND (`V`.`option_group_id` = 3))))
    WHERE
        ((`V`.`value` NOT IN (6 , 7, 8, 45, 46))
            AND (`A`.`subject` <> 'bouncing'))
    ORDER BY `C`.`id`