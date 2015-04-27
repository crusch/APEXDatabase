CREATE TABLE ARL_Member_List
  (
    member_list_id          INTEGER NOT NULL ,
    ARL_Notice_List_list_id INTEGER NOT NULL
  ) ;
ALTER TABLE ARL_Member_List ADD CONSTRAINT ARL_Member_List_PK PRIMARY KEY ( member_list_id ) ;
