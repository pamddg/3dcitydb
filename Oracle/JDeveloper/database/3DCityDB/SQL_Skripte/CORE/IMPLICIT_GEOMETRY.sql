CREATE TABLE IMPLICIT_GEOMETRY 
(
  ID NUMBER NOT NULL 
, MIME_TYPE VARCHAR2(256) 
, REFERENCE_TO_LIBRARY VARCHAR2(4000) 
, LIBRARY_OBJECT BLOB 
, RELATIVE_BREP_ID NUMBER 
, RELATIVE_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, CONSTRAINT IMPLICIT_GEOMETRY_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX IMPLICIT_GEOMETRY_PK ON IMPLICIT_GEOMETRY (ID ASC) 
      LOGGING 
      TABLESPACE "USERS" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
LOB (LIBRARY_OBJECT) STORE AS SYS_LOB0000115549C00004$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  RETENTION 
  NOCACHE 
  LOGGING 
  STORAGE 
  ( 
    BUFFER_POOL DEFAULT 
  )  
);

CREATE INDEX IMPLICIT_GEOMETRY_FKX ON IMPLICIT_GEOMETRY (RELATIVE_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX IMPLICIT_GEOMETRY_INX ON IMPLICIT_GEOMETRY (REFERENCE_TO_LIBRARY ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX IMPLICIT_GEOM_OTHER_SPX ON IMPLICIT_GEOMETRY (RELATIVE_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

ALTER TABLE IMPLICIT_GEOMETRY
ADD CONSTRAINT IMPLICIT_GEOMETRY_FK FOREIGN KEY
(
  RELATIVE_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;
