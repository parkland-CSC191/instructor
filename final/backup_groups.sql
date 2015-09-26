use fpatel3;
-- drop table final_master_temp;
-- drop table final_assignment_temp;
create table final_master_temp as (select * from  2015_master);
create table final_assignment_temp as (select * from  2015_applicant);
