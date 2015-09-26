update lottery set ch2prg = 'RE' where ch2sch in (15,16,17) and ch2prg = 'ESL';
update lottery set ch3prg = 'RE' where ch3sch in (9,10) and ch3prg = 'ESL';
update lottery set ch4prg = 'RE' where ch4sch in (18,16,11) and ch4prg = 'ESL';

commit;

delete from 2012_choice;
delete from 2012_applicant;

insert into `2012_applicant` (select stidn, asgsch, asgprg from `lottery`);
insert into `2012_choice` (select stidn, 1, ch1sch, ifnull(ch1prg,''), ch1stat, ch1prxa from `lottery` where ch1sch is not null and ch1sch > 0);
insert into `2012_choice` (select stidn, 2, ch2sch, ifnull(ch2prg,''), ch2stat, ch1prxa from `lottery` where ch2sch is not null and ch2sch > 0);
insert into `2012_choice` (select stidn, 3, ch3sch, ifnull(ch3prg,''), ch3stat, ch1prxa from `lottery` where ch3sch is not null and ch3sch > 0);
insert into `2012_choice` (select stidn, 4, ch4sch, ifnull(ch4prg,''), null, ch1prxa from `lottery` where ch4sch is not null and ch4sch > 0);
insert into `2012_choice` (select stidn, 5, ch5sch, ifnull(ch5prg,''), null, ch1prxa from `lottery` where ch5sch is not null and ch5sch > 0);

