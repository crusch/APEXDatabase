--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE ARL_List_Members ADD CONSTRAINT ARL_List_Members_ARL_Notice_List_FKv1 FOREIGN KEY ( ARL_Notice_List_list_id1 ) REFERENCES ARL_Notice_List ( list_id ) ;
