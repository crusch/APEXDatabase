CREATE TABLE ARL_File
  (
    ARL_Emp_emp_id INTEGER NOT NULL ,
    filename       VARCHAR2 (255) ,
    file_desc      VARCHAR2 (255) ,
    "date"         DATE ,
    "file" BLOB
  ) ;
