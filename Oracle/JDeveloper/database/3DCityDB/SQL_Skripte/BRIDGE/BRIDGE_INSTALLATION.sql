CREATE TABLE BRIDGE_INSTALLATION 
(
  ID NUMBER NOT NULL 
, IS_EXTERNAL NUMBER(1, 0) 
, CLASS VARCHAR2(256) 
, CLASS_CODESPACE VARCHAR2(4000) 
, FUNCTION VARCHAR2(1000) 
, FUNCTION_CODESPACE VARCHAR2(4000) 
, USAGE VARCHAR2(1000) 
, USAGE_CODESPACE VARCHAR2(4000) 
, BRIDGE_ID NUMBER 
, BRIDGE_ROOM_ID NUMBER 
, LOD2_IMPLICIT_REP_ID NUMBER 
, LOD2_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD2_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD3_IMPLICIT_REP_ID NUMBER 
, LOD3_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD3_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD4_IMPLICIT_REP_ID NUMBER 
, LOD4_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD4_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD2_BREP_ID NUMBER 
, LOD3_BREP_ID NUMBER 
, LOD4_BREP_ID NUMBER 
, LOD2_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD3_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD4_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, CONSTRAINT BRIDGE_INSTALLATION_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX BRIDGE_INSTALLATION_PK ON BRIDGE_INSTALLATION (ID ASC) 
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
);

CREATE INDEX BRD_INST_LOD2OTHER_SPX ON BRIDGE_INSTALLATION (LOD2_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_INST_LOD2REFPT_SPX ON BRIDGE_INSTALLATION (LOD2_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_INST_LOD3OTHER_SPX ON BRIDGE_INSTALLATION (LOD3_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_INST_LOD3REFPT_SPX ON BRIDGE_INSTALLATION (LOD3_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_INST_LOD4OTHER_SPX ON BRIDGE_INSTALLATION (LOD4_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_INST_LOD4REFPT_SPX ON BRIDGE_INSTALLATION (LOD4_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRIDGE_INSTALLATION_FKX ON BRIDGE_INSTALLATION (LOD3_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRIDGE_INSTALLATION_FKX1 ON BRIDGE_INSTALLATION (BRIDGE_ROOM_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRIDGE_INSTALLATION_FKX2 ON BRIDGE_INSTALLATION (LOD4_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRIDGE_INSTALLATION_FKX3 ON BRIDGE_INSTALLATION (LOD2_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRIDGE_INSTALLATION_FKX4 ON BRIDGE_INSTALLATION (BRIDGE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRIDGE_INSTALLATION_FKX5 ON BRIDGE_INSTALLATION (LOD2_IMPLICIT_REP_ID ASC);

CREATE INDEX BRIDGE_INSTALLATION_FKX6 ON BRIDGE_INSTALLATION (LOD3_IMPLICIT_REP_ID ASC);

CREATE INDEX BRIDGE_INSTALLATION_FKX7 ON BRIDGE_INSTALLATION (LOD4_IMPLICIT_REP_ID ASC);

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK FOREIGN KEY
(
  ID 
)
REFERENCES CITYOBJECT
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK1 FOREIGN KEY
(
  BRIDGE_ID 
)
REFERENCES BRIDGE
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK2 FOREIGN KEY
(
  LOD2_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK3 FOREIGN KEY
(
  LOD3_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK4 FOREIGN KEY
(
  LOD4_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK5 FOREIGN KEY
(
  LOD2_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK6 FOREIGN KEY
(
  LOD3_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_FK7 FOREIGN KEY
(
  LOD4_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRIDGE_INSTALLATION
ADD CONSTRAINT BRIDGE_INSTALLATION_ROOM_FK FOREIGN KEY
(
  BRIDGE_ROOM_ID 
)
REFERENCES BRIDGE_ROOM
(
  ID 
)
ENABLE;
