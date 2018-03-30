CREATE VIEW `notes_for_contributions` AS
    SELECT 
        `CN`.`contact_id` AS `External ID`,
        IFNULL(`N`.`note`, '') AS `Note Text`,
        CAST(`N`.`modified_date` AS DATE) AS `Note Date`,
        IFNULL(`N`.`subject`, '') AS `Note Purpose`,
        `CN`.`id` AS `Contribution ID`,
        `CN`.`receive_date` AS `receive_date`,
        `CN`.`total_amount` AS `total_amount`
    FROM
        (`civicrm_note` `N`
        JOIN `civicrm_contribution` `CN` ON ((`N`.`entity_id` = `CN`.`id`)))
    WHERE
        (`N`.`entity_table` = 'civicrm_contribution')