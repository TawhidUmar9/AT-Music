CREATE TABLE platform (
    platform_id BIGSERIAL PRIMARY KEY NOT NULL,
    platform_name VARCHAR(50) NOT NULL,
    total_visit INTEGER
);

INSERT INTO
    platform (platform_name, total_visit)
VALUES
    ('Spotify', 0),
    ('Apple Music', 0),
    ('Deezer', 0);

CREATE TABLE rec_type (
    rectype_id BIGSERIAL PRIMARY KEY NOT NULL,
    rectype_name VARCHAR(30) NOT NULL
);

INSERT INTO
    rec_type(rectype_name)
VALUES
    ('Studio Recording'),
    ('Live Recording'),
    ('Remote Recording');

CREATE TABLE IF NOT EXISTS platform_song (
    platform_id INTEGER REFERENCES platform(platform_id) NOT NULL,
    song_id INTEGER REFERENCES song(song_id) NOT NULL,
    rectype_id INTEGER REFERENCES rec_type(rectype_id) NOT NULL,
    PRIMARY KEY (platform_id, song_id)
);

CREATE TABLE IF NOT EXISTS recording_song (
    song_id INTEGER REFERENCES song(song_id) NOT NULL,
    rectype_id INTEGER REFERENCES rec_type(rectype_id) NOT NULL,
    PRIMARY KEY (song_id, rectype_id)
);