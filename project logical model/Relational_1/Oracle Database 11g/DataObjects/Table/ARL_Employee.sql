CREATE TABLE ARL_Employee
  (
    emp_id          INTEGER NOT NULL ,
    emp_name        VARCHAR2 (255) ,
    emp_lab         VARCHAR2 (255) ,
    emp_division    INTEGER ,
    emp_status      VARCHAR2 (255) ,
    status_eff_date DATE ,
    is_admin        VARCHAR2 (1)
  ) ;
ALTER TABLE ARL_Employee ADD CONSTRAINT ARL_Employee_PK PRIMARY KEY ( emp_id ) ;
