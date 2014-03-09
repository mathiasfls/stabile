use practice;
SELECT dam_name, year_compl, insp_date, hazard 
FROM dams
WHERE year_compl < 1964
ORDER BY year_compl; 

SELECT dam_name, county, year_compl, insp_date
FROM dams
WHERE insp_date < '1990-12-31'
ORDER BY insp_date;

SELECT county, dam_name, year_compl, insp_date, hazard
	FROM dams
	WHERE county = 'SUMMIT' and year_compl < 1964 and 
		insp_date < '1990-01-01';

select * from sofla
where lname = 'fanjul' 
order by lname desc;

select * from sofla where rname like 'jos_ f jr';

SELECT lname, rname, city, occupation
FROM sofla
WHERE occupation like 'FLO-SUN%';

SELECT *
FROM sofla
WHERE occupation like '%sugar%';

SELECT lname, rname, city, occupation
FROM sofla
WHERE
 occupation like 'flo_s_n%'
 OR (lname like 'FANJUL' and occupation like '%SUGAR%')
 OR (lname like 'FANJUL' and city = 'PALM BEACH')
;
SELECT lname, rname, city, occupation FROM flosun WHERE  occupation like 'flo_s_n%'  OR (lname like 'FANJUL' and occupation like '%SUGAR%')  OR (lname like 'FANJUL' and city = 'PALM BEACH');