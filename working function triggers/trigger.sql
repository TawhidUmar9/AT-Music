CREATE TRIGGER set_default_popularity_trigger
AFTER INSERT
ON song 
FOR EACH ROW 
    EXECUTE FUNCTION set_default_popularity();


CREATE TRIGGER check_username_reuse BEFORE
UPDATE OF username, email, phone_number 
ON user_db 
FOR EACH ROW 
    EXECUTE FUNCTION prevent_username_reuse();


CREATE TRIGGER before_update_password 
BEFORE UPDATE
OF password 
ON user_db 
FOR EACH ROW
    WHEN (NEW.password IS NOT NULL) EXECUTE FUNCTION check_password_update();


CREATE TRIGGER review_insert_trigger
AFTER INSERT ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_song_popularity_trigger();