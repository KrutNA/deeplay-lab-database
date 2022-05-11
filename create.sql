BEGIN;

CREATE TABLE IF NOT EXISTS locations (
    id 	     	    SERIAL PRIMARY KEY,
    name 	    VARCHAR(32) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS units (
    id 	     	    BIGSERIAL PRIMARY KEY,
    name 	    VARCHAR(64) UNIQUE NOT NULL,
    team	    SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS rounds (
    id 	     	    BIGSERIAL PRIMARY KEY,
    round_id	    UUID NOT NULL UNIQUE,
    location_id     INTEGER NOT NULL REFERENCES locations(id),
    location_level  SMALLINT NOT NULL,
    location_size   SMALLINT NOT NULL,
    insert_at	    TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS historical_iterations (
    id 	     	    BIGSERIAL PRIMARY KEY,
    round_id        BIGINT NOT NULL REFERENCES rounds(id),
    unit_id         BIGINT NOT NULL REFERENCES units(id),
    profit          FLOAT NOT NULL,
    position        SMALLINT NOT NULL,
    evasiveness     SMALLINT NOT NULL,
    aggression      SMALLINT NOT NULL,
    response_aggression SMALLINT NOT NULL,
    shield          SMALLINT NOT NULL
);

CREATE INDEX IF NOT EXISTS historical_iterations_unit_idx
    ON historical_iterations(unit_id);

COMMIT;
