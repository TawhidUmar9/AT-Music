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
        '\xc30d040703026a43cd9b6262e57e68d23501a78d27462ea5ead9ff4fda6116d1d542d7e960f0a5c732ded187cf99a36a9991475ce788845b4f9f55b1e27e6ff08f0edf4aea4b',
        'saif@gmail.com',
        '01700000000'
    ),
    (
        'sakib',
        '\xc30d04070302880a359f7d9bec3f7ed236016890f0f1b9ed3f9188066af1a7d7bd7ddc2c1d89926d64b9db699486b81dba3d44cfb9ca4dcd4d1345b386d2785f6ff72d658464ad',
        'sakib@gmail.com',
        '01700000001'
    ),
    (
        'abir',
        '\xc30d04070302f48685f3f441c7536dd235014b2e24bce2bd67cb6f686bdf112463e26f24d64cee0825b65bb99199f77dfa3c3c8b6b3f3882677c1d7dcaf2314a0ee4b5266b89',
        'abir@gmail.com',
        '01700000002'
    ),
    (
        'shakib',
        '\xc30d04070302b016c3e276b8f22e6bd237012f14c64d0a4bcd7c366f9a01235160a636927254de0c7945850756661eaca81e0c30642f8409c2a590144c4cf01ad0e2e95219be17d1',
        'shakib@gmail.com',
        '01700000003'
    ),
    (
        'fatin',
        '\xc30d0407030242a5dac9fb19b2ee64d23601be94565650ad0c7b45a84a0b33e7b5c92b33844d57d07ac9f063d7c955846157cff223d599672856f087d2d03a3b0196cf6d69a6b0',
        'fatin@gmail.com',
        '01700000004'
    );