CREATE TABLE SOLITARY_VEGETAT_OBJECT 
(
  ID NUMBER NOT NULL 
, CLASS VARCHAR2(256) 
, CLASS_CODESPACE VARCHAR2(4000) 
, FUNCTION VARCHAR2(1000) 
, FUNCTION_CODESPACE VARCHAR2(4000) 
, USAGE VARCHAR2(1000) 
, USAGE_CODESPACE VARCHAR2(4000) 
, SPECIES VARCHAR2(1000) 
, SPECIES_CODESPACE VARCHAR2(4000) 
, HEIGHT BINARY_DOUBLE 
, TRUNC_DIAMETER BINARY_DOUBLE 
, CROWN_DIAMETER BINARY_DOUBLE 
, LOD1_IMPLICIT_REP_ID NUMBER 
, LOD2_IMPLICIT_REP_ID NUMBER 
, LOD3_IMPLICIT_REP_ID NUMBER 
, LOD4_IMPLICIT_REP_ID NUMBER 
, LOD1_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD2_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD3_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD4_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD1_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD2_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD3_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD4_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD1_BREP_ID NUMBER 
, LOD2_BREP_ID NUMBER 
, LOD3_BREP_ID NUMBER 
, LOD4_BREP_ID NUMBER 
, LOD1_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD2_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD3_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD4_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, CONSTRAINT SOLITARY_VEG_OBJECT_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SOLITARY_VEG_OBJECT_PK ON SOLITARY_VEGETAT_OBJECT (ID ASC) 
      LOGGING 
      TABLESPACE "USERS" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
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
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX1 ON SOLITARY_VEGETAT_OBJECT (LOD1_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX2 ON SOLITARY_VEGETAT_OBJECT (LOD2_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX3 ON SOLITARY_VEGETAT_OBJECT (LOD3_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX4 ON SOLITARY_VEGETAT_OBJECT (LOD4_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX5 ON SOLITARY_VEGETAT_OBJECT (LOD1_IMPLICIT_REP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX6 ON SOLITARY_VEGETAT_OBJECT (LOD2_IMPLICIT_REP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX7 ON SOLITARY_VEGETAT_OBJECT (LOD3_IMPLICIT_REP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOLITARY_VEGETAT_OBJ_FKX8 ON SOLITARY_VEGETAT_OBJECT (LOD4_IMPLICIT_REP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX SOL_VEG_OBJ_LOD1OTHER_SPX ON SOLITARY_VEGETAT_OBJECT (LOD1_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD1REFPT_SPX ON SOLITARY_VEGETAT_OBJECT (LOD1_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD2OTHER_SPX ON SOLITARY_VEGETAT_OBJECT (LOD2_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD2REFPT_SPX ON SOLITARY_VEGETAT_OBJECT (LOD2_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD3OTHER_SPX ON SOLITARY_VEGETAT_OBJECT (LOD3_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD3REFPT_SPX ON SOLITARY_VEGETAT_OBJECT (LOD3_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD4OTHER_SPX ON SOLITARY_VEGETAT_OBJECT (LOD4_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX SOL_VEG_OBJ_LOD4REFPT_SPX ON SOLITARY_VEGETAT_OBJECT (LOD4_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK FOREIGN KEY
(
  ID 
)
REFERENCES CITYOBJECT
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK1 FOREIGN KEY
(
  LOD1_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK2 FOREIGN KEY
(
  LOD2_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK3 FOREIGN KEY
(
  LOD3_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK4 FOREIGN KEY
(
  LOD4_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK5 FOREIGN KEY
(
  LOD1_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK6 FOREIGN KEY
(
  LOD2_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK7 FOREIGN KEY
(
  LOD3_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE SOLITARY_VEGETAT_OBJECT
ADD CONSTRAINT SOLITARY_VEGETAT_OBJECT_FK8 FOREIGN KEY
(
  LOD4_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;
