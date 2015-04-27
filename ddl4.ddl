ALTER TABLE ARL_LIST_MEMBERS
ADD CONSTRAINT mutual_exclusion_ids CHECK (not (ARL_NL_EID is not null and ARL_NL_MLID is not null))

CREATE OR REPLACE VIEW emp_admin
AS SELECT * from ARL_EMP
WHERE is_admin = 'y' || is_admin = 'Y';

CREATE OR REPLACE VIEW list_members AS
SELECT list_name AS "Member List Name", "Mailing List Name", emp_name AS "Member Employee Name", arl_nl_eid, arl_nl_mlid, arl_nl_lid, date_added 
FROM 
(SELECT list_name AS "Mailing List Name", emp_name, arl_nl_eid, arl_nl_mlid, arl_nl_lid, date_added FROM ARL_NL JOIN 
 (SELECT emp_name, arl_nl_eid, arl_nl_mlid, arl_nl_lid, date_added FROM ARL_LIST_MEMBERS LEFT OUTER JOIN ARL_EMP ON
arl_nl_eid = emp_id) 
 ON list_id = arl_nl_lid)
 LEFT OUTER JOIN ARL_NL ON list_id = arl_nl_mlid;

CREATE OR REPLACE TRIGGER creation_date_trigger 
BEFORE INSERT ON ARL_NL 
FOR EACH ROW 
BEGIN 
   :NEW.list_status = 'A';
   :NEW.creation_date := sysdate; 
END;
/

CREATE OR REPLACE TRIGGER stats_eff_emp_trigger 
BEFORE INSERT OR UPDATE OF emp_status 
ON ARL_Emp 
FOR EACH ROW 
BEGIN 
   :NEW.status_eff_date := sysdate; 
END;
/

CREATE OR REPLACE TRIGGER stats_eff_list_trigger 
BEFORE INSERT OR UPDATE OF list_status 
ON ARL_NL 
FOR EACH ROW 
BEGIN 
   :NEW.status_eff_date := sysdate; 
END;
/

CREATE OR REPLACE TRIGGER list_add_trigger 
BEFORE INSERT ON ARL_List_Members 
FOR EACH ROW 
BEGIN 
   :NEW.date_added := sysdate; 
END;
/

create or replace TRIGGER check_list_status_trigger 
BEFORE INSERT ON ARL_List_Members
FOR EACH ROW
DECLARE
   inactive_list EXCEPTION;
   mailing_list_status VARCHAR(255);
BEGIN
   SELECT mailing_list_status INTO mailing_list_status FROM
   ARL_List_Members JOIN ARL_NL ON list_id = arl_nl_lid
   WHERE list_id = :NEW.arl_nl_lid;
   IF(mailing_list_status = 'i' OR mailing_list_status = 'I') THEN
      RAISE inactive_list;
      END IF;
EXCEPTION
   WHEN inactive_list THEN
      DBMS_OUTPUT.PUT_LINE('Error: cannot add member to inactive list.');
      ROLLBACK;   
END;
/

CREATE OR REPLACE VIEW lab_divisions AS
SELECT DISTINCT emp_lab, emp_division
FROM ARL_EMP
ORDER BY emp_lab;
/

ALTER TABLE arl_file
DROP COLUMN "date";

ALTER TABLE arl_file
ADD date_added date;

CREATE OR REPLACE TRIGGER file_date
BEFORE UPDATE OR INSERT ON arl_file
FOR EACH ROW
BEGIN
   :NEW.date_added := sysdate;
END;
/

ALTER TABLE arl_file
ADD file_id integer;

CREATE SEQUENCE file_id_seq start with 1 

increment by 1 

nomaxvalue 
;

CREATE OR REPLACE TRIGGER file_id_trigger
BEFORE INSERT ON arl_file
FOR EACH ROW
BEGIN
   :NEW.file_id := file_id_seq.nextval;
END;

CREATE VIEW employee_user AS 
SELECT * FROM (SELECT user_name FROM apex_workspace_apex_users)
JOIN ARL_EMP on user_name = emp_name;

SELECT LIST_ID, LIST_NAME, LIST_DESCRIPTION, OWNER_DIV_CODE, EXTL_VIEW_NAME, 
LIST_STATUS, CREATION_DATE, ARL_NL.STATUS_EFF_DATE
FROM ARL_NL JOIN EMPLOYEE_USER ON EMP_DIVISION = OWNER_DIV_CODE;