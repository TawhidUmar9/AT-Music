DROP TABLE IF EXISTS purchase_history;

DROP TABLE IF EXISTS cart;

CREATE TABLE purchase_history (
    purchase_id BIGSERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_db(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE cart (
    user_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES user_db(user_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id)
);