-- exercise1: acquired lock by using the read commited isolation level 

-- 1. open SQL serve management
-- 2. referred to as connection 1

--- connection 1: session ID: <put  @@SPID result here>

SELECT @@SPID;
go 

CREATE DATABASE testDB;
go 

use testDB;
go 

create SCHEMA test;
go 

CREATE TABLE test.testTable(
       col1 int not NULL,
       col2 int not NULL
);

INSERT test.testTable (col1, col2) VALUES (1, 10);
INSERT test.testTable (col1, col2) VALUES (2, 10);
INSERT test.testTable (col1, col2) VALUES (3, 10);
INSERT test.testTable (col1, col2) VALUES (4, 10);
INSERT test.testTable (col1, col2) VALUES (5, 10);
INSERT test.testTable (col1, col2) VALUES (6, 10);

--3: connection 2 : session ID: <put @@SPID result here>

SELECT @@SPID;
go 
use testDB;

-- 4: connection 3 :  session ID: <put @@SPID result here>
use testDB;

-- 5: connection 1: start a trans and read a row from testtable

set TRANSACTION isolation  level READ COMMITTED;
begin tran;
   select * from test.testTable
   where col1= 1;


--6 : lock have been acquired by the trans in conn1, open conn3 and exe
--    <$$SPID of connection 1>: id value return
SELECT 
   resource_type, 
   request_mode, 
   request_status
from sys.dm_tran_locks
WHERE resource_database_id = DB_ID('testDB')
      and request_session_id = <@@SPID of connection 1> 
      and request_mode in ('S', 'X')
      and resource_type <> 'DATABASE';
-- 
--  7: conn1 
COMMIT tran;

-- 8:connect2: exe sql statements to start a trans and acquire an exclusive
begin TRAN;
   update test.TestTable set col2  = col2 + 1
   WHERE col1 = 1;

-- 9: in conn1 exe trans to try read the row updated (not committed) by conn2
-- next step, will now ve blocked

set TRANSACTION isolation level read COMMITTED;
begin tran;
    select * from test.TestTable
    WHERE col1 = 1;
-- this select statement will be blocked


-- 10 : locks by trans in conn1, open conn3 and execute select
SELECT 
   resource_type, 
   request_mode, 
   request_status
from sys.dm_tran_locks
WHERE resource_database_id = DB_ID('testDB')
      and request_session_id = <@@SPID of connection 1> 
      and request_mode in ('S', 'X')
      and resource_type <> 'DATABASE';
-- 11: conn2 
  commit tran;

-- 12:conn1 select has been completed. switch to  conn3, and exe select again 
-- to see which locks are now acquired by conn1

SELECT 
   resource_type, 
   request_mode, 
   request_status
from sys.dm_tran_locks
WHERE resource_database_id = DB_ID('testDB')
      and request_session_id = <@@SPID of connection 1> 
      and request_mode in ('S', 'X')
      and resource_type <> 'DATABASE';
-- 
-- 13: close connections and exe code below
 use master;
 drop database testDB;

---------------------------------------------------------------------------
-- excercise2: acquired locj by using read commited snapshot isolation level 
-- 1: open msSQL
-- 2: create

CREATE DATABASE testDB;
go 

alter database testDB set READ_COMMITTED_SNAPSHOT on;
GO

use testDB;
go 

create SCHEMA test;
go 

CREATE TABLE test.testTable(
       col1 int not NULL,
       col2 int not NULL
);

INSERT test.testTable (col1, col2) VALUES (1, 10);
INSERT test.testTable (col1, col2) VALUES (2, 10);
INSERT test.testTable (col1, col2) VALUES (3, 10);
INSERT test.testTable (col1, col2) VALUES (4, 10);
INSERT test.testTable (col1, col2) VALUES (5, 10);
INSERT test.testTable (col1, col2) VALUES (6, 10);

-- 3: new window to conn2 and exe below
use testDB;


-- 4: new window to conn3 and exe below
use testDB;
-- 5: conn2 : start trans and acquired an exclusise lock on one row
begin TRAN;
   UPDATE  test.testTable set col2 = col2 + 1
   WHERE col1= 1
;
-- 6 (conn1) : exe trans to try read the row has been updated but not commite
SET TRANSACTION ISOLATION  level READ COMMITTED;
begin tran;
    select * from test.testTable
    where col1 = 1;
-- 7: conn3
   select 
      resource_type, 
      request_mode, 
      request_status
from sys.dm_tran_locks
WHERE resource_database_id = DB_ID('testDB')
      and request_mode in('S', 'X')
      and resource_type <> 'DATABASE';
-- 8 : conn3
   select * from sys.dm_tran_version_store
   WHERE database_id = DB_ID('testDB');

-- 9 : conn2 : 
   commit tran;
--10 : conn1
  SELECT * from test.testTable 
  WHERE col1 = 1;
--11: close conn 
------------------------------
-- ## thiết kế giao dịch và quản lý các khóa trong giao dịch
--excercise1: use default isolation level 
