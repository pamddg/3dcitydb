CREATE TABLE ROOM 
(
  ID NUMBER NOT NULL 
, CLASS VARCHAR2(256) 
, CLASS_CODESPACE VARCHAR2(4000) 
, FUNCTION VARCHAR2(1000) 
, FUNCTION_CODESPACE VARCHAR2(4000) 
, USAGE VARCHAR2(1000) 
, USAGE_CODESPACE VARCHAR2(4000) 
, BUILDING_ID NUMBER NOT NULL 
, LOD4_MULTI_SURFACE_ID NUMBER 
, LOD4_SOLID_ID NUMBER 
, CONSTRAINT ROOM_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ROOM_PK ON ROOM (ID ASC) 
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

CREATE INDEX ROOM_FKX ON ROOM (BUILDING_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX ROOM_FKX1 ON ROOM (LOD4_SOLID_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX ROOM_FKX2 ON ROOM (LOD4_MULTI_SURFACE_ID ASC);

ALTER TABLE ROOM
ADD CONSTRAINT ROOM_BUILDING_FK FOREIGN KEY
(
  BUILDING_ID 
)
REFERENCES BUILDING
(
  ID 
)
ENABLE;

ALTER TABLE ROOM
ADD CONSTRAINT ROOM_CITYOBJECT_FK FOREIGN KEY
(
  ID 
)
REFERENCES CITYOBJECT
(
  ID 
)
ENABLE;

ALTER TABLE ROOM
ADD CONSTRAINT ROOM_SURFACE_GEOMETRY_FK FOREIGN KEY
(
  LOD4_SOLID_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE ROOM
ADD CONSTRAINT ROOM_SURFACE_GEOMETRY_FK1 FOREIGN KEY
(
  LOD4_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;
