SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

-- Name: plpgsql; Type: EXTENSION

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

-- Name: EXTENSION plpgsql; Type: COMMENT

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

-- Name: ar_internal_metadata; Type: TABLE

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

-- Name: schema_migrations; Type: TABLE

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);

-- Name: users; Type: TABLE

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    email character varying NOT NULL,
    password_digest character varying NOT NULL,
    status_id smallint,
    admin boolean DEFAULT false NOT NULL,
    password_reset_token character varying,
    password_reset_sent_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stable_id integer DEFAULT 0
);

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);

-- Name: index_users_on_email; Type: INDEX

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);

-- Name: index_users_on_stable_id; Type: INDEX

CREATE UNIQUE INDEX index_users_on_stable_id ON users USING btree (stable_id);

-- Name: index_users_on_status_id; Type: INDEX

CREATE INDEX index_users_on_status_id ON users USING btree (status_id);

-- Name: index_users_on_username; Type: INDEX

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);

-- PostgreSQL database dump complete

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170305150501'),
('20170819160635');

