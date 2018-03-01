CREATE VIEW `contact_group_report` AS
    SELECT 
        `C`.`id` AS `External ID`,
        `C`.`display_name` AS `display_name`,
        `G`.`id` AS `Group ID`,
        `G`.`name` AS `Group`
    FROM
        ((`civicrm_contact` `C`
        JOIN `civicrm_group_contact` `GC` ON ((`C`.`id` = `GC`.`contact_id`)))
        JOIN `civicrm_group` `G` ON ((`G`.`id` = `GC`.`group_id`)))
    WHERE
        (NOT (`G`.`id` IN (SELECT DISTINCT
                `bad_group_ids`.`group_id`
            FROM
                `bad_group_ids`)))