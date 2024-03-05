CREATE TABLE platform (
    platform_id BIGSERIAL PRIMARY KEY NOT NULL,
    platform_name VARCHAR(50) NOT NULL,
    total_visit INTEGER
);

-- Insert sample data into the platform table
INSERT INTO
    platform (platform_name, total_visit)
VALUES
    ('Spotify', 0),
    ('Apple Music', 0),
    ('Deezer', 0);

-- Create the rec_type table
CREATE TABLE rec_type (
    rectype_id BIGSERIAL PRIMARY KEY NOT NULL,
    rectype_name VARCHAR(30) NOT NULL,
    total_visit INTEGER
);

-- Insert sample data into the rec_type table
INSERT INTO
    rec_type (rectype_name, total_visit)
VALUES
    ('Studio Recording', 0),
    ('Live Recording', 0),
    ('Remote Recording', 0);

-- Create the platform_song table
CREATE TABLE IF NOT EXISTS platform_song (
    platform_id INTEGER REFERENCES platform(platform_id) ON DELETE CASCADE NOT NULL,
    song_id INTEGER NOT NULL
);

-- Generate and insert 100 random input records into the platform_song table
INSERT INTO
    platform_song (platform_id, song_id)
SELECT
    (random() * 2 + 1) :: INT,
    (random() * 100) :: INT
FROM
    generate_series(1, 100);

-- Create the recording_song table
CREATE TABLE IF NOT EXISTS recording_song (
    rectype_id INTEGER REFERENCES rec_type(rectype_id) ON DELETE CASCADE NOT NULL,
    song_id INTEGER NOT NULL
);

-- Generate and insert 100 random input records into the recording_song table
INSERT INTO
    recording_song (rectype_id, song_id)
SELECT
    (random() * 2 + 1) :: INT,
    (random() * 100) :: INT
FROM
    generate_series(1, 100);