CREATE TABLE user_db (
    user_id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
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
        '44c099ff522cd529ade21a9c7aa54ebf',
        'saif@gmail.com',
        '01700000000'
    ),
    (
        'sakib',
        '28e9ae3ae3f544edf077eae414725fa2',
        'sakib@gmail.com',
        '01700000001'
    ),
    (
        'abir',
        '9ab209d66a9bf2250d7f56cc4b3b125d',
        'abir@gmail.com',
        '01700000002'
    ),
    (
        'shakib',
        'f0b9db247c4778068437708d8db7a015',
        'shakib@gmail.com',
        '01700000003'
    ),
    (
        'fatin',
        'ba7091270341b74b9c2171402a560a0c',
        'fatin@gmail.com',
        '01700000004'
    );