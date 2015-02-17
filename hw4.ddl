-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-02-16 20:45:05 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE SIM_Department CASCADE CONSTRAINTS ;

DROP TABLE SIM_Person CASCADE CONSTRAINTS ;

DROP TABLE SIM_Project CASCADE CONSTRAINTS ;

DROP TABLE SIM_project_person CASCADE CONSTRAINTS ;

CREATE TABLE SIM_Department
  (
    dept_id  INTEGER NOT NULL ,
    name     VARCHAR2 (255) ,
    location VARCHAR2 (255)
  ) ;
ALTER TABLE SIM_Department ADD CONSTRAINT SIM_Department_PK PRIMARY KEY ( dept_id ) ;

CREATE TABLE SIM_Person
  (
    person_id               INTEGER NOT NULL ,
    type                    VARCHAR2 (255) ,
    name                    VARCHAR2 (255) ,
    ssnum                   INTEGER ,
    gender                  VARCHAR2 (255) ,
    birth_date              DATE ,
    address                 VARCHAR2 (255) ,
    city                    VARCHAR2 (255) ,
    state                   VARCHAR2 (255) ,
    zip                     INTEGER ,
    hire_date               DATE ,
    salary                  INTEGER ,
    status                  VARCHAR2 (255) ,
    title                   VARCHAR2 (255) ,
    rating                  VARCHAR2 (255) ,
    bonus                   INTEGER ,
    SIM_Department_dept_id  INTEGER NOT NULL ,
    SIM_Department_dept_id2 INTEGER ,
    emp_id                  INTEGER
  ) ;
CREATE UNIQUE INDEX SIM_Person__IDX ON SIM_Person
  (
    SIM_Department_dept_id ASC
  )
  ;
  ALTER TABLE SIM_Person ADD CONSTRAINT SIM_Person_PK PRIMARY KEY ( person_id ) ;

CREATE TABLE SIM_Project
  (
    project_id             INTEGER NOT NULL ,
    name                   VARCHAR2 (255) ,
    SIM_Department_dept_id INTEGER
  ) ;
ALTER TABLE SIM_Project ADD CONSTRAINT SIM_Project_PK PRIMARY KEY ( project_id ) ;

CREATE TABLE SIM_project_person
  (
    SIM_Project_project_id INTEGER NOT NULL ,
    SIM_Person_person_id   INTEGER NOT NULL
  ) ;
ALTER TABLE SIM_project_person ADD CONSTRAINT r2_PK PRIMARY KEY ( SIM_Project_project_id, SIM_Person_person_id ) ;

ALTER TABLE SIM_project_person ADD CONSTRAINT FK_ASS_3 FOREIGN KEY ( SIM_Project_project_id ) REFERENCES SIM_Project ( project_id ) ;

ALTER TABLE SIM_project_person ADD CONSTRAINT FK_ASS_4 FOREIGN KEY ( SIM_Person_person_id ) REFERENCES SIM_Person ( person_id ) ;

ALTER TABLE SIM_Person ADD CONSTRAINT SIM_Person_SIM_Department_FK FOREIGN KEY ( SIM_Department_dept_id ) REFERENCES SIM_Department ( dept_id ) ;

ALTER TABLE SIM_Person ADD CONSTRAINT SIM_Person_SIM_Department_FKv2 FOREIGN KEY ( SIM_Department_dept_id2 ) REFERENCES SIM_Department ( dept_id ) ;

ALTER TABLE SIM_Project ADD CONSTRAINT SIM_Project_SIM_Department_FK FOREIGN KEY ( SIM_Department_dept_id ) REFERENCES SIM_Department ( dept_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             1
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
