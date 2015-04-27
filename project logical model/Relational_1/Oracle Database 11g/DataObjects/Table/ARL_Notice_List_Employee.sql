CREATE TABLE ARL_Notice_List_Employee
  (
    emp_id                INTEGER NOT NULL ,
    emp_name              VARCHAR2 (255) ,
    emp_lab               VARCHAR2 (255) ,
    emp_division          INTEGER ,
    emp_status            VARCHAR2 (255) ,
    status_effective_date DATE
  ) ;
ALTER TABLE ARL_Notice_List_Employee ADD CONSTRAINT ARL_Notice_List_Employee_PK PRIMARY KEY ( emp_id ) ;
