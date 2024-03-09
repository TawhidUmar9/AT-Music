CREATE OR REPLACE PROCEDURE add_song(
   in p_song_name VARCHAR, 
    in p_artist_name VARCHAR,
    in p_album_name varchar,
    in p_album_year INTEGER,
    in p_composer_name VARCHAR,
    in p_composer_biography VARCHAR,
    in p_composer_gender VARCHAR,
    in p_composer_nationality VARCHAR,
    in p_lyricist_name VARCHAR, 
    in p_lyricist_biography VARCHAR, 
    in p_lyricist_gender VARCHAR, 
    in p_lyricist_nationality VARCHAR,  
    in p_producer_biography VARCHAR, 
    in p_producer_gender VARCHAR, 
    in p_producer_nationality VARCHAR,
    in p_age_rating INTEGER, 
    in p_genre_name VARCHAR, 
    in p_price DECIMAL, 
    in p_producer_name VARCHAR, 
    in p_synopsis VARCHAR, 
    in p_recording_type VARCHAR, 
    in p_platform_type VARCHAR, 
    in p_song_length INTERVAL 
    )
LANGUAGE plpgsql
AS $$
DECLARE
    t_artist_id INTEGER;
    t_album_id INTEGER;
    t_genre_id INTEGER;
    t_platform_id INTEGER;
    t_recording_id INTEGER;
    t_album_year INTEGER;
    t_song_id INTEGER;
    t_composer_id INTEGER;
    t_lyricist_id INTEGER;
    t_producer_id INTEGER;
    t_album_name VARCHAR;
    t_artist_name VARCHAR;
BEGIN
    IF p_song_name IS NULL OR p_artist_name IS NULL OR p_age_rating 
    IS NULL OR p_genre_name IS NULL OR p_price IS NULL OR p_recording_type IS NULL 
    OR p_platform_type IS NULL OR p_song_length IS NULL THEN
        RAISE EXCEPTION 
        'Song name, artist name, age rating, genre name, and price are required';
    END IF;

    select song.song_id into t_song_id 
    from song 
    where LOWER(name) = LOWER(p_song_name);

    IF t_song_id IS NOT NULL THEN
        RAISE EXCEPTION 'Song already exists';
    END IF;

    IF p_album_name IS NULL THEN
        t_album_name := 'unknown album';
    ELSE
        t_album_name := p_album_name;
    END IF;

    IF p_album_name IS NULL THEN
        t_album_name := 'unknown album';
    ELSE
        t_album_name := p_album_name;
    END IF;

    IF p_artist_name IS NULL THEN
        t_artist_name := 'unknown artist';
    ELSE
        t_artist_name := p_artist_name;
    END IF;

    select artist.artist_id into t_artist_id 
    from artist 
    where LOWER(artist_name) = LOWER(t_artist_name);
    IF t_artist_id IS NULL THEN
        INSERT INTO artist (artist_name, alias,artist_intro_video, artist_artwork, small_biography)
        VALUES (
            t_artist_name,
            'unknown alias',
            'https://youtu.be/P1y2uynnONs?t=8',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg',
            'unknown biography'
            )
        RETURNING artist_id INTO t_artist_id;
    END IF;

    select album.album_id into t_album_id
    from album 
    where LOWER(album_name) = LOWER(t_album_name);
    IF t_album_id IS NULL THEN
        INSERT INTO album (album_name, release_year, artist_id, album_artwork)
        VALUES (
            t_album_name, 
            p_album_year, 
            t_artist_id,
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
            )
        RETURNING album_id INTO t_album_id;
    END IF;

    select genre.genre_id into t_genre_id
    from genre 
    where LOWER(genre_name) = LOWER(p_genre_name);
    IF t_genre_id IS NULL THEN
        RAISE EXCEPTION 'Genre not found';
    END IF;

    select platform.platform_id into t_platform_id
    from platform 
    where LOWER(platform_name) = LOWER(p_platform_type);
    IF t_platform_id IS NULL THEN
        RAISE EXCEPTION 'Platform not found';
    END IF;

    select rectype_id into t_recording_id
    from rec_type 
    where LOWER(rectype_name) = LOWER(p_recording_type);
    IF t_recording_id IS NULL THEN
        RAISE EXCEPTION 'Recording type not found';
    END IF;

    INSERT INTO song (artist_id, name, album_id, song_length,
                        age_rating, genre_id, price) 
                       VALUES (t_artist_id, p_song_name, t_album_id, p_song_length,
                        p_age_rating, t_genre_id, p_price) RETURNING song_id INTO t_song_id;
    
    if song__synopsis.song_id is not    null then
        INSERT INTO song_synopsis (song_id, synopsis)
        VALUES (t_song_id, p_synopsis);
    end if;

    select person_id into t_composer_id
    from people 
    where LOWER(name) = LOWER(p_composer_name);
    IF t_composer_id IS NULL THEN
        INSERT INTO people (name, nationality, gender, biography)
        VALUES (p_composer_name, p_composer_nationality, p_composer_gender, p_composer_biography)
        RETURNING person_id INTO t_composer_id;
    END IF;

    INSERT INTO composer (composer_id, song_id) 
    VALUES (t_composer_id, t_song_id);

    select person_id into t_lyricist_id
    from people 
    where LOWER(name) = LOWER(p_lyricist_name);
    IF t_lyricist_id IS NULL THEN
        INSERT INTO people (name, nationality, gender, biography)
            VALUES (p_lyricist_name, p_lyricist_nationality, p_lyricist_gender, p_lyricist_biography)
        RETURNING person_id INTO t_lyricist_id;
    END IF;

    INSERT INTO lyricist (lyricist_id, song_id)
    VALUES (t_lyricist_id, t_song_id);

    select person_id into t_producer_id
    from people 
    where LOWER(name) = LOWER(p_producer_name);
    IF t_producer_id IS NULL THEN
        INSERT INTO people (name, nationality, gender, biography)
            VALUES (p_producer_name, p_producer_nationality, p_producer_gender, p_composer_biography)
        RETURNING person_id INTO t_producer_id;
    END IF;

    INSERT INTO producer (producer_id, song_id)
    VALUES (t_producer_id, t_song_id);

    INSERT INTO platform_song (platform_id, song_id)
    VALUES (t_platform_id, t_song_id);

    INSERT INTO recording_song (rectype_id, song_id)
    VALUES (t_recording_id, t_song_id);

END;
$$;




CREATE OR REPLACE PROCEDURE add_artist(
    IN p_artist_name VARCHAR, 
    IN p_alias VARCHAR,
    IN p_small_biography VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if artist already exists
    IF EXISTS (SELECT 1 FROM artist WHERE LOWER(artist_name) = LOWER(p_artist_name)) THEN
        RAISE EXCEPTION 'Artist already exists';
    END IF;

    -- Insert the artist into the database
    INSERT INTO artist (artist_name, alias, small_biography) 
    VALUES (p_artist_name, p_alias, p_small_biography);
END;
$$;


CREATE OR REPLACE PROCEDURE add_user(
    IN p_username VARCHAR, 
    IN p_email VARCHAR,
    IN p_password VARCHAR,
    IN p_phone_number VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM user_db WHERE username = p_username) THEN
        RAISE EXCEPTION 'Username already exists';
    END IF;

    IF EXISTS (SELECT 1 FROM user_db WHERE email = p_email) THEN
        RAISE EXCEPTION 'Email already exists';
    END IF;

    IF EXISTS (SELECT 1 FROM user_db WHERE phone_number = p_phone_number) THEN
        RAISE EXCEPTION 'Phone number already exists';
    END IF;

    INSERT INTO user_db (username, password, email, phone_number, created_on)
    VALUES (p_username, hash_password(p_password), p_email, p_phone_number, CURRENT_TIMESTAMP);
END;
$$;




CREATE OR REPLACE procedure update_user(
    in p_email varchar,
    in p_username varchar,
    in p_phone_number varchar,
    in p_user_id integer
)
AS $$ 
BEGIN 
    update user_db 
    set email = p_email, username = p_username, phone_number = p_phone_number,
    last_updated = CURRENT_TIMESTAMP
    where user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;
