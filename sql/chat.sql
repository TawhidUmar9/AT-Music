CREATE TABLE IF NOT EXISTS chat (
    chat_id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    message bytea NOT NULL,
    message_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES user_db(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES user_db(user_id) ON DELETE CASCADE
);
