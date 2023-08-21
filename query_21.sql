--find which quarter is missing for each store.

CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);


--select * from STORES


with cte as (
select Store, 10 - sum(cast(quarter_no as int)) as empty_one
from (
select *, 
right(Quarter, 1) as quarter_no
from STORES) A
group by Store)

select Store, 
'Q' + cast(empty_one as char) as missing_one
from cte