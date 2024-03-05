CREATE TABLE user_db (
    user_id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(50) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    last_logout TIMESTAMP,
    last_updated TIMESTAMP
);

INSERT INTO
    user_db (
        username,
        password,
        email,
        phone_number
    )
VALUES
    (
        'saif',
        'saif',
        'saif@gmail.com',
        '01700000000'
    ),
    (
        'sakib',
        'sakib',
        'sakib@gmail.com',
        '01700000001'
    ),
    (
        'abir',
        'abir',
        'abir@gmail.com',
        '01700000002'
    ),
    (
        'shakib',
        'shakib',
        'shakib@gmail.com',
        '01700000003'
    ),
    (
        'fatin',
        'fatin',
        'fatin@gmail.com',
        '01700000004'
    );