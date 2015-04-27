DROP SEQUENCE ARL_Emp_seq ; 

create sequence ARL_Emp_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Emp_PK_trig 
before insert on ARL_Emp
for each row 
begin 
select ARL_Emp_seq.nextval into :new.emp_id from dual; 
end; 
/
alter table ARL_Emp add created date ; 
alter table ARL_Emp add created_by VARCHAR2 (255) ; 
alter table ARL_Emp add row_version_number integer ; 
alter table ARL_Emp add updated date ; 
alter table ARL_Emp add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Emp_AUD_trig 
before insert or update on ARL_Emp 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_NL_seq ; 
create sequence ARL_NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_NL_PK_trig 
before insert on ARL_NL
for each row 
begin 
select ARL_NL_seq.nextval into :new.list_id from dual; 
end; 
/
alter table ARL_NL add created date ; 
alter table ARL_NL add created_by VARCHAR2 (255) ; 
alter table ARL_NL add row_version_number integer ; 
alter table ARL_NL add updated date ; 
alter table ARL_NL add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_NL_AUD_trig 
before insert or update on ARL_NL 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
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
