--1
--update popularity on review update.

CREATE OR REPLACE PROCEDURE update_popularity_on_review_update() AS $$
DECLARE
    total_ratings INT;
    average_rating DECIMAL;
    current_popularity DECIMAL;
    blended_popularity DECIMAL;
    song_id INT;
BEGIN
    -- Get the song_id of the updated review
    song_id := NEW.song_id;

    -- Calculate the total number of ratings and average rating for the song
    SELECT COUNT(*), COALESCE(AVG(rating), 0) INTO total_ratings, average_rating
    FROM reviews
    WHERE song_id = song_id;

    -- Ensure that total_ratings is not 0 to avoid division by zero
    IF total_ratings > 0 THEN 
        -- Calculate the current popularity of the song
        SELECT popularity INTO current_popularity
        FROM song
        WHERE song_id = song_id;

        -- Blend the current popularity with the calculated average rating
        blended_popularity := (current_popularity + average_rating) / 2;

        -- Limit the blended popularity to a maximum of 10
        IF blended_popularity > 10 THEN 
            blended_popularity := 10;
        END IF;
    ELSE 
        -- If there are no ratings, set the blended popularity to the current popularity
        SELECT popularity INTO blended_popularity
        FROM song
        WHERE song_id = song_id;
    END IF;

    -- Update the song table with the blended popularity
    BEGIN
        UPDATE song
        SET popularity = blended_popularity
        WHERE song_id = song_id;

        -- Log the update in the change_log table
        INSERT INTO change_log (table_name, column_name, operation, change_time)
        VALUES ('song', 'popularity', 'UPDATE', CURRENT_TIMESTAMP);
    EXCEPTION
        WHEN OTHERS THEN -- Log any errors that occur during the update
            INSERT INTO error_log (error_message)
            VALUES ('Error updating song popularity: ' || SQLERRM);
    END;
END;
$$ LANGUAGE plpgsql;
