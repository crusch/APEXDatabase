DROP SEQUENCE ARL_Emp_seq ; 
create sequence ARL_Emp_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Emp_PK_trig 
; 

create or replace trigger ARL_Emp_PK_trig 
before insert on ARL_Emp
for each row 
begin 
select ARL_Emp_seq.nextval into :new.emp_id from dual; 
end; 
/

DROP SEQUENCE ARL_NL_seq ; 
create sequence ARL_NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_NL_PK_trig 
; 

create or replace trigger ARL_NL_PK_trig 
before insert on ARL_NL
for each row 
begin 
select ARL_NL_seq.nextval into :new.list_id from dual; 
end; 
/

DROP INDEX ARL_Emp_emp_id_FK_0 ;
CREATE INDEX ARL_Emp_emp_id_FK_0 ON ARL_File(ARL_Emp_emp_id) ;
DROP INDEX ARL_NL_EID_FK_1 ;
CREATE INDEX ARL_NL_EID_FK_1 ON ARL_List_Members(ARL_NL_EID) ;
DROP INDEX ARL_NL_LID_FK_2 ;
CREATE INDEX ARL_NL_LID_FK_2 ON ARL_List_Members(ARL_NL_LID) ;
DROP INDEX ARL_NL_MLID_FK_3 ;
CREATE INDEX ARL_NL_MLID_FK_3 ON ARL_List_Members(ARL_NL_MLID) ;
