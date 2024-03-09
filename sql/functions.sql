CREATE
OR REPLACE FUNCTION log_function_calls() RETURNS TRIGGER AS $ $ DECLARE function_name TEXT;

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

$ $ LANGUAGE plpgsql;

--5
--update the popularity of the song after a review is added
CREATE
OR REPLACE FUNCTION update_popularity_on_review_update() RETURNS TRIGGER AS $ $ BEGIN -- Call the procedure to update the popularity
PERFORM update_song_popularity();

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER update_popularity_trigger
AFTER
UPDATE
    ON reviews FOR EACH ROW EXECUTE FUNCTION update_popularity_on_review_update();

--6
--update the popularity of the song after a review is updated
CREATE
OR REPLACE FUNCTION update_song_popularity_update() RETURNS TRIGGER AS $ $ DECLARE average_rating NUMERIC;

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

$ $ LANGUAGE plpgsql;

--7
--update the popularity of the song after a review is deleted
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
    song_id = OLD.song_id;

RETURN OLD;

END;

$ $ LANGUAGE plpgsql;

--8
--update the last_updated field of the user table
--9
--function for hashing password.