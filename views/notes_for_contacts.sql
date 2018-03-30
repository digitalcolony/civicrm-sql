CREATE VIEW `notes_for_contacts` AS
    SELECT 
        `N`.`entity_id` AS `External ID`,
        `N`.`note` AS `Note Text`,
        CAST(`N`.`modified_date` AS DATE) AS `Note Date`,
        IFNULL(`N`.`subject`, '') AS `Note Purpose`
    FROM
        (`civicrm_note` `N`
        JOIN `civicrm_contact` `C` ON ((`N`.`entity_id` = `C`.`id`)))
    WHERE
        (`N`.`entity_table` = 'civicrm_contact')