--- Create three tables to store datasets
CREATE TABLE confirmed (
id INT PRIMARY KEY,
state TEXT,
county TEXT,
fips INT,
total_population INT,
confirmed INT,
deaths INT
);

CREATE TABLE bed(
fips INT PRIMARY KEY,
total_bed INT,
potential_inc_bed INT);

CREATE TABLE aqi(
id INT PRIMARY KEY,
state TEXT,
county TEXT,
aqi_days INT,
good_days INT,
PM2p5 INT,
PM10 INT);

-- Query to check successful load
SELECT * FROM confirmed;
SELECT * FROM bed;
SELECT * FROM aqi;

-- Inner join three tables on fips and county to analysis COVID-19 and AQI
SELECT * FROM confirmed
INNER JOIN bed
ON confirmed.fips = bed.fips
INNER JOIN aqi
ON confirmed.state = aqi.state AND confirmed.county = aqi.county;

-- Inner join two tables on fips to analysis only COVID-19
SELECT * FROM confirmed
INNER JOIN bed
ON confirmed.fips = bed.fips;





