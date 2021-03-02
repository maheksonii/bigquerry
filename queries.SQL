--to get a tabular preview of the dataset--
SELECT*FROM `bigquery-public-data.covid19_italy.data_by_province`Limit 10

--To extract all those data points where the region name contain the letters "Ven" and where the confirmed cases are greater than 300--
SELECT date,region_name AS region, confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name like '%Ven%' and confirmed_cases > 300
ORDER BY confirmed_cases DESC 
LIMIT 10


--To extract all those data points where the region name contain the letters "Lombardia" and where the confirmed cases are greater than 300 and we sort the data set by the number of confirmed cases in descending order--
SELECT date,region_name AS region, confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name like '%Lombardia%' and confirmed_cases > 300
ORDER BY confirmed_cases DESC 
LIMIT 10

--Since Lomardia and Veneto were the worst impacted regions of italy, this querry returns data on the number of confirmed cases from these regions in ascending order--
SELECT date,region_name AS region, confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name in ('Lombardia','Veneto')
ORDER BY confirmed_cases asc
LIMIT 100

--This querry helps us return the sum of total cases in the two worst impacted regions of italy due to covif-19, where its grouped by region and sorted by total number of cases--
SELECT
region_name AS region, 
sum(confirmed_cases) as total_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
WHERE region_name in ('Lombardia','Veneto')
GROUP BY region
ORDER BY total_cases DESC 
LIMIT 100

--This querry helps us get the data on the total number of covid-19 cases from either of the two provinces 'Latina' or 'di definizione/aggiornamento' where the number of cases were greater than 2000, while the data is grouped by date, province name and region name, and sorted by total confirmed cases in descending order--
SELECT 
date,province_name,region_name as region ,sum(confirmed_cases) as confirmed_cases
FROM`bigquery-public-data.covid19_italy.data_by_province`
where confirmed_cases>2000 and province_name=	
'Latina' or   province_name ='di definizione/aggiornamento'
group by date, province_name,region_name
order by confirmed_cases desc 
limit 10

--This following querry performs a left join by the use of the common variable region name--
--it returns the tests performed in all the regions corresponding to the temperature in the region. The intention of this join was to see if there is any relationship between the tests performed and the temperature in that region--
SELECT 
a.average_temperature_celsius,b.tests_performed
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`a
LEFT JOIN `bigquery-public-data.covid19_italy.data_by_region` b
ON(
    a.subregion1_name = b.region_name
)

--it returns the new number of total confirmed cases in all the regions corresponding to the rainfall recorded in the region. The intention of this join was to see if there is any relationship between the new confirmed cases and the rainfall in that region--
SELECT 
a.rainfall_mm,b.new_total_confirmed_cases
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`a
LEFT JOIN `bigquery-public-data.covid19_italy.data_by_region` b
ON(
    a.subregion1_name = b.region_name
)

-- the following querys on joins are from the data available on bicycle from london--


--the follwing queery helps return the number of bicycles available at each of the stations in london--
--the purpose is to help analyse how many cycles would be required at each stations depending on the frequency of cycle pickups from these stations--
SELECT  `bigquery-public-data.london_bicycles.cycle_hire`. start_station_id ,  `bigquery-public-data.london_bicycles.cycle_stations`. bikes_count
FROM `bigquery-public-data.london_bicycles.cycle_hire` 
inner join  `bigquery-public-data.london_bicycles.cycle_stations`
on `bigquery-public-data.london_bicycles.cycle_hire`. start_station_id = `bigquery-public-data.london_bicycles.cycle_stations`. id
LIMIT 100

--the following join returns the the individual-id along with which station the cycle was picked up from--
SELECT  `bigquery-public-data.london_bicycles.cycle_hire`. rental_id ,  `bigquery-public-data.london_bicycles.cycle_stations`. id
FROM `bigquery-public-data.london_bicycles.cycle_hire` 
inner join  `bigquery-public-data.london_bicycles.cycle_stations` 
on `bigquery-public-data.london_bicycles.cycle_hire`. start_station_id = `bigquery-public-data.london_bicycles.cycle_stations`. id
LIMIT 100



