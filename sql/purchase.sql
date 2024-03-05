CREATE TABLE IF NOT EXISTS purchase_history (
    purchase_id BIGSERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS cart (
    user_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE
);