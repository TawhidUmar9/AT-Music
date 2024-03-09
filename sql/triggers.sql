CREATE TRIGGER set_default_popularity_trigger
AFTER
INSERT
    ON song FOR EACH ROW EXECUTE FUNCTION set_default_popularity();

CREATE TRIGGER check_username_reuse BEFORE
UPDATE
    OF username,
    email,
    phone_number ON user_db FOR EACH ROW EXECUTE FUNCTION prevent_username_reuse();

CREATE TRIGGER before_update_password BEFORE
UPDATE
    OF password ON user_db FOR EACH ROW
    WHEN (NEW.password IS NOT NULL) EXECUTE FUNCTION check_password_update();

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

CREATE TRIGGER update_user_last_updated BEFORE
UPDATE
    ON user_db FOR EACH ROW EXECUTE FUNCTION update_last_updated();