CREATE TABLE ARL_Notice_List_File
  (
    --  ERROR: Column name length exceeds maximum allowed length(30)
    ARL_Notice_List_Employee_emp_id INTEGER NOT NULL ,
    filename                        VARCHAR2 (255) ,
    file_description                VARCHAR2 (255) ,
    "date"                          DATE ,
    "file" BLOB
  ) ;
