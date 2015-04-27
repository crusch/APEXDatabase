--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE ARL_List_Members ADD CONSTRAINT ARL_List_Members_ARL_Notice_List_FK FOREIGN KEY ( ARL_Notice_List_list_id ) REFERENCES ARL_NL ( list_id ) ;
