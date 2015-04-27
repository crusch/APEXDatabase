CREATE TABLE ARL_NL
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
ALTER TABLE ARL_NL ADD CONSTRAINT ARL_NL_PK PRIMARY KEY ( list_id ) ;
