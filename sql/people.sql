DROP TABLE IF EXISTS composer;
DROP TABLE IF EXISTS producer;
DROP TABLE IF EXISTS lyrics;
DROP TABLE IF EXISTS people;


CREATE TABLE IF NOT EXISTS people(
    person_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    biography TEXT
);

CREATE TABLE IF NOT EXISTS composer(
    composer_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (composer_id) REFERENCES people(person_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS producer(
    producer_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (producer_id) REFERENCES people(person_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS lyrics(
    lyricist_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (lyricist_id) REFERENCES people(person_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE
);
