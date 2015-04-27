CREATE TABLE ARL_Notice_List
  (
    list_id          INTEGER NOT NULL ,
    list_name        VARCHAR2 (255) ,
    list_description VARCHAR2 (4000) ,
    owner_div_code   INTEGER ,
    extl_view_name   VARCHAR2 (255) ,
    list_status      VARCHAR2 (255) ,
    creation_date    DATE ,
    status_eff_date  DATE
  ) ;
ALTER TABLE ARL_Notice_List ADD CONSTRAINT ARL_Notice_List_PK PRIMARY KEY ( list_id ) ;
