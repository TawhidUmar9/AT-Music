CREATE TABLE IF NOT EXISTS liked_song(
    user_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS liked_album (
    user_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS liked_artist (
    user_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS liked_genre (
    user_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL
);