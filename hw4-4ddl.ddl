drop view vwmanager;
drop view vwproj_emp;

CREATE VIEW vwmanager AS
SELECT
person_id 
,name 
,ssnum 
,gender 
,birth_date
, address
, city
, state
, zip
, hire_date
, salary
, bonus
, status
, title
, type
FROM SIM_per;
 
create or replace TRIGGER man_trigger
     FOR insert ON vwmanager
     FOR EACH ROW
BEGIN
     insert into SIM_per(
 person_id 
, name 
, ssnum 
, gender 
, birth_date
, address
, city
, state
, zip
, hire_date
, salary
, status
, title
,rating
, type)
     VALUES ( person_id 
, name 
, ssnum 
, gender 
, birth_date
, address
, city
, state
, zip
, hire_date
, salary
, status
, title
, :new.rating
, type) ;
END;
 
CREATE VIEW vwproj_emp AS
SELECT
person_id 
,name 
,ssnum 
,gender 
,birth_date
, address
, city
, state
, zip
, hire_date
,  rating
, salary
, status
, title
, type
FROM
SIM_per;



create or replace TRIGGER projemp_trigger
     FOR insert ON vwproj_emp
     FOR EACH ROW
BEGIN
     insert into SIM_per(person_id 
, name 
, ssnum 
, gender 
, birth_date
, address
, city
, state
, zip
, hire_date
, rating
, salary
, status
, title
, type)
     VALUES (person_id 
, name 
, ssnum 
, gender 
, birth_date
, address
, city
, state
, zip
, hire_date
, :new.rating
, salary
, status
, title
, type
	 ) ;
END;