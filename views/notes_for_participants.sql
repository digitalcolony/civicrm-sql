CREATE VIEW `notes_for_participants` AS
    SELECT 
        `P`.`contact_id` AS `External ID`,
        IFNULL(`N`.`note`, '') AS `Note Text`,
        CAST(`N`.`modified_date` AS DATE) AS `Note Date`,
        IFNULL(`N`.`subject`, '') AS `Note Purpose`,
        `E`.`title` AS `Event Title`
    FROM
        ((`civicrm_note` `N`
        JOIN `civicrm_participant` `P` ON ((`N`.`entity_id` = `P`.`id`)))
        JOIN `civicrm_event` `E` ON ((`P`.`event_id` = `E`.`id`)))
    WHERE
        (`N`.`entity_table` = 'civicrm_participant')