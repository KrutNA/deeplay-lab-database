BEGIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON locations TO deeplayuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON rounds TO deeplayuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON units TO deeplayuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON historical_iterations TO deeplayuser;
GRANT SELECT, UPDATE ON locations_id_seq TO deeplayuser;
GRANT SELECT, UPDATE ON rounds_id_seq TO deeplayuser;
GRANT SELECT, UPDATE ON units_id_seq TO deeplayuser;
GRANT SELECT, UPDATE ON historical_iterations_id_seq TO deeplayuser;

COMMIT;
