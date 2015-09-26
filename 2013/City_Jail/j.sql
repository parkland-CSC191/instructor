
CREATE TABLE Crimes
(Crime_ID NUMBER(9),
Criminal_ID NUMBER(6),
Classification CHAR(1),
Data_charged DATE,
Status CHAR(2),
Hearing_date DATE,
Appeal_cut_date DATE);

CREATE TABLE Sentences
(Sentence_ID NUMBER(6),
Criminal_ID NUMBER(6),
Type CHAR(1),
Prob_ID NUMBER(5),
Start_date DATE,
End_date DATE,
Violation NUMBER (3));

Create table Prob_officers( Prod_ID numeric(5), Last varchar2(15), First varchar2(10), Street varchar2(30),
City varchar2(20), State char(2), Zip char(5), Phone char(10), Email varchar2(30), Status char(1) default 'A' );

create table Crime_charges( Charge_ID numeric(10), Crime_ID numeric(9), Crime_code numeric(3), Charge_status char(2),
           Fine_amount numeric(7,2), Court_fee numeric(7,2), Amount_paid numeric(7,2), Pay_due_date Date );

alter table crimes add (Date_Recorded date default sysdate);
Alter table Prob_officers
ADD (Pager# NUMBER(10));

create table Aliases
( Alias_ID Number(6),
Criminal_ID Number(6),
Alias Varchar2(10)
);


create table Criminals
( Criminal_ID Number(6),
Last Varchar2(15),
First Varchar2(10),
Street Varchar2(30),
City varchar2(20),
State char(2),
Zip char(5),
Phone char(10),
V_status char(1) Default 'N',
P_status char(1) Default 'N'
);

Alter table Aliases
modify (Alias varchar2(20));

CREATE TABLE Crime_officers
(Crime_Id NUMBER(9),
Officer_Id NUMBER(8));


create table Officcers
( Officer_Id NUMBER(8),
Last_Name varchar2(15),
First_Name varchar2(10),
Precinct char(4),
Badge varchar2(14),
Phone char(10),
Status char(1) default 'A');

 ALTER TABLE Officcers
      RENAME COLUMN Last_Name TO Last;

ALTER TABLE Officcers
      RENAME COLUMN First_Name TO First;


create table Appeals
( Appeal_Id number(5),
Crime_Id number (9),
Filing_date date,
Hearing_date date,
Status char(1) default 'P' );

create table Crime_codes
(Crime_code number(3),
Code_description Varchar2(30));

ALTER TABLE Crimes
  modify (Classification CHAR default 'U');
