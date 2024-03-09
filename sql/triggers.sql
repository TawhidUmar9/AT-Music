CREATE EVENT TRIGGER log_function_calls_trigger ON ddl_command_end
WHEN TAG IN ('CREATE FUNCTION', 'CREATE PROCEDURE') EXECUTE PROCEDURE log_function_calls();

CREATE TRIGGER update_song_popularity_trigger
AFTER
INSERT
    ON reviews FOR EACH ROW EXECUTE FUNCTION update_song_popularity();

CREATE TRIGGER update_popularity_trigger
AFTER
UPDATE
    ON reviews FOR EACH ROW EXECUTE FUNCTION update_popularity_on_review_update();

CREATE TRIGGER update_popularity_trigger
AFTER
UPDATE
    ON reviews FOR EACH ROW EXECUTE FUNCTION update_popularity_on_review_update();