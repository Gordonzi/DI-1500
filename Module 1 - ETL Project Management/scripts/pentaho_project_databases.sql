-- Script to create the databases for the Online Retailer

-- Role: pdi_logging-- DROP ROLE pdi_logging;
CREATE ROLE pdi_logging LOGIN
  ENCRYPTED PASSWORD 'md53b637314b0def1eecdc1bef04eb84046'
  NOSUPERUSER INHERIT CREATEDB NOCREATEROLE NOREPLICATION;

--Database: LOCAL--DROP DATABASE "LOCAL";  
CREATE DATABASE "LOCAL"  
WITH OWNER = postgres ENCODING = 'UTF8'  
TABLESPACE = pg_default CONNECTION LIMIT = -1;  
GRANT TEMPORARY, CONNECT ON DATABASE "LOCAL"  
TO PUBLIC;  
GRANT ALL ON DATABASE "LOCAL"  
TO postgres; 

--Database: DEV--DROP DATABASE "DEV";  
CREATE DATABASE "DEV"  
WITH OWNER = postgres ENCODING = 'UTF8'  
TABLESPACE = pg_default CONNECTION LIMIT = -1;  
GRANT TEMPORARY, CONNECT ON DATABASE "DEV"  
TO PUBLIC;  
GRANT ALL ON DATABASE "DEV"  
TO postgres; 

--Database: UAT--DROP DATABASE "UAT";  
CREATE DATABASE "UAT"  
WITH OWNER = postgres ENCODING = 'UTF8'  
TABLESPACE = pg_default CONNECTION LIMIT = -1;  
GRANT TEMPORARY, CONNECT ON DATABASE "UAT"  
TO PUBLIC;  
GRANT ALL ON DATABASE "UAT"  
TO postgres; 

--Database: pdi_logging--DROP DATABASE pdi_logging;  
CREATE DATABASE PDI_LOGGING WITH OWNER = pdi_logging ENCODING = 'UTF8'  
TABLESPACE = pg_default CONNECTION LIMIT = -1; 