--TRIGGERS DE CONTROL--

--Trigger COD_SOLI_INFSOCIAL_AI--

CREATE OR REPLACE TRIGGER COD_SOLI_INFSOCIAL_AI
AFTER INSERT ON INF_SOCIAL
FOR EACH ROW
BEGIN
  INSERT INTO INF_SOCIAL (cod, as_social_id, fecha_mod)
  VALUES (:NEW.cod, :NEW.as_social_id, SYSDATE);
END;



--Trigger COD_SOLI_INFSOCIAL_AD--

CREATE OR REPLACE TRIGGER COD_SOLI_INFSOCIAL_AD
AFTER DELETE ON INF_SOCIAL
FOR EACH ROW
BEGIN
  DELETE FROM INF_SOCIAL
  WHERE cod = :OLD.cod;
END;


--Trigger COD_SOLI_BENEFICIO_AI--

CREATE OR REPLACE TRIGGER COD_SOLI_BENEFICIO_AI
AFTER INSERT ON BENEFICIO
FOR EACH ROW
BEGIN
  INSERT INTO BENEFICIO (cod, estado, fecha)
  VALUES (:NEW.cod, 'REVISION', SYSDATE);
END;



--Trigger COD_SOLI_BENEFICIO_AD--

CREATE OR REPLACE TRIGGER COD_SOLI_BENEFICIO_AD
AFTER DELETE ON BENEFICIO
FOR EACH ROW
BEGIN
  DELETE FROM BENEFICIO
  WHERE cod = :OLD.cod;
END;



--Trigger COD_SOLI_APELACION_AI--

CREATE OR REPLACE TRIGGER COD_SOLI_APELACION_AI
AFTER INSERT ON APELACION
FOR EACH ROW
BEGIN
  INSERT INTO APELACION (cod, fecha)
  VALUES (:NEW.cod, SYSDATE);
END;



--Trigger COD_SOLI_APELACION_AD--

CREATE OR REPLACE TRIGGER COD_SOLI_APELACION_AD
AFTER DELETE ON APELACION
FOR EACH ROW
BEGIN
  DELETE FROM APELACION
  WHERE cod = :OLD.cod;
END;


--TABLAS Y TRIGGERS DE AUDITORIA--


--Tablas de auditoría--

CREATE TABLE AUD_RUT_SOLICITANTE_AI (
    rut     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_RUT_SOLICITANTE_AD (
    rut     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_ID_AS_SOCIAL_AI (
    id      VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_ID_AS_SOCIAL_AD (
    id      VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_ID_ENCARGADA_FINANZAS_AI (
    id      VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_ID_ENCARGADA_FINANZAS_AD (
    id      VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_ID_EDIL_AI (
    id      VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_ID_EDIL_AD (
    id      VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_COD_INF_SOCIAL_AI (
    cod     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_COD_INF_SOCIAL_AD (
    cod     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_COD_SOLICITUD_AI (
    cod     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_COD_SOLICITUD_AD (
    cod     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_COD_APELACION_AI (
    cod     VARCHAR2(10) NOT NULL,
    fecha   DATE
);

CREATE TABLE AUD_COD_APELACION_AD (
    cod     VARCHAR2(10) NOT NULL,
    fecha   DATE
);


--Triggers de auditoría--

CREATE OR REPLACE TRIGGER AUD_RUT_SOLICITANTE_AI
AFTER INSERT ON SOLICITANTE
FOR EACH ROW
BEGIN
  INSERT INTO AUD_RUT_SOLICITANTE_AI (rut, fecha) VALUES (:NEW.rut, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_RUT_SOLICITANTE_AD
AFTER DELETE ON SOLICITANTE
FOR EACH ROW
BEGIN
  INSERT INTO AUD_RUT_SOLICITANTE_AD (rut, fecha) VALUES (:OLD.rut, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_ID_AS_SOCIAL_AI
AFTER INSERT ON AS_SOCIAL
FOR EACH ROW
BEGIN
  INSERT INTO AUD_ID_AS_SOCIAL_AI (id, fecha) VALUES (:NEW.id, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_ID_AS_SOCIAL_AD
AFTER DELETE ON AS_SOCIAL
FOR EACH ROW
BEGIN
  INSERT INTO AUD_ID_AS_SOCIAL_AD (id, fecha) VALUES (:OLD.id, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_ID_ENCARGADA_FINANZAS_AI
AFTER INSERT ON ENCARGADA_FINANZAS
FOR EACH ROW
BEGIN
  INSERT INTO AUD_ID_ENCARGADA_FINANZAS_AI (id, fecha) VALUES (:NEW.id, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_ID_ENCARGADA_FINANZAS_AD
AFTER DELETE ON ENCARGADA_FINANZAS
FOR EACH ROW
BEGIN
  INSERT INTO AUD_ID_ENCARGADA_FINANZAS_AD (id, fecha) VALUES (:OLD.id, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_ID_EDIL_AI
AFTER INSERT ON EDIL
FOR EACH ROW
BEGIN
  INSERT INTO AUD_ID_EDIL_AI (id, fecha) VALUES (:NEW.id, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_ID_EDIL_AD
AFTER DELETE ON EDIL
FOR EACH ROW
BEGIN
  INSERT INTO AUD_ID_EDIL_AD (id, fecha) VALUES (:OLD.id, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_COD_INF_SOCIAL_AI
AFTER INSERT ON INF_SOCIAL
FOR EACH ROW
BEGIN
  INSERT INTO AUD_COD_INF_SOCIAL_AI (cod, fecha) VALUES (:NEW.cod, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_COD_INF_SOCIAL_AD
AFTER DELETE ON INF_SOCIAL
FOR EACH ROW
BEGIN
  INSERT INTO AUD_COD_INF_SOCIAL_AD (cod, fecha) VALUES (:OLD.cod, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_COD_SOLICITUD_AI
AFTER INSERT ON SOLICITUD
FOR EACH ROW
BEGIN
  INSERT INTO AUD_COD_SOLICITUD_AI (cod, fecha) VALUES (:NEW.cod, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_COD_SOLICITUD_AD
AFTER DELETE ON SOLICITUD
FOR EACH ROW
BEGIN
  INSERT INTO AUD_COD_SOLICITUD_AD (cod, fecha) VALUES (:OLD.cod, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_COD_APELACION_AI
AFTER INSERT ON APELACION
FOR EACH ROW
BEGIN
  INSERT INTO AUD_COD_APELACION_AI (cod, fecha) VALUES (:NEW.cod, SYSDATE);
END;

CREATE OR REPLACE TRIGGER AUD_COD_APELACION_AD
AFTER DELETE ON APELACION
FOR EACH ROW
BEGIN
  INSERT INTO AUD_COD_APELACION_AD (cod, fecha) VALUES (:OLD.cod, SYSDATE);
END;

