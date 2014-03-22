
/*

Data in facebook-government-requests.csv looks like this:

Country,Total Requests,Users / Accounts requested,Percentage of requests where some data produced
United States,11000,20000,79
United Kingdom,1975,2337,68
Uganda,1,1,0
Turkey,96,170,47
Thailand,2,5,0
Taiwan,229,329,84
Switzerland,32,36,13
Sweden,54,66,54

Data in facebook-users-by-country.csv looks like this:

country,fb_users
United States,166029240
India,62713680
Brazil,58565700
Indonesia,51096860
Mexico,38463860
United Kingdom,32950400
Turkey,32131260

*/


create schema government_requests;

use government_requests;

CREATE TABLE fb_requests (
	`country` varchar(40),
	`requests` int,
	`accounts_requested` int,
	`percent_data_produced` int
);

LOAD DATA LOCAL INFILE
'/path/to/file/facebook-government-requests.csv'
INTO TABLE fb_requests
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from fb_requests;

CREATE TABLE fb_users (
	`country` varchar(40),
	`fb_users` int
);

LOAD DATA LOCAL INFILE
'/path/to/file/facebook-users-by-country.csv'
INTO TABLE fb_users
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'  IGNORE 1 LINES;

select * from fb_users;

select * from fb_requests;

select * from fb_requests order by accounts_requested desc;

select * from fb_users order by fb_users desc;

select
	*
from
	fb_requests join fb_users on fb_requests.country = fb_users.country;

select
	*
from
	fb_requests left join fb_users on fb_requests.country = fb_users.country
where
	fb_users.country is null;

select
	*
from
	fb_requests right join fb_users on fb_requests.country = fb_users.country
where
	fb_requests.country is null;

select
	a.country,
	a.requests,
	a.accounts_requested,
	a.percent_data_produced,
	b.fb_users
from
	fb_requests a JOIN
	fb_users b on a.country = b.country;

select
	a.country,
	a.requests,
	a.accounts_requested,
	a.percent_data_produced,
	b.fb_users,
	a.accounts_requested / b.fb_users * 1000 AS per1000users
from
	fb_requests a JOIN
	fb_users b on a.country = b.country
order by a.accounts_requested / b.fb_users * 1000 desc;