CREATE VIEW combined_report AS
SELECT C.id AS 'External ID',
	IF(C.contact_type='Organization','O','I') AS 'Constituent Type',
    '** TODO **' AS 'Org Type',
    IF(C.contact_type='Organization','', C.first_name) AS 'First Name',
    IF(C.contact_type='Organization', C.organization_name, C.last_name) AS 'Last Name',
    '** TODO **' AS 'Religion',
	OV1.label AS 'Name_Suffix',
    C.source AS 'Custom Text Field - Constituent Source',
    DATE(C.created_date) AS 'Timestamp (**created**>',
    DATE(C.modified_date) AS 'Timestamp (**modified**)',
    DATE(CE.FirstCreated) AS 'Original Timestamp',
    '** TODO **' AS 'Custom Dropdown - Legislative District',
    C.nick_name AS 'Nickname'
FROM civicrm_contact C
LEFT OUTER JOIN civicrm_option_value OV1 ON C.suffix_id = OV1.value 
AND OV1.option_group_id = 8 
LEFT OUTER JOIN contact_ebase_created_active CE ON C.id = CE.id
WHERE C.id IN (4500, 9627, 10128, 4906, 10330)