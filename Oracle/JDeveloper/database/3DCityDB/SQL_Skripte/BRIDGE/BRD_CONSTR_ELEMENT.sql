CREATE TABLE BRD_CONSTR_ELEMENT 
(
  ID NUMBER NOT NULL 
, CLASS VARCHAR2(256) 
, CLASS_CODESPACE VARCHAR2(4000) 
, FUNCTION VARCHAR2(1000) 
, FUNCTION_CODESPACE VARCHAR2(4000) 
, USAGE VARCHAR2(1000) 
, USAGE_CODESPACE VARCHAR2(4000) 
, BRIDGE_ID NUMBER 
, LOD1_IMPLICIT_REP_ID NUMBER 
, LOD1_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD1_IMPLICTI_TRANSFORMATION VARCHAR2(1000) 
, LOD2_IMPLICIT_REP_ID NUMBER 
, LOD2_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD2_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD3_IMPLICIT_REP_ID NUMBER 
, LOD3_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD3_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD4_IMPLICIT_REP_ID NUMBER 
, LOD4_IMPLICIT_REF_POINT MDSYS.SDO_GEOMETRY 
, LOD4_IMPLICIT_TRANSFORMATION VARCHAR2(1000) 
, LOD1_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD2_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD3_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD4_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD1_BREP_ID NUMBER 
, LOD2_BREP_ID NUMBER 
, LOD3_BREP_ID NUMBER 
, LOD4_BREP_ID NUMBER 
, LOD1_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD2_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD3_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, LOD4_OTHER_GEOM MDSYS.SDO_GEOMETRY 
, CONSTRAINT BRIDGE_CONSTRUCTIONELEMENT_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX BRD_CONSTR_ELEMENT_PK ON BRD_CONSTR_ELEMENT (ID ASC) 
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

CREATE INDEX BRD_CONSTR_ELEMENT_FK1 ON BRD_CONSTR_ELEMENT (LOD1_BREP_ID ASC);

CREATE INDEX BRD_CONSTR_ELEMENT_FK2 ON BRD_CONSTR_ELEMENT (LOD4_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_CONSTR_ELEMENT_FK3 ON BRD_CONSTR_ELEMENT (LOD2_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_CONSTR_ELEMENT_FK4 ON BRD_CONSTR_ELEMENT (BRIDGE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_CONSTR_ELEMENT_FK5 ON BRD_CONSTR_ELEMENT (LOD1_IMPLICIT_REP_ID ASC);

CREATE INDEX BRD_CONSTR_ELEMENT_FK6 ON BRD_CONSTR_ELEMENT (LOD2_IMPLICIT_REP_ID ASC);

CREATE INDEX BRD_CONSTR_ELEMENT_FK7 ON BRD_CONSTR_ELEMENT (LOD3_IMPLICIT_REP_ID ASC);

CREATE INDEX BRD_CONSTR_ELEMENT_FK8 ON BRD_CONSTR_ELEMENT (LOD4_IMPLICIT_REP_ID ASC);

CREATE INDEX BRD_CONSTR_ELEMENT_FK9 ON BRD_CONSTR_ELEMENT (LOD3_BREP_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_CONSTR_LOD1OTHER_SPX ON BRD_CONSTR_ELEMENT (LOD1_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD1REFPT_SPX ON BRD_CONSTR_ELEMENT (LOD1_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD1TERR_SPX ON BRD_CONSTR_ELEMENT (LOD1_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD2OTHER_SPX ON BRD_CONSTR_ELEMENT (LOD2_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD2REFPT_SPX ON BRD_CONSTR_ELEMENT (LOD2_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD2TERR_SPX ON BRD_CONSTR_ELEMENT (LOD2_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD3OTHER_SPX ON BRD_CONSTR_ELEMENT (LOD3_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD3REFPT_SPX ON BRD_CONSTR_ELEMENT (LOD3_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD3TERR_SPX ON BRD_CONSTR_ELEMENT (LOD3_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD4OTHER_SPX ON BRD_CONSTR_ELEMENT (LOD4_OTHER_GEOM) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD4REFPT_SPX ON BRD_CONSTR_ELEMENT (LOD4_IMPLICIT_REF_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX BRD_CONSTR_LOD4TERR_SPX ON BRD_CONSTR_ELEMENT (LOD4_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK FOREIGN KEY
(
  ID 
)
REFERENCES CITYOBJECT
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK1 FOREIGN KEY
(
  BRIDGE_ID 
)
REFERENCES BRIDGE
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK2 FOREIGN KEY
(
  LOD1_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK3 FOREIGN KEY
(
  LOD2_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK4 FOREIGN KEY
(
  LOD3_BREP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK5 FOREIGN KEY
(
  LOD4_BREP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK6 FOREIGN KEY
(
  LOD1_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK7 FOREIGN KEY
(
  LOD2_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK8 FOREIGN KEY
(
  LOD3_IMPLICIT_REP_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_CONSTR_ELEMENT
ADD CONSTRAINT BRD_CONSTR_ELEMENT_FK9 FOREIGN KEY
(
  LOD4_IMPLICIT_REP_ID 
)
REFERENCES IMPLICIT_GEOMETRY
(
  ID 
)
ENABLE;
