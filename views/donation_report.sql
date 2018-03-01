CREATE VIEW `donation_report` AS
    SELECT 
        `C`.`contact_id` AS `External ID`,
        `C1`.`display_name` AS `Name`,
        `C`.`id` AS `id`,
        `C`.`total_amount` AS `Gift Amount`,
        `C`.`receive_date` AS `Received Date`,
        IFNULL(`P`.`payment_type`, '') AS `Payment Type`,
        'TODO' AS `Contribution OR Soft Credit?`,
        IFNULL(`CN`.`display_name`, '') AS `Soft Credits`,
        'TODO' AS `Soft Credit	For`,
        `F`.`name` AS `Custom Dropdown`,
        `C`.`source` AS `Custom Text Field`,
        IFNULL(`C`.`check_number`, '') AS `Check Number`,
        `C`.`receipt_date` AS `Note Date ?`,
        `N`.`note` AS `Note Text`,
        'TODO' AS `Note Purpose`
    FROM
        ((((((`civicrm_contribution` `C`
        JOIN `civicrm_financial_type` `F` ON ((`C`.`financial_type_id` = `F`.`id`)))
        JOIN `civicrm_contact` `C1` ON ((`C1`.`id` = `C`.`contact_id`)))
        LEFT JOIN `civicrm_contribution_soft` `CR` ON ((`C`.`id` = `CR`.`contribution_id`)))
        LEFT JOIN `civicrm_contact` `CN` ON ((`CN`.`id` = `CR`.`contact_id`)))
        LEFT JOIN `civicrm_note` `N` ON (((`N`.`entity_id` = `C`.`id`)
            AND (`N`.`entity_table` = 'civicrm_contribution'))))
        LEFT JOIN `civicrm__lookup_payment_type` `P` ON ((`C`.`payment_instrument_id` = `P`.`payment_type_id`)))