CREATE TABLE SURFACE_DATA 
(
  ID NUMBER NOT NULL 
, GMLID VARCHAR2(256) 
, NAME VARCHAR2(1000) 
, NAME_CODESPACE VARCHAR2(4000) 
, DESCRIPTION VARCHAR2(4000) 
, IS_FRONT NUMBER(1, 0) 
, OBJECTCLASS_ID NUMBER 
, X3D_SHININESS BINARY_DOUBLE 
, X3D_TRANSPARENCY BINARY_DOUBLE 
, X3D_AMBIENT_INTENSITY BINARY_DOUBLE 
, X3D_SPECULAR_COLOR VARCHAR2(256) 
, X3D_DIFFUSE_COLOR VARCHAR2(256) 
, X3D_EMISSIVE_COLOR VARCHAR2(256) 
, X3D_IS_SMOOTH NUMBER(1, 0) 
, TEX_IMAGE_ID NUMBER 
, TEX_TEXTURE_TYPE VARCHAR2(256) 
, TEX_WRAP_MODE VARCHAR2(256) 
, TEX_BORDER_COLOR VARCHAR2(256) 
, GT_PREFER_WORLDFILE NUMBER(1, 0) 
, GT_ORIENTATION VARCHAR2(256) 
, GT_REFERENCE_POINT MDSYS.SDO_GEOMETRY 
, CONSTRAINT SURFACE_DATA_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SURFACE_DATA_PK ON SURFACE_DATA (ID ASC) 
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

CREATE INDEX SURFACE_DATA_FKX1 ON SURFACE_DATA (TEX_IMAGE_ID ASC);

CREATE INDEX SURFACE_DATA_FKX2 ON SURFACE_DATA (OBJECTCLASS_ID ASC);

CREATE UNIQUE INDEX SURFACE_DATA_INX ON SURFACE_DATA (GMLID ASC) 
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

CREATE INDEX SURFACE_DATA_SPX ON SURFACE_DATA (GT_REFERENCE_POINT) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

ALTER TABLE SURFACE_DATA
ADD CONSTRAINT SURF_DATA_OBJCLASS_FK2 FOREIGN KEY
(
  OBJECTCLASS_ID 
)
REFERENCES OBJECTCLASS
(
  ID 
)
ENABLE;

ALTER TABLE SURFACE_DATA
ADD CONSTRAINT SURF_DATA_TEX_IMAGE_FK1 FOREIGN KEY
(
  TEX_IMAGE_ID 
)
REFERENCES TEX_IMAGE
(
  ID 
)
ENABLE;
