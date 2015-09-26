DROP TABLE  criminals CASCADE CONSTRAINTS;
DROP TABLE  crimes CASCADE CONSTRAINTS;
CREATE TABLE criminals
  (criminal_id NUMBER(6),
   last VARCHAR2(15),
   first VARCHAR2(10),
   street VARCHAR2(30),
   city VARCHAR2(20),
   state CHAR(2),
   zip CHAR(5),
   phone CHAR(10),
   v_status CHAR(1) DEFAULT 'N',
   p_status CHAR(1) DEFAULT 'N' );
CREATE TABLE crimes
  (crime_id NUMBER(9),
   criminal_id NUMBER(6),
   classification CHAR(1),
   date_charged DATE,
   status CHAR(2),
   hearing_date DATE,
   appeal_cut_date DATE);
ALTER TABLE crimes
  MODIFY (classification DEFAULT 'U');
ALTER TABLE crimes
  ADD (date_recorded DATE DEFAULT SYSDATE);
ALTER TABLE criminals
  ADD CONSTRAINT criminals_id_pk PRIMARY KEY (criminal_id);
ALTER TABLE criminals
  ADD CONSTRAINT criminals_vstatus_ck CHECK (v_status IN('Y','N'));
ALTER TABLE criminals
  ADD CONSTRAINT criminals_pstatus_ck CHECK (p_status IN('Y','N'));
ALTER TABLE crimes
  ADD CONSTRAINT crimes_id_pk PRIMARY KEY (crime_id);
ALTER TABLE crimes
  ADD CONSTRAINT crimes_class_ck CHECK (classification IN('F','M','O','U'));
ALTER TABLE crimes
  ADD CONSTRAINT crimes_status_ck CHECK (status IN('CL','CA','IA'));
ALTER TABLE crimes
  ADD CONSTRAINT crimes_criminalid_fk FOREIGN KEY (criminal_id)
             REFERENCES criminals(criminal_id);
ALTER TABLE crimes
  MODIFY (criminal_id NOT NULL);
