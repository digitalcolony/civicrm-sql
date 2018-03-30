CREATE VIEW `notes_for_relationships` AS
    SELECT 
        `R`.`contact_id_a` AS `External ID`,
        `C1`.`display_name` AS `Person 1`,
        `R`.`contact_id_b` AS `Connected ID`,
        `C2`.`display_name` AS `Person 2`,
        IFNULL(`RT`.`description`, '-') AS `Relationship Description`,
        IFNULL(`N`.`note`, '') AS `Note Text`,
        CAST(`N`.`modified_date` AS DATE) AS `Note Date`,
        IFNULL(`N`.`subject`, '') AS `Note Purpose`
    FROM
        ((((`civicrm_note` `N`
        JOIN `civicrm_relationship` `R` ON ((`N`.`entity_id` = `R`.`id`)))
        JOIN `civicrm_contact` `C1` ON ((`C1`.`id` = `R`.`contact_id_a`)))
        JOIN `civicrm_contact` `C2` ON ((`C2`.`id` = `R`.`contact_id_b`)))
        JOIN `civicrm_relationship_type` `RT` ON ((`RT`.`id` = `R`.`relationship_type_id`)))
    WHERE
        (`N`.`entity_table` = 'civicrm_relationship')