CREATE TABLE IF NOT EXISTS user_db (
    user_id BIGSERIAL PRIMARY KEY NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone_number VARCHAR(16) NOT NULL,
    pwd VARCHAR(100) NOT NULL
);