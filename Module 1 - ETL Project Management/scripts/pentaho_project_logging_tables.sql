--Table: public.log_channel--DROP TABLE public.log_channel;  
	CREATE TABLE public.log_channel(id_batch integer, channel_id character varying(255) COLLATE pg_catalog.  
	    "default", log_date timestamp without time zone, logging_object_type character varying(255) COLLATE pg_catalog.  
	    "default", object_name character varying(255) COLLATE pg_catalog.  
	    "default", object_copy character varying(255) COLLATE pg_catalog.  
	    "default", repository_directory character varying(255) COLLATE pg_catalog.  
	    "default", filename character varying(255) COLLATE pg_catalog.  
	    "default", object_id character varying(255) COLLATE pg_catalog.  
	    "default", object_revision character varying(255) COLLATE pg_catalog.  
	    "default", parent_channel_id character varying(255) COLLATE pg_catalog.  
	    "default", root_channel_id character varying(255) COLLATE pg_catalog.  
	    "default") WITH(OIDS = FALSE) TABLESPACE pg_default;  
	ALTER TABLE public.log_channel OWNER to postgres; 

--Table: public.log_job--DROP TABLE public.log_job;  
	CREATE TABLE public.log_job(id_job integer, channel_id character varying(255) COLLATE pg_catalog.  
	    "default", jobname character varying(255) COLLATE pg_catalog.  
	    "default", status character varying(15) COLLATE pg_catalog.  
	    "default", lines_read bigint, lines_written bigint, lines_updated bigint, lines_input bigint, lines_output bigint, lines_rejected bigint, errors bigint, startdate timestamp without time zone, enddate timestamp without time zone, logdate timestamp without time zone, depdate timestamp without time zone, replaydate timestamp without time zone, log_field text COLLATE pg_catalog.  
	    "default") WITH(OIDS = FALSE) TABLESPACE pg_default;  
	ALTER TABLE public.log_job OWNER to postgres; 

--Table: public.log_tran--DROP TABLE public.log_tran;  
	CREATE TABLE public.log_tran(id_batch integer, channel_id character varying(255) COLLATE pg_catalog.  
	    "default", transname character varying(255) COLLATE pg_catalog.  
	    "default", status character varying(15) COLLATE pg_catalog.  
	    "default", lines_input bigint, lines_output bigint, errors bigint, startdate timestamp without time zone, enddate timestamp without time zone, logdate timestamp without time zone, depdate timestamp without time zone, replaydate timestamp without time zone, log_field text COLLATE pg_catalog.  
	    "default", lines_read bigint, lines_written bigint, lines_updated bigint, lines_rejected bigint) WITH(OIDS = FALSE) TABLESPACE pg_default;  
	ALTER TABLE public.log_tran OWNER to postgres;