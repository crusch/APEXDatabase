DROP SEQUENCE SIM_dept_seq ; 
create sequence SIM_dept_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_dept_PK_trig 
; 

create or replace trigger SIM_dept_PK_trig 
before insert on SIM_dept
for each row 
begin 
select SIM_dept_seq.nextval into :new.dept_id from dual; 
end; 
/

DROP SEQUENCE SIM_per_seq ; 
create sequence SIM_per_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_per_PK_trig 
; 

create or replace trigger SIM_per_PK_trig 
before insert on SIM_per
for each row 
begin 
select SIM_per_seq.nextval into :new.person_id from dual; 
end; 
/

DROP SEQUENCE SIM_proj_seq ; 
create sequence SIM_proj_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_proj_PK_trig 
; 

create or replace trigger SIM_proj_PK_trig 
before insert on SIM_proj
for each row 
begin 
select SIM_proj_seq.nextval into :new.project_id from dual; 
end; 
/

DROP SEQUENCE SIM_rel_seq ; 
create sequence SIM_rel_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_rel_PK_trig 
; 

create or replace trigger SIM_rel_PK_trig 
before insert on SIM_rel
for each row 
begin 
select SIM_rel_seq.nextval into :new.per_proj from dual; 
end; 
/

DROP INDEX SIM_per_person_id_FK_0 ;
CREATE INDEX SIM_per_person_id_FK_0 ON SIM_dept(SIM_per_person_id) ;
DROP INDEX SIM_dept_dept_id_FK_1 ;
CREATE INDEX SIM_dept_dept_id_FK_1 ON SIM_per(SIM_dept_dept_id) ;
DROP INDEX SIM_dept_dept_id1_FK_2 ;
CREATE INDEX SIM_dept_dept_id1_FK_2 ON SIM_per(SIM_dept_dept_id1) ;
DROP INDEX SIM_dept_dept_id_FK_3 ;
CREATE INDEX SIM_dept_dept_id_FK_3 ON SIM_proj(SIM_dept_dept_id) ;
DROP INDEX SIM_per_person_id_FK_4 ;
CREATE INDEX SIM_per_person_id_FK_4 ON SIM_rel(SIM_per_person_id) ;
DROP INDEX SIM_proj_project_id_FK_5 ;
CREATE INDEX SIM_proj_project_id_FK_5 ON SIM_rel(SIM_proj_project_id) ;
