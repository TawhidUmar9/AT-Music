CREATE TRIGGER set_default_popularity_trigger
AFTER
INSERT
    ON song FOR EACH ROW EXECUTE FUNCTION set_default_popularity();

CREATE TRIGGER check_username_reuse BEFORE
UPDATE
    OF username,
    email,
    phone_number ON user_db FOR EACH ROW EXECUTE FUNCTION prevent_username_reuse();


CREATE TRIGGER before_update_password 
BEFORE UPDATE OF password ON user_db 
FOR EACH ROW 
WHEN (NEW.password IS NOT NULL) 
EXECUTE FUNCTION check_password_update();




CREATE
OR REPLACE FUNCTION log_table_changes() RETURNS TRIGGER AS $ $ BEGIN IF TG_OP = 'INSERT' THEN
INSERT INTO
    change_log(table_name, column_name, operation)
VALUES
    (TG_TABLE_NAME, 'All', 'INSERT');

ELSIF TG_OP = 'UPDATE' THEN
INSERT INTO
    change_log(table_name, column_name, operation)
VALUES
    (TG_TABLE_NAME, TG_ARGV [0], 'UPDATE');

ELSIF TG_OP = 'DELETE' THEN
INSERT INTO
    change_log(table_name, column_name, operation)
VALUES
    (TG_TABLE_NAME, 'All', 'DELETE');

END IF;

RETURN NULL;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER table_change_trigger
AFTER
INSERT
    OR
UPDATE
    OR DELETE ON change_log FOR EACH ROW EXECUTE FUNCTION log_table_changes();

----------------------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;

--this is for the encrypted chat.S
--------------------------------------------------------------------------------
--when any review is added to the reviews table, the song popularity is also updated then.
CREATE
OR REPLACE FUNCTION update_song_popularity() RETURNS TRIGGER AS $ $ DECLARE total_ratings INT;

average_rating DECIMAL;

current_popularity DECIMAL;

blended_popularity DECIMAL;

BEGIN -- Calculate the total number of ratings and average rating for the song
SELECT
    COUNT(*),
    COALESCE(AVG(rating), 0) INTO total_ratings,
    average_rating
FROM
    reviews
WHERE
    song_id = NEW.song_id;

-- Calculate the current popularity of the song
SELECT
    popularity INTO current_popularity
FROM
    song
WHERE
    song_id = NEW.song_id;

-- Blend the current popularity with the calculated average rating
blended_popularity := (current_popularity + average_rating) / 2;

-- Limit the blended popularity to a maximum of 10
IF blended_popularity > 10 THEN blended_popularity := 10;

END IF;

-- Update the song table with the blended popularity
UPDATE
    song
SET
    popularity = blended_popularity
WHERE
    song_id = NEW.song_id;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER update_song_popularity_trigger
AFTER
INSERT
    ON reviews FOR EACH ROW EXECUTE FUNCTION update_song_popularity();

-- Update Trigger
CREATE
OR REPLACE FUNCTION update_song_popularity_update() RETURNS TRIGGER AS $ $ DECLARE average_rating DECIMAL;

BEGIN -- Calculate the average rating for the song
SELECT
    COALESCE(AVG(rating), 0) INTO average_rating
FROM
    reviews
WHERE
    song_id = NEW.song_id;

-- Update the song table with the calculated average rating
UPDATE
    song
SET
    popularity = average_rating
WHERE
    song_id = NEW.song_id;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER update_song_popularity_update_trigger
AFTER
UPDATE
    ON reviews FOR EACH ROW EXECUTE FUNCTION update_song_popularity_update();

CREATE
OR REPLACE FUNCTION update_song_popularity_delete() RETURNS TRIGGER AS $ $ DECLARE average_rating DECIMAL;

BEGIN -- Calculate the average rating for the song
SELECT
    COALESCE(AVG(rating), 0) INTO average_rating
FROM
    reviews
WHERE
    song_id = OLD.song_id;

-- Update the song table with the calculated average rating
UPDATE
    song
SET
    popularity = average_rating
WHERE
    id = OLD.song_id;

RETURN OLD;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER update_song_popularity_delete_trigger
AFTER
    DELETE ON reviews FOR EACH ROW EXECUTE FUNCTION update_song_popularity_delete();

-- Update last_updated column on user update
CREATE
OR REPLACE FUNCTION update_last_updated() RETURNS TRIGGER AS $ $ BEGIN NEW.last_updated = NOW();

-- Set last_updated to the current timestamp
RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER update_user_last_updated BEFORE
UPDATE
    ON user_db FOR EACH ROW EXECUTE FUNCTION update_last_updated();