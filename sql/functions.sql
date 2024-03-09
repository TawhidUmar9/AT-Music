--1
--when new song is added, the popularity is set to 0
CREATE
OR REPLACE FUNCTION set_default_popularity() RETURNS TRIGGER AS $$ BEGIN
UPDATE
    song
SET
    popularity = 0
WHERE
    song_id = NEW.song_id;

RETURN NEW;

END;

$$ LANGUAGE plpgsql;

--2
--username and email and phone number must be different from the previous values
CREATE
OR REPLACE FUNCTION prevent_username_reuse() RETURNS TRIGGER AS $$ BEGIN IF NEW.username = OLD.username
AND NEW.email = OLD.email
AND NEW.phone_number = OLD.phone_number THEN RAISE EXCEPTION 'Username, email, and phone number must be different from the previous values';

END IF;

RETURN NEW;

END;

$$ LANGUAGE plpgsql;

--3
--new password must be different from the previous password
CREATE
OR REPLACE FUNCTION check_password_update() RETURNS TRIGGER AS $$ BEGIN IF NEW.password = OLD.password THEN RAISE EXCEPTION 'New password must be different from the previous password';

END IF;

RETURN NEW;

END;

$$ LANGUAGE plpgsql;

--4
--log the function calls
CREATE
OR REPLACE FUNCTION log_function_calls() RETURNS TRIGGER AS $$ DECLARE function_name TEXT;

BEGIN -- Get the name of the called function
function_name := TG_NAME;

-- Insert a record into the change_log table
INSERT INTO
    change_log (table_name, operation, change_time)
VALUES
    (function_name, TG_OP, CURRENT_TIMESTAMP);

-- Return null to indicate successful execution of the trigger
RETURN NULL;

END;

$$ LANGUAGE plpgsql;


--5
--update the popularity of the song after a review is added
CREATE OR REPLACE FUNCTION update_popularity_on_review_update()
RETURNS TRIGGER AS $$
BEGIN
    -- Call the procedure to update the popularity
    PERFORM update_song_popularity();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_popularity_trigger
AFTER UPDATE ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_popularity_on_review_update();


--6
--update the popularity of the song after a review is updated
CREATE
OR REPLACE FUNCTION update_song_popularity_update() RETURNS TRIGGER AS $$ DECLARE average_rating NUMERIC;

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
    popularity = GREATEST(average_rating, 0) -- Ensure popularity is not negative
WHERE
    song_id = NEW.song_id;

RETURN NEW;

END;

$$ LANGUAGE plpgsql;

--7
--update the popularity of the song after a review is deleted
CREATE
OR REPLACE FUNCTION update_song_popularity_delete() RETURNS TRIGGER AS $$ DECLARE average_rating DECIMAL;

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
    song_id = OLD.song_id;

RETURN OLD;

END;

$$ LANGUAGE plpgsql;

--8
--update the last_updated field of the user table
CREATE
OR REPLACE FUNCTION update_last_updated() RETURNS TRIGGER AS $$ BEGIN NEW.last_updated = NOW();

-- Set last_updated to the current timestamp
RETURN NEW;

END;

$$ LANGUAGE plpgsql;


--9
--function for hashing password.
CREATE OR REPLACE FUNCTION hash_password(input_text TEXT) RETURNS TEXT AS $$
BEGIN
    RETURN md5(input_text);
END;
$$ LANGUAGE plpgsql;
