CREATE TABLE user_db (
    user_id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(50) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL
);