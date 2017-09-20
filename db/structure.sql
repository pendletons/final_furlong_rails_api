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

-- Name: citext; Type: EXTENSION

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;

-- Name: EXTENSION citext; Type: COMMENT

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';

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

-- Name: horse_pedigrees; Type: TABLE

CREATE TABLE horse_pedigrees (
    id BIGSERIAL PRIMARY KEY,
    horse_id bigint,
    sire_id integer,
    dam_id integer
);

-- Name: horses; Type: TABLE

CREATE TABLE horses (
    id BIGSERIAL PRIMARY KEY,
    game_id integer,
    type character varying(20) DEFAULT 'Racehorse'::character varying NOT NULL,
    name citext,
    gender character varying(1) DEFAULT 'C'::character varying NOT NULL,
    status_id smallint,
    breeder_id integer,
    owner_id integer,
    bred_location_id integer,
    dob date,
    dod date,
    slug character varying,
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

-- Name: index_horse_pedigrees_on_dam_id; Type: INDEX

CREATE INDEX index_horse_pedigrees_on_dam_id ON horse_pedigrees USING btree (dam_id);

-- Name: index_horse_pedigrees_on_horse_id; Type: INDEX

CREATE INDEX index_horse_pedigrees_on_horse_id ON horse_pedigrees USING btree (horse_id);

-- Name: index_horse_pedigrees_on_sire_id; Type: INDEX

CREATE INDEX index_horse_pedigrees_on_sire_id ON horse_pedigrees USING btree (sire_id);

-- Name: index_horses_on_bred_location_id; Type: INDEX

CREATE INDEX index_horses_on_bred_location_id ON horses USING btree (bred_location_id);

-- Name: index_horses_on_breeder_id; Type: INDEX

CREATE INDEX index_horses_on_breeder_id ON horses USING btree (breeder_id);

-- Name: index_horses_on_dob; Type: INDEX

CREATE INDEX index_horses_on_dob ON horses USING btree (dob);

-- Name: index_horses_on_game_id; Type: INDEX

CREATE INDEX index_horses_on_game_id ON horses USING btree (game_id);

-- Name: index_horses_on_name; Type: INDEX

CREATE INDEX index_horses_on_name ON horses USING btree (name);

-- Name: index_horses_on_owner_id; Type: INDEX

CREATE INDEX index_horses_on_owner_id ON horses USING btree (owner_id);

-- Name: index_horses_on_slug; Type: INDEX

CREATE INDEX index_horses_on_slug ON horses USING btree (slug);

-- Name: index_horses_on_status_id; Type: INDEX

CREATE INDEX index_horses_on_status_id ON horses USING btree (status_id);

-- Name: index_users_on_email; Type: INDEX

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);

-- Name: index_users_on_stable_id; Type: INDEX

CREATE UNIQUE INDEX index_users_on_stable_id ON users USING btree (stable_id);

-- Name: index_users_on_status_id; Type: INDEX

CREATE INDEX index_users_on_status_id ON users USING btree (status_id);

-- Name: index_users_on_username; Type: INDEX

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);

-- Name: horse_pedigrees fk_rails_021569cbe3; Type: FK CONSTRAINT

ALTER TABLE ONLY horse_pedigrees
    ADD CONSTRAINT fk_rails_021569cbe3 FOREIGN KEY (sire_id) REFERENCES horses(id);

-- Name: horse_pedigrees fk_rails_a043185227; Type: FK CONSTRAINT

ALTER TABLE ONLY horse_pedigrees
    ADD CONSTRAINT fk_rails_a043185227 FOREIGN KEY (horse_id) REFERENCES horses(id);

-- Name: horse_pedigrees fk_rails_a6707e5903; Type: FK CONSTRAINT

ALTER TABLE ONLY horse_pedigrees
    ADD CONSTRAINT fk_rails_a6707e5903 FOREIGN KEY (dam_id) REFERENCES horses(id);

-- PostgreSQL database dump complete

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170305150501'),
('20170819160635'),
('20170819182310'),
('20170819185321');

