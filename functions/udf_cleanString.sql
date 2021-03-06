CREATE FUNCTION 
    `udf_cleanString`(`in_str` varchar(4096)) RETURNS varchar(4096) CHARSET utf8
BEGIN 
/** 
 * Function will strip all non-ASCII and unwanted ASCII characters in string 
 * 
 * @author Shay Anderson 10.11 
 * 
 * @param VARCHAR in_arg 
 * @return VARCHAR 
 */ 
      DECLARE out_str VARCHAR(4096) DEFAULT ''; 
      DECLARE c VARCHAR(4096) DEFAULT ''; 
      DECLARE pointer INT DEFAULT 1; 

      IF ISNULL(in_str) THEN 
            RETURN NULL; 
      ELSE 
            WHILE pointer <= LENGTH(in_str) DO 
                   
                  SET c = MID(in_str, pointer, 1); 

                  IF ASCII(c) > 31 AND ASCII(c) < 127 THEN 
                        SET out_str = CONCAT(out_str, c); 
                  END IF; 

                  SET pointer = pointer + 1; 
            END WHILE; 
      END IF; 

      RETURN out_str; 
END