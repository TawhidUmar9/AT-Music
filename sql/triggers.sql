-- Prevent Duplicate Album Name Trigger
CREATE OR REPLACE FUNCTION prevent_duplicate_album() 
RETURNS TRIGGER AS $tag$ 
BEGIN 
    IF EXISTS (
        SELECT 1 FROM album WHERE name = NEW.name
    ) THEN 
        RAISE EXCEPTION 'An album with the same name already exists';
    END IF;
    
    RETURN NEW;
END;
$tag$ LANGUAGE plpgsql;

CREATE TRIGGER check_duplicate_album 
BEFORE INSERT ON album 
FOR EACH ROW 
EXECUTE FUNCTION prevent_duplicate_album();

-- User Password Update Trigger
CREATE OR REPLACE FUNCTION check_password_update() 
RETURNS TRIGGER AS $tag$ 
BEGIN 
    IF NEW.password = OLD.password THEN 
        RAISE EXCEPTION 'New password must be different from the previous password';
    END IF;
    
    RETURN NEW;
END;
$tag$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_password 
BEFORE UPDATE OF password ON user_db 
FOR EACH ROW 
WHEN (NEW.password IS NOT NULL) 
EXECUTE FUNCTION check_password_update();

-- Prevent Username Reuse Trigger
CREATE OR REPLACE FUNCTION prevent_username_reuse() 
RETURNS TRIGGER AS $tag$ 
BEGIN 
    IF NEW.username = OLD.username THEN 
        RAISE EXCEPTION 'New username cannot be the same as the previous username';
    END IF;
    
    RETURN NEW;
END;
$tag$ LANGUAGE plpgsql;

CREATE TRIGGER check_username_reuse 
BEFORE UPDATE OF username ON user_db 
FOR EACH ROW 
EXECUTE FUNCTION prevent_username_reuse();

--5
CREATE OR REPLACE FUNCTION delete_likes_on_song_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM liked_song WHERE song_id = OLD.song_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_likes_on_song_delete
AFTER DELETE ON song
FOR EACH ROW
EXECUTE FUNCTION delete_likes_on_song_delete();

--6

CREATE OR REPLACE FUNCTION delete_likes_on_artist_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM liked_song WHERE song_id IN (SELECT song_id FROM song WHERE artist_id = OLD.artist_id);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_likes_on_artist_delete
AFTER DELETE ON artist
FOR EACH ROW
EXECUTE FUNCTION delete_likes_on_artist_delete();

--7

CREATE OR REPLACE FUNCTION delete_likes_on_album_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM liked_song WHERE song_id IN (SELECT song_id FROM song WHERE album_id = OLD.album_id);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_likes_on_album_delete
AFTER DELETE ON album
FOR EACH ROW
EXECUTE FUNCTION delete_likes_on_album_delete();

--7

CREATE OR REPLACE FUNCTION delete_likes_on_genre_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM liked_song WHERE song_id IN (SELECT song_id FROM song WHERE genre_id = OLD.genre_id);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_likes_on_genre_delete
AFTER DELETE ON genre
FOR EACH ROW
EXECUTE FUNCTION delete_likes_on_genre_delete();

--8 when album is deleted, all songs from the album will be deleted
CREATE OR REPLACE FUNCTION delete_songs_on_album_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM song WHERE album_id = OLD.album_id;
    DELETE FROM liked_album WHERE album_id = OLD.album_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_songs_on_album_delete
AFTER DELETE ON album
FOR EACH ROW
EXECUTE FUNCTION delete_songs_on_album_delete();

--9 when artist is deleted, all songs from the artist will be deleted
CREATE OR REPLACE FUNCTION delete_albums_and_songs_on_artist_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM album WHERE artist_id = OLD.artist_id;
    DELETE FROM liked_artist WHERE artist_id = OLD.artist_id;
    DELETE FROM song WHERE artist_id = OLD.artist_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_delete_albums_and_songs_on_artist_delete
AFTER DELETE ON artist
FOR EACH ROW
EXECUTE FUNCTION delete_albums_and_songs_on_artist_delete();


--10 when genre is deleted, all songs from the genre will be deleted
-- Create trigger to delete songs when genre is deleted
CREATE OR REPLACE FUNCTION delete_songs_on_genre_delete()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM song WHERE genre_id = OLD.genre_id;
    DELETE FROM liked_genre WHERE genre_id = OLD.genre_id; -- Optionally delete from liked_genre table
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for deleting songs on genre deletion
CREATE TRIGGER trigger_delete_songs_on_genre_delete
AFTER DELETE ON genre
FOR EACH ROW
EXECUTE FUNCTION delete_songs_on_genre_delete();



--when any review is added to the reviews table, the song popularity is also updated then.