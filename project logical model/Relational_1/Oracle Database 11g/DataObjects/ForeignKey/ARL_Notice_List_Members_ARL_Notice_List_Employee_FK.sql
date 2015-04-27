--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE ARL_Notice_List_Members ADD CONSTRAINT ARL_Notice_List_Members_ARL_Notice_List_Employee_FK FOREIGN KEY ( ARL_Notice_List_Employee_emp_id ) REFERENCES ARL_Notice_List_Employee ( emp_id ) ;
