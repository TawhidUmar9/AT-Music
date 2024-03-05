CREATE TABLE IF NOT EXISTS user_playlist (
    playlist_id BIGSERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL,
    playlist_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS playlist (
    playlist_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES user_playlist(playlist_id) ON DELETE CASCADE,
    PRIMARY KEY (playlist_id, song_id)
);