-- --------------------------------------------------------------------------------------------------------------------------------------------
-- Loading Data: Data is loaded using 'Table Data Import Wizard' feature of MySQL Workbench as suggested by TA.
-- While loading data, all default settings were selected.
-- --------------------------------------------------------------------------------------------------------------------------------------------
--- create schema 'Assignment'

--create schema Assignment;

-- Using `Assignment` database
USE `Assignment`;

-- If UPDATE / DELETE operation is required to be performed, without using keys
-- SET SQL_SAFE_UPDATES = 0;

-- --------------------------------------------------------------------------------------------------------------------------------------------
-- 0. Exploring the dataset i.e. the structure and some content of each table.
-- --------------------------------------------------------------------------------------------------------------------------------------------
-- Analysing Bajaj Auto table
DESCRIBE `bajaj auto`;
SELECT * 
FROM `bajaj auto`
LIMIT 5;

-- Analysing Eicher Motors table
DESCRIBE `eicher motors`;
SELECT * 
FROM `eicher motors`
LIMIT 5;

-- Analysing Hero Motocorp table
DESCRIBE `hero motocorp`;
SELECT * 
FROM `hero motocorp`
LIMIT 5;

-- Analysing Infosys table
DESCRIBE `infosys`;
SELECT * 
FROM `infosys`
LIMIT 5;

-- Analysing TCS table
DESCRIBE `tcs`;
SELECT * 
FROM `tcs`
LIMIT 5;

-- Analysing TVS Motors table
DESCRIBE `tvs motors`;
SELECT * 
FROM `tvs motors`
LIMIT 5;

-- --------------------------------------------------------------------------------------------------------------------------------------------
---1.Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.
-- Using MySQL function STR_TO_DATE to convert Date format since it is good practice to store date in SQL Date format 

drop table if exists bajaj1; 

CREATE  TABLE `bajaj1` As 
	SELECT 
		str_to_date(`b`.`Date`, "%d-%M-%Y") as `Date`, 
		`Close Price`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 19 PRECEDING) AS `20 Day MA`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 49 PRECEDING) AS `50 Day MA` 
	FROM `bajaj auto` `b`    
	WHERE `Close Price` IS NOT NULL AND `b`.`Date` IS NOT NULL;

-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `bajaj1` 	
ADD PRIMARY KEY (`Date`);

--Create a new table named 'eicher1' containing the date, close price, 20 Day MA and 50 Day MA. 
-- Using MySQL function STR_TO_DATE to convert Date format since it is good practice to store date in SQL Date format

drop table if exists eicher1; 

CREATE  TABLE `eicher1` As 
	SELECT 
		str_to_date(`b`.`Date`, "%d-%M-%Y") as `Date`, 
		`Close Price`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 19 PRECEDING) AS `20 Day MA`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 49 PRECEDING) AS `50 Day MA` 
	FROM `eicher motors` `b`    
	WHERE `Close Price` IS NOT NULL AND `b`.`Date` IS NOT NULL;

-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `eicher1` 	
ADD PRIMARY KEY (`Date`);

--Create a new table named 'hero1' containing the date, close price, 20 Day MA and 50 Day MA. 
-- Using MySQL function STR_TO_DATE to convert Date format since it is good practice to store date in SQL Date format

drop table if exists hero1; 

CREATE  TABLE `hero1` As 
	SELECT 
		str_to_date(`b`.`Date`, "%d-%M-%Y") as `Date`, 
		`Close Price`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 19 PRECEDING) AS `20 Day MA`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 49 PRECEDING) AS `50 Day MA` 
	FROM `hero motocorp` `b`    
	WHERE `Close Price` IS NOT NULL AND `b`.`Date` IS NOT NULL;

-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `hero1` 	
ADD PRIMARY KEY (`Date`);

--Create a new table named 'infosys1' containing the date, close price, 20 Day MA and 50 Day MA.
-- Using MySQL function STR_TO_DATE to convert Date format since it is good practice to store date in SQL Date format 

drop table if exists infosys1; 

CREATE  TABLE `infosys1` As 
	SELECT 
		str_to_date(`b`.`Date`, "%d-%M-%Y") as `Date`, 
		`Close Price`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 19 PRECEDING) AS `20 Day MA`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 49 PRECEDING) AS `50 Day MA` 
	FROM `infosys` `b`    
	WHERE `Close Price` IS NOT NULL AND `b`.`Date` IS NOT NULL;

-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `infosys1` 	
ADD PRIMARY KEY (`Date`);

--Create a new table named 'tcs1' containing the date, close price, 20 Day MA and 50 Day MA. 
-- Using MySQL function STR_TO_DATE to convert Date format since it is good practice to store date in SQL Date format

drop table if exists tcs1; 

CREATE  TABLE `tcs1` As 
	SELECT 
		str_to_date(`b`.`Date`, "%d-%M-%Y") as `Date`, 
		`Close Price`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 19 PRECEDING) AS `20 Day MA`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 49 PRECEDING) AS `50 Day MA` 
	FROM `tcs` `b`    
	WHERE `Close Price` IS NOT NULL AND `b`.`Date` IS NOT NULL;

-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `tcs1` 	
ADD PRIMARY KEY (`Date`);

--Create a new table named 'tvs motors' containing the date, close price, 20 Day MA and 50 Day MA.
-- Using MySQL function STR_TO_DATE to convert Date format since it is good practice to store date in SQL Date format 

drop table if exists tvs1; 

CREATE  TABLE `tvs1` As 
	SELECT 
		str_to_date(`b`.`Date`, "%d-%M-%Y") as `Date`, 
		`Close Price`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 19 PRECEDING) AS `20 Day MA`,  
		AVG(`Close Price`) over (ORDER BY str_to_date(`b`.`Date`, "%d-%M-%Y") ASC ROWS 49 PRECEDING) AS `50 Day MA` 
	FROM `tvs motors` `b`    
	WHERE `Close Price` IS NOT NULL AND `b`.`Date` IS NOT NULL;

-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `tvs1` 	
ADD PRIMARY KEY (`Date`);

---2. Create a master table containing the date and close price of all the six stocks. (Column header for the price is the name of the stock)
create table master as 
	(select b.date Date, 
	b.`close price` Bajaj, 
	tc.`close price` TCS, 
	tv.`close price` TVS, 
	i.`close price` Infosys,
	e.`close price` Eicher,
	h.`close price` Hero 
	from bajaj1 b inner join tcs1 tc 
		on b.date = tc.date
	inner join tvs1 tv 
		on tc.date = tv.date
	inner join infosys1 i 
		on i.date = tv.date
	inner join eicher1 e 
		on e.date = i.date
	inner join hero1 h
		on h.date = e.date
	);

-- --------------------------------------------------------------------------------------------------------------------------------------------
---3. Use the table created in Part(1) to generate buy and sell signal. 
--- Store this in another table named 'bajaj2'. Perform this operation for all stocks.

-- This could be accomplished using LAG() Window function. ROW_NUMBER() Window function is required to ignore initial rows with false moving average.
--Creating table bajaj2
drop table if exists bajaj2; 

CREATE TABLE `bajaj2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) > LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` < `50 Day MA` THEN "Sell"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) < LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` > `50 Day MA` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `bajaj1`;
-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `bajaj2`
	ADD PRIMARY KEY (`Date`);

--Creating table eicher2
CREATE TABLE `eicher2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) > LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` < `50 Day MA` THEN "Sell"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) < LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` > `50 Day MA` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `eicher1`;
-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `eicher2`
	ADD PRIMARY KEY (`Date`);

---Creating table hero2
CREATE TABLE `hero2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) > LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` < `50 Day MA` THEN "Sell"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) < LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` > `50 Day MA` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `hero1`;
-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `hero2`
	ADD PRIMARY KEY (`Date`);

---Creating table infosys2
CREATE TABLE `infosys2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) > LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` < `50 Day MA` THEN "Sell"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) < LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` > `50 Day MA` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `infosys1`;
-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `infosys2`
	ADD PRIMARY KEY (`Date`);

--Creating table tcs2
CREATE TABLE `tcs2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) > LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` < `50 Day MA` THEN "Sell"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) < LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` > `50 Day MA` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `tcs1`;
-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `tcs2`
	ADD PRIMARY KEY (`Date`);

---Creating table tvs2
CREATE TABLE `tvs2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) > LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` < `50 Day MA` THEN "Sell"
        WHEN LAG(`20 Day MA`) OVER(ORDER BY `Date`) < LAG(`50 Day MA`,1) OVER(ORDER BY `Date`) AND `20 Day MA` > `50 Day MA` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `tvs1`;
-- Setting `Date` as Primary Key to also improve performance as operations using keys are much faster due to indexing
ALTER TABLE `tvs2`
	ADD PRIMARY KEY (`Date`);
-- --------------------------------------------------------------------------------------------------------------------------------------------
--- 4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.
-- This could be accomplished using UDF that returns result of a SELECT query on bajaj2 table.
-- --------------------------------------------------------------------------------------------------------------------------------------------
-- Dropping the UDF if it exists
drop function if exists re_bajaj_sign;

 DELIMITER $$ 
create function re_bajaj_sign(date_value date)	
	returns varchar(20) deterministic 
    begin	
    declare ret_val varchar(20) default 'Data Not Available';    
    if exists (select `signal` from bajaj2 where `date` = date_value) 
    then (select `signal` into ret_val from bajaj2 where `date` = date_value);
    else set ret_val = 'Data Not Available'; 
    end if;
    return ret_val;
end $$ 
 DELIMITER ;

-------------
-- Testing a few values "2016-06-29" expecting "Sell"
select re_bajaj_sign("2016-06-29") as `Signal`;
-- Testing a few values "2016-06-30" expecting "Buy"
select re_bajaj_sign("2016-06-30") as `Signal`;
-- Testing a few values "2016-07-01" expecting "Hold"
select re_bajaj_sign("2016-07-01") as `Signal`;
-- --------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Write a brief summary of the results obtained and what inferences you can draw from the analysis performed. 
-- (Less than 250 words to be submitted in a pdf file)

-- Collecting various facts from our records for writing summary of analysis.
-- --------------------------------------------------------------------------------------------------------------------------------------------

-- Analysing based on Growth of stock prices 
select stock, latest, oldest 
, round((latest - oldest),2) as growth, round((latest - oldest)/oldest,2)*100 as growth_percent
from (
	select 'Bajaj' as 'Stock', first_value(bajaj) over (order by date) as 'Oldest'
    , first_value(bajaj) over (order by date desc) as 'Latest'
	from master
	union 
	select 'Eicher' as 'Stock', first_value(eicher) over (order by date) as 'Oldest'
    , first_value(eicher) over (order by date desc) as 'Latest'
	from master
	union 
	select 'Hero' as 'Stock', first_value(hero) over (order by date) as 'Oldest'
    , first_value(hero) over (order by date desc) as 'Latest'
	from master
	union 
	select 'Infosys' as 'Stock', first_value(infosys) over (order by date) as 'Oldest'
    , first_value(infosys) over (order by date desc) as 'Latest'
	from master
	union 
	select 'TCS' as 'Stock', first_value(tcs) over (order by date) as 'Oldest'
    , first_value(tcs) over (order by date desc) as 'Latest'
	from master
	union 
	select 'TVS' as 'Stock', first_value(tvs) over (order by date) as 'Oldest'
    , first_value(tvs) over (order by date desc) as 'Latest'
	from master
) oldest_and_newest
order by growth_percent desc;

-- Analysing based on spread of stock prices 
select stock
, Maximum
, Minimum
, round((Maximum - Minimum),2) as Spread
, round((Maximum - Minimum)/minimum,2) as spread_percent
from (
	select 'Bajaj' as 'Stock'
    , min(bajaj) as 'minimum', max(bajaj) as 'maximum'
	from master
	union 
	select 'Eicher' as 'Stock'
    , min(eicher) as 'minimum', max(eicher) as 'maximum'
	from master
	union 
	select 'Hero' as 'Stock'
    , min(hero) as 'minimum', max(hero) as 'maximum'
	from master
	union 
	select 'Infosys' as 'Stock'
    , min(infosys) as 'minimum', max(infosys) as 'maximum'
	from master
	union 
	select 'TCS' as 'Stock'
    , min(tcs) as 'minimum', max(tcs) as 'maximum'
	from master
	union 
	select 'TVS' as 'Stock'
    ,min(tvs) as 'minimum', max(tvs) as 'maximum'
	from master
) max_and_min
order by spread_percent desc; 

--- Analysing the Golden Cross and Death Cross of stocks based on the signas - Buy/Sell/Hold
select `stock`, 
sum(case when `signal` = 'Hold' then count_of_signals else 0 end) as 'Hold',
sum(case when `signal` = 'Sell' then count_of_signals else 0 end) as 'Sell',
sum(case when `signal` = 'Buy' then count_of_signals else 0 end) as 'Buy'
from (
select 'Bajaj' as stock, `signal`, count(1) as count_of_signals from bajaj2
group by `signal`
union all 
select 'TCS' as stock, `signal`, count(1) as count_of_signals from tcs2
group by `signal`
union all 
select 'TVS' as stock, `signal`, count(1) as count_of_signals from tvs2
group by `signal`
union all 
select 'Eicher' as stock, `signal`, count(1) as count_of_signals from eicher2
group by `signal`
union all 
select 'Infosys' as stock, `signal`, count(1) as count_of_signals from infosys2
group by `signal`
union all 
select 'Hero' as stock, `signal`, count(1) as count_of_signals from hero2
group by `signal`) combined
group by stock;

-- From the above observations we can recommend that investing on Eicher Motors stock would provide a good return value. 
-- And not to buy stocks of Infosys and TCS.

-- --------------------------------------------------------------------------------------------------------------------------------------------
