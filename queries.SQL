SELECT*FROM `bigquery-public-data.covid19_italy.data_by_province`Limit 10

--ehwfiwaoeio--
SELECT date,region_name AS region, confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name like '%Ven%' and confirmed_cases > 300
ORDER BY confirmed_cases DESC 
LIMIT 10



SELECT date,region_name AS region, confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name like '%Lombardia%' and confirmed_cases > 300
ORDER BY confirmed_cases DESC 
LIMIT 10

SELECT date,region_name AS region, confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name in ('Lombardia','Veneto')
ORDER BY confirmed_cases asc
LIMIT 100


SELECT
region_name AS region, 
sum(confirmed_cases) as total_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name in ('Lombardia','Veneto')
GROUP BY region
ORDER BY total_cases DESC 
LIMIT 1000

SELECT
region_name AS region, 
sum(confirmed_cases) as total_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name in ('Lombardia','Veneto')
GROUP BY region
ORDER BY total_cases DESC 
LIMIT 100

SELECT 
date,province_name,region_name as region ,sum(confirmed_cases) as confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
where confirmed_cases>2000 and province_name=	
'Latina' or   province_name ='di definizione/aggiornamento'
group by date, province_name,region_name
order by confirmed_cases desc 
limit 10

SELECT 
a.average_temperature_celsius,b.tests_performed
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`a
LEFT JOIN `bigquery-public-data.covid19_italy.data_by_region` b
ON(
    a.subregion1_name = b.region_name
)
