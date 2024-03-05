CREATE TABLE IF NOT EXISTS friends (
    friendship_id SERIAL PRIMARY KEY,
    user1 INTEGER NOT NULL,
    user2 INTEGER NOT NULL,
    date_connected TIMESTAMP NOT NULL,
    CONSTRAINT fk_user1 FOREIGN KEY (user1) REFERENCES user_db(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_user2 FOREIGN KEY (user2) REFERENCES user_db(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS friend_request (
    request_id SERIAL PRIMARY KEY,
    sender INTEGER NOT NULL,
    recipient INTEGER NOT NULL,
    request_sent TIMESTAMP NOT NULL,
    CONSTRAINT fk_sender FOREIGN KEY (sender) REFERENCES user_db(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recipient FOREIGN KEY (recipient) REFERENCES user_db(user_id) ON DELETE CASCADE
);