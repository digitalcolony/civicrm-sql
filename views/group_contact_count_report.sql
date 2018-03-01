CREATE VIEW `group_contact_count_report` AS
    SELECT 
        `G`.`id` AS `GroupID`,
        `G`.`title` AS `title`,
        COUNT(`CG`.`group_id`) AS `COUNT(CG.group_id)`
    FROM
        (`civicrm_group` `G`
        LEFT JOIN `civicrm_group_contact` `CG` ON ((`G`.`id` = `CG`.`group_id`)))
    WHERE
        (NOT (`G`.`id` IN (SELECT 
                `bad_group_ids`.`group_id`
            FROM
                `bad_group_ids`)))
    GROUP BY `G`.`id` , `G`.`title`
    ORDER BY COUNT(`CG`.`group_id`) DESC