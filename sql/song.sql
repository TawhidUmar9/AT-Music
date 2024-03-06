CREATE TABLE IF NOT EXISTS song (
    song_id BIGSERIAL PRIMARY KEY NOT NULL,
    artist_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    -- Specify the maximum length for VARCHAR
    album_id INTEGER NOT NULL,
    song_length INTERVAL,
    age_rating INTEGER,
    popularity INTEGER CHECK (
        popularity BETWEEN 0
        AND 10
    ),
    price DECIMAL,
    genre_id INTEGER,
    CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES artist (artist_id) ON DELETE CASCADE,
    CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES album (album_id) ON DELETE CASCADE,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE CASCADE -- Specify the referenced table
);

-- Insert data for the specified songs
INSERT INTO
    song (
        ARTIST_ID,
        NAME,
        album_id,
        song_length,
        AGE_RATING,
        POPULARITY,
        PRICE,
        GENRE_ID
    )
VALUES
    (
        1,
        'Respect',
        1,
        '4:00',
        3,
        5,
        1.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        2,
        'Johnny B. Goode',
        2,
        '3:30',
        2,
        4,
        1.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        3,
        'Billie Jean',
        3,
        '4:30',
        1,
        5,
        2.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        4,
        'Rock Around The Clock',
        4,
        '2:00',
        3,
        3,
        0.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        5,
        'Stairway to Heaven',
        5,
        '8:00',
        3,
        5,
        3.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        6,
        'Louie Louie',
        6,
        '2:30',
        2,
        3,
        1.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        7,
        'I Heard It Through The Grapevine',
        7,
        '3:15',
        2,
        4,
        1.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        8,
        '(I Cant Get No) Satisfaction',
        8,
        '3:45',
        1,
        5,
        2.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        9,
        'Jailhouse Rock',
        9,
        '2:20',
        3,
        4,
        1.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        10,
        'Like A Rolling Stone',
        10,
        '6:00',
        1,
        5,
        3.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        11,
        'Hey Jude',
        11,
        '7:00',
        3,
        5,
        3.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        12,
        'Good Vibrations',
        12,
        '3:35',
        1,
        4,
        2.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        13,
        'Tutti-Frutti',
        13,
        '2:30',
        2,
        3,
        1.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        14,
        'What d I Say',
        14,
        '5:10',
        3,
        4,
        2.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        15,
        'Hotel California',
        15,
        '6:30',
        1,
        5,
        3.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        16,
        'You ve Lost That Lovin Feelin ',
        16,
        '3:45',
        2,
        5,
        2.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        17,
        'My Girl',
        17,
        '2:55',
        1,
        4,
        1.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        18,
        'Imagine',
        18,
        '3:00',
        3,
        5,
        2.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        7,
        'What s Going On',
        19,
        '3:50',
        2,
        4,
        2.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        19,
        'Smells Like Teen Spirit',
        20,
        '5:00',
        1,
        5,
        3.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        9,
        'Hound Dog',
        21,
        '2:20',
        3,
        4,
        1.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        20,
        'Born to Run',
        22,
        '4:30',
        3,
        5,
        3.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        21,
        'Light My Fire',
        23,
        '7:00',
        1,
        5,
        3.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        22,
        'Superstition',
        24,
        '4:00',
        2,
        5,
        2.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        23,
        'Layla',
        25,
        '7:10',
        3,
        5,
        4.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        24,
        'Bohemian Rhapsody',
        26,
        '5:55',
        2,
        5,
        3.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        11,
        'A Day In The Life',
        27,
        '5:35',
        3,
        5,
        3.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        25,
        'Summertime Blues',
        28,
        '1:45',
        2,
        4,
        1.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        26,
        'You Really Got Me',
        29,
        '2:14',
        1,
        5,
        2.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        27,
        'Bridge Over Troubled Water',
        30,
        '4:55',
        3,
        5,
        3.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        28,
        'Let s Stay Together',
        31,
        '3:18',
        1,
        4,
        2.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        13,
        'Long Tall Sally',
        32,
        '2:04',
        2,
        3,
        1.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        29,
        'Purple Haze',
        33,
        '2:51',
        3,
        5,
        2.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        11,
        'She Loves You',
        34,
        '2:22',
        1,
        5,
        2.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        30,
        'Whole Lot of Shakin Going On',
        35,
        '2:42',
        2,
        4,
        1.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        31,
        'Thatll Be The Day',
        36,
        '2:18',
        3,
        4,
        1.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        32,
        'Every Breath You Take',
        37,
        '4:13',
        1,
        5,
        2.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        33,
        'Hey Ya',
        38,
        '3:55',
        2,
        4,
        1.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        2,
        'Maybellene',
        2,
        '2:18',
        3,
        3,
        1.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        34,
        'Bo Diddley',
        39,
        '2:30',
        2,
        4,
        1.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        35,
        'Papa s Got A Brand New Bag',
        40,
        '2:08',
        1,
        5,
        1.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        36,
        'When Doves Cry',
        41,
        '5:52',
        3,
        5,
        3.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        37,
        'My Generation',
        42,
        '3:18',
        1,
        5,
        2.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        38,
        'Losing My Religion',
        43,
        '4:28',
        2,
        4,
        2.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        39,
        'Sunshine Of Your Love',
        44,
        '4:10',
        3,
        5,
        2.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        5,
        'Whole Lotta Love',
        45,
        '5:33',
        1,
        5,
        3.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        40,
        'One',
        46,
        '7:27',
        2,
        5,
        3.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        41,
        'A Change Is Gonna Come',
        47,
        '3:16',
        3,
        5,
        2.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        29,
        'All Along The Watchtower',
        48,
        '4:00',
        1,
        5,
        2.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        42,
        'The Message',
        49,
        '7:11',
        2,
        4,
        2.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        30,
        'Great Balls Of Fire',
        50,
        '1:50',
        3,
        4,
        1.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        43,
        'In The Midnight Hour',
        51,
        '2:40',
        2,
        4,
        1.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        44,
        'Mr. Tambourine Man',
        52,
        '5:29',
        1,
        5,
        3.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        45,
        'Proud Mary',
        53,
        '3:07',
        3,
        5,
        2.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        46,
        'Shake, Rattle And Roll',
        54,
        '3:14',
        2,
        3,
        1.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        47,
        'Walk This Way',
        55,
        '3:41',
        1,
        5,
        2.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        11,
        'Let It Be',
        56,
        '4:03',
        3,
        5,
        2.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        48,
        'Maggie May',
        57,
        '5:46',
        3,
        5,
        3.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        49,
        'American Pie',
        58,
        '8:33',
        2,
        5,
        4.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        50,
        '(Sittin On) The Dock Of The Bay',
        59,
        '2:43',
        3,
        4,
        1.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        9,
        'Blue Suede Shoes',
        60,
        '2:02',
        1,
        5,
        2.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        9,
        'Dont Be Cruel',
        61,
        '2:02',
        3,
        4,
        1.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        37,
        'Wont Get Fooled Again',
        62,
        '8:32',
        2,
        5,
        4.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        51,
        'Stayin Alive',
        63,
        '4:45',
        3,
        5,
        3.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        52,
        'Free Bird',
        64,
        '9:08',
        1,
        5,
        4.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        53,
        'Nuthin But a "G" Thang',
        65,
        '3:58',
        2,
        5,
        2.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        8,
        'Brown Sugar',
        66,
        '3:51',
        3,
        5,
        2.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        7,
        'Lets Get It On',
        67,
        '4:51',
        1,
        5,
        3.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        54,
        'When A Man Loves A Woman',
        68,
        '2:51',
        2,
        5,
        2.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        11,
        'I Want To Hold Your Hand',
        59,
        '2:24',
        3,
        5,
        2.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        9,
        'Good Rockin'' Tonight',
        69,
        '2:15',
        1,
        4,
        1.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        55,
        'Stand By Me',
        70,
        '2:58',
        2,
        5,
        2.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        56,
        'I Will Survive',
        71,
        '4:54',
        3,
        5,
        3.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        57,
        'Super Freak',
        72,
        '3:25',
        1,
        5,
        2.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        58,
        'A Whiter Shade Of Pale',
        73,
        '4:07',
        2,
        5,
        2.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        59,
        'Be My Baby',
        74,
        '2:42',
        3,
        5,
        2.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        60,
        'Go Your Own Way',
        75,
        '3:43',
        1,
        5,
        2.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        17,
        'Papa Was a Rollin Stone',
        76,
        '6:55',
        2,
        5,
        4.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        61,
        'House Of The Rising Sun',
        77,
        '4:29',
        3,
        5,
        3.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        11,
        'Yesterday',
        78,
        '2:03',
        1,
        5,
        1.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        62,
        'Where Did Our Love Go',
        79,
        '2:32',
        2,
        4,
        1.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        63,
        'Rappers Delight',
        80,
        '14:35',
        3,
        5,
        5.49,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        64,
        'I Want You Back',
        81,
        '2:59',
        1,
        5,
        2.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        65,
        'I Love Rock N Roll',
        82,
        '2:55',
        2,
        5,
        2.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        66,
        'Dont You Want Me?',
        59,
        '3:57',
        3,
        5,
        3.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        67,
        'Jeremy',
        83,
        '5:18',
        1,
        5,
        3.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        9,
        'Heartbreak Hotel',
        84,
        '2:08',
        3,
        4,
        1.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        68,
        'Like a Virgin',
        85,
        '3:11',
        1,
        5,
        2.39,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        3,
        'Beat It',
        86,
        '4:18',
        2,
        5,
        2.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        69,
        'Sweet Child O Mine',
        87,
        '5:56',
        3,
        5,
        3.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        70,
        'Under the Bridge',
        88,
        '4:24',
        1,
        5,
        3.19,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        71,
        'Your Song',
        89,
        '4:02',
        2,
        5,
        2.69,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        72,
        'Dancing 24',
        90,
        '3:31',
        3,
        4,
        1.79,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        27,
        'The Sounds Of Silence',
        91,
        '3:08',
        1,
        5,
        2.09,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        73,
        'Dont Stop Believin''',
        92,
        '4:11',
        2,
        5,
        2.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        74,
        'Soul Man',
        93,
        '2:36',
        3,
        5,
        1.99,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        75,
        'You Shook Me All Night Long',
        94,
        '3:30',
        1,
        5,
        2.59,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        76,
        'Bye Bye Love',
        95,
        '2:20',
        2,
        4,
        1.29,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        77,
        'Earth Angel',
        94,
        '2:53',
        3,
        4,
        1.89,
        ROUND(RANDOM() * 9 + 1)
    ),
    (
        78,
        'Crazy',
        96,
        '4:41',
        1,
        5,
        3.39,
        ROUND(RANDOM() * 9 + 1)
    );

-- Feel free to add more songs or modify the existing ones as needed.