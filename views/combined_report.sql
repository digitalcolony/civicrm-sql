ALTER VIEW combined_report AS 
SELECT 
        `C`.`id` AS `External ID`,
        IF((`C`.`contact_type` = 'Organization'),
            'O',
            'I') AS `Constituent Type`,
        IFNULL(udf_cleanString(V2.organization_flag),'') AS `Org Type`,
        IFNULL(IF((`C`.`contact_type` = 'Organization'),
            '',
            `C`.`first_name`),'') AS `First Name`,
        IF((`C`.`contact_type` = 'Organization'),
            `C`.`organization_name`,
            `C`.`last_name`) AS `Last Name`,
        IFNULL(udf_cleanString(V.religion),'') AS `Religion`,
        IFNULL(OV2.label,'') AS 'Title',
        IFNULL(OV1.label,'') AS `Name_Suffix`,
        IFNULL(C.source,'') AS `Custom Text Field - Constituent Source`,
        CAST(`C`.`modified_date` AS DATE) AS `Timestamp`,
        IFNULL(CAST(`CE`.`FirstCreated` AS DATE),'') AS `Original Timestamp`,
        V3.state_senate_district AS `Custom Dropdown - Legislative District`,
        `C`.`nick_name` AS `Nickname`
    FROM
        ((`civicrm_contact` `C`
        LEFT JOIN `civicrm_option_value` `OV1` ON (((`C`.`suffix_id` = `OV1`.`value`)
            AND (`OV1`.`option_group_id` = 8))))
        LEFT JOIN `civicrm_option_value` `OV2` ON (((`C`.`prefix_id` = `OV2`.`value`)
            AND (`OV2`.`option_group_id` = 7))))    
        LEFT JOIN `contact_ebase_created_active` `CE` ON ((`C`.`id` = `CE`.`id`))
        LEFT JOIN `civicrm_value_1_additional_demographics` `V` ON C.id = V.entity_id
        LEFT JOIN `civicrm_value_1_organizational_information` `V2` ON C.id = V2.entity_id
        LEFT JOIN `civicrm_value_1_legislative_district_in_which_t` `V3` ON C.id = V3.entity_id