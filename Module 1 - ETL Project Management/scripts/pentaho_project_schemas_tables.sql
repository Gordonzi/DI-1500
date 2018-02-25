--SCHEMA: pdi_control--DROP SCHEMA pdi_control;  
	CREATE SCHEMA pdi_control AUTHORIZATION postgres; 

--SCHEMA: sales_dwh--DROP SCHEMA sales_dwh;  
	CREATE SCHEMA sales_dwh AUTHORIZATION postgres; 

--Table: pdi_control.job_control--DROP TABLE pdi_control.job_control;  
	CREATE TABLE pdi_control.job_control(batch_id integer, jobname character varying(50) COLLATE pg_catalog.  
	    "default", status character varying(50) COLLATE pg_catalog.  
	    "default", checkpoint character varying(50) COLLATE pg_catalog.  
	    "default", logtime timestamp without time zone) WITH(OIDS = FALSE) TABLESPACE pg_default;  
	ALTER TABLE pdi_control.job_control OWNER to postgres;  
	GRANT ALL ON TABLE pdi_control.job_control TO postgres;  

--Table: sales_dwh.dim_country--DROP TABLE sales_dwh.dim_country;  
	CREATE TABLE sales_dwh.dim_country(id serial NOT NULL, country character varying COLLATE pg_catalog.  
	    "default"  
	    NOT NULL, CONSTRAINT dim_country_pkey PRIMARY KEY(id)) WITH(OIDS = FALSE) TABLESPACE pg_default;  
	ALTER TABLE sales_dwh.dim_country OWNER to postgres; 

--Table: sales_dwh.fact_sales--DROP TABLE sales_dwh.fact_sales;  
	CREATE TABLE sales_dwh.fact_sales(id serial NOT NULL, country_id bigint NOT NULL, nb_sales bigint NOT NULL, CONSTRAINT fact_sales_pkey PRIMARY KEY(id), CONSTRAINT "FK_COUNTRY"  
	    FOREIGN KEY(country_id) REFERENCES sales_dwh.dim_country(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) WITH(OIDS = FALSE) TABLESPACE pg_default;  
	ALTER TABLE sales_dwh.fact_sales OWNER to postgres; 