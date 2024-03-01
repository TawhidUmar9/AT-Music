CREATE TABLE IF NOT EXISTS liked_song (
    user_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, song_id), -- Define composite primary key
    FOREIGN KEY (user_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS liked_album (
    user_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, album_id), -- Define composite primary key
    FOREIGN KEY (user_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES album(album_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS liked_artist (
    user_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, artist_id), -- Define composite primary key
    FOREIGN KEY (user_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS liked_genre (
    user_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, genre_id), -- Define composite primary key
    FOREIGN KEY (user_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);
