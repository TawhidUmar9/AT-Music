CREATE TABLE IF NOT EXISTS album (
    album_id SERIAL PRIMARY KEY NOT NULL,
    album_name VARCHAR(255) NOT NULL,
    artist_id INTEGER NOT NULL,
    album_year INTEGER,
    album_artwork VARCHAR(255),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
    CONSTRAINT unique_album_name_year UNIQUE (album_name, album_year)
);

-- Insert da88ta for the specified albums
INSERT INTO
    album (album_name, artist_id, album_year, album_artwork)
VALUES
    (
        'I Never Loved a Man the Way I Love You',
        1,
        1967,
        'https://upload.wikimedia.org/wikipedia/en/1/15/Aretha_Franklin_%E2%80%93_I_Never_Loved_a_Man_the_Way_I_Love_You.jpg'
    ),
    (
        'Chuck Berry Is on Top',
        2,
        1959,
        'https://upload.wikimedia.org/wikipedia/en/3/3d/Chuck_Berry_Is_on_Top_cover.jpg'
    ),
    (
        'Thriller',
        3,
        1982,
        'https://upload.wikimedia.org/wikipedia/en/5/55/Michael_Jackson_-_Thriller.png'
    ),
    (
        'Rock Around the Clock',
        4,
        1955,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Rock_Around_the_Clock.jpg/330px-Rock_Around_the_Clock.jpg'
    ),
    (
        'Led Zeppelin IV',
        5,
        1971,
        'https://upload.wikimedia.org/wikipedia/en/2/26/Led_Zeppelin_-_Led_Zeppelin_IV.jpg'
    ),
    (
        'Here Are The Kingsmen',
        6,
        1963,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/TheBeatles68LP.jpg/330px-TheBeatles68LP.jpg'
    ),
    (
        'In the Groove',
        7,
        1968,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Mary_Lou_Williams_%28Gottlieb_09231%29_-_Crop.jpg/330px-Mary_Lou_Williams_%28Gottlieb_09231%29_-_Crop.jpg'
    ),
    (
        'Out of Our Heads',
        8,
        1965,
        'https://upload.wikimedia.org/wikipedia/en/b/bd/Out%2Bof%2BOur%2BHeads%2B-UK-.jpg'
    ),
    (
        'Jailhouse Rock',
        9,
        1957,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Jailhouse_Rock_%281957_poster_-_one-sheet%29.jpg/330px-Jailhouse_Rock_%281957_poster_-_one-sheet%29.jpg'
    ),
    (
        'Highway 61 Revisited',
        10,
        1965,
        'https://upload.wikimedia.org/wikipedia/en/9/95/Bob_Dylan_-_Highway_61_Revisited.jpg'
    ),
    (
        'The Beatles (White Album)',
        11,
        1968,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/TheBeatles68LP.jpg/330px-TheBeatles68LP.jpg'
    ),
    (
        'Smiley Smile',
        12,
        1967,
        'https://upload.wikimedia.org/wikipedia/en/5/5d/Smileysmilebeachboys.png'
    ),
    (
        'Here''s Little Richard',
        13,
        1957,
        'https://upload.wikimedia.org/wikipedia/en/c/c0/Hereslittlerichard.jpeg'
    ),
    (
        'What''d I Say',
        14,
        1959,
        'https://upload.wikimedia.org/wikipedia/en/4/46/%22What%27d_I_Say%22_single_face_label.png'
    ),
    (
        'Hotel California',
        15,
        1976,
        'https://upload.wikimedia.org/wikipedia/en/2/20/Hotel_California_by_the_Eagles_US_vinyl_single.png'
    ),
    (
        'Youve Lost That Lovin Feelin',
        16,
        1964,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/You%27ve_Lost_That_Lovin%27_Feelin%27_by_The_Righteous_Brothers_US_vinyl.png/330px-You%27ve_Lost_That_Lovin%27_Feelin%27_by_The_Righteous_Brothers_US_vinyl.png'
    ),
    (
        'The Temptations Sing Smokey',
        17,
        1965,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Imagine',
        18,
        1971,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Whats Going On',
        7,
        1971,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Nevermind',
        19,
        1991,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Elvis Rock n Roll No. 2',
        9,
        1957,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Born to Run',
        20,
        1975,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The Doors',
        21,
        1967,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Talking Book',
        22,
        1972,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Layla and Other Assorted Love Songs',
        23,
        1970,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'A Night at the Opera',
        24,
        1975,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Sgt. Pepper''s Lonely Hearts Club Band',
        11,
        1967,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Eddie Cochran',
        25,
        1960,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Kinks',
        26,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Bridge Over Troubled Water',
        27,
        1970,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Let''s Stay Together',
        28,
        1972,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Little Richard',
        13,
        1958,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Are You Experienced',
        29,
        1967,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'A Hard Day''s Night',
        11,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Whole Lot of Shakin'' Going On',
        30,
        1957,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The "Chirping" Crickets',
        31,
        1957,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Synchronicity',
        32,
        1983,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Speakerboxxx/The Love Below',
        33,
        2003,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'I Got You (I Feel Good)',
        34,
        1965,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Purple Rain',
        35,
        1984,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'My Generation',
        36,
        1965,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Out of Time',
        37,
        1991,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Disraeli Gears',
        38,
        1967,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Led Zeppelin II',
        39,
        1969,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Achtung Baby',
        5,
        1991,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Aint That Good News',
        40,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'John Wesley Harding',
        41,
        1967,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Message from Beat Street',
        29,
        1984,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Jerry Lee Lewis',
        42,
        1958,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'In The Midnight Hour',
        30,
        1965,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Mr. Tambourine Man',
        43,
        196,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images5'
    ),
    (
        'Bayou Country',
        44,
        1969,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Shake, Rattle And Roll',
        45,
        1954,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Toys in the Attic',
        46,
        1975,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Let It Be',
        47,
        1970,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Every Picture Tells a Story',
        11,
        1971,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'American Pie',
        48,
        1971,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The Dock of the Bay',
        49,
        1968,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Elvis Presley',
        50,
        1956,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Elvis (1956)',
        9,
        1956,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Whos Next',
        9,
        1971,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Saturday Night Fever',
        37,
        1977,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Pronounced Lĕh nérd Skin nérd',
        51,
        1973,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The Chronic',
        52,
        1992,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Sticky Fingers',
        53,
        1971,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Let''s Get It On',
        8,
        1973,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'When a Man Loves a Woman',
        7,
        1966,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Meet the Beatles!',
        54,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Ben E. King Sings for Soulful Lovers',
        9,
        1962,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Love Tracks',
        55,
        1978,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Street Songs',
        56,
        1981,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Procol Harum',
        57,
        1967,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Presenting the Fabulous Ronettes Featuring Veronica',
        58,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Rumours',
        59,
        1977,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'All Directions',
        60,
        1972,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The Animals',
        17,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Help!',
        61,
        1965,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Where Did Our Love Go',
        11,
        1964,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Sugarhill Gang',
        62,
        1980,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Diana Ross Presents The Jackson 5',
        63,
        1969,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'I Love Rock n Roll',
        64,
        1981,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Dare',
        65,
        1981,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Ten',
        67,
        1991,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Like a Virgin',
        9,
        1984,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Appetite for Destruction',
        68,
        1987,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Blood Sugar Sex Magik',
        3,
        1991,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Elton John',
        69,
        1970,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Arrival',
        70,
        1976,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Sounds of Silence',
        71,
        1966,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Escape',
        72,
        1981,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Soul Men',
        27,
        1967,
        '
    https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Back in Black',
        73,
        1980,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The Everly Brothers',
        74,
        1958,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'The Penguins',
        75,
        1954,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Kerosene Hat',
        77,
        1993,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    ),
    (
        'Showcase',
        78,
        1961,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1og9IaU3ZH7psSrD_NKisgHaE8%26pid%3DApi&f=1&ipt=dbdc5fa8b6c7bfa25eee90d006f160308ce590597861d6cb0fbdc4c0af5ca0b8&ipo=images'
    );

-- Feel free to add more albums or modify the existing ones as needed.