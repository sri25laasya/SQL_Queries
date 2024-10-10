create database test_db_poc;

use test_db_poc;
create table if not exists large_table(
id int auto_increment primary key,
name varchar(50),
value INT
);

DELIMITER //
CREATE procedure INSERT_MILLION_RECORDS()
BEGIN
  declare i int default 0;
  while i <100000 do
      insert into large_table(name,value) values(concat('Name',i),floor(1 + RAND()*100000));
      set i=i+1;
  end while;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS INSERT_MILLION_RECORDS;

SHOW procedure status WHERE DB ='test_db_poc';
select count(*) from large_table;
CALL INSERT_MILLION_RECORDS();

select sql_no_cache sum(value) from large_table 
select  sum(value) from large_table 

create index idx_value on large_table(value)
SELECT * FROM large_table
alter table large_table drop index idx_value
select * from large_table

select a.value
from large_table a
cross join large_table b 
on a.value=b.value*100

SHOW VARIABLES LIKE 'innodb_page_size';
CREATE TABLESPACE my_ts 
    ADD DATAFILE 'my_ts.ibd' 
    ENGINE=InnoDB 
    DATAFILESIZE = 50M 
    INITIAL_SIZE = 50M 
    FILE_BLOCK_SIZE = 32K;  -- Specifying a page size of 32 KB
