CREATE TABLE artist (
    artist_id BIGSERIAL NOT NULL PRIMARY KEY,
    artist_name VARCHAR(100),
    alias VARCHAR(100),
    artist_intro_video VARCHAR(255),
    artist_image VARCHAR(255),
    small_biography TEXT
);

INSERT INTO
    artist (artist_name, alias, small_biography, artist_intro_video, artist_image)
VALUES
    (
        'Aretha Franklin',
        'Queen of Soul',
        'Legendary singer known for her powerful voice.',
        'https://youtu.be/EtTn5aLXZZg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Aretha_Franklin_1968.jpg/330px-Aretha_Franklin_1968.jpg'
    ),
    (
        'Chuck Berry',
        'Father of Rock and Roll',
        'Pioneer of rock music and iconic guitarist.',
        'https://youtu.be/v124f0i0Xh4',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Chuck_Berry_1957.jpg/330px-Chuck_Berry_1957.jpg'
    ),
    (
        'Michael Jackson',
        'King of Pop',
        'Global pop sensation and innovative entertainer.',
        'https://youtu.be/WEdZOzZG5As',
        'https://upload.wikimedia.org/wikipedia/commons/3/31/Michael_Jackson_in_1988.jpg'
    ),
    (
        'Bill Haley & His Comets',
        'Rock and Roll Trailblazers',
        'Early rock and roll pioneers.',
        'https://youtu.be/DWkuM2IPbZQ',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Bill_Haley_and_the_Comets1956.jpg/330px-Bill_Haley_and_the_Comets1956.jpg'
    ),
    (
        'Led Zeppelin',
        'Legendary Rock Band',
        'Known for their iconic rock anthems.',
        'https://youtu.be/uONOELwhTKc',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/LedZeppelinmontage.jpg/330px-LedZeppelinmontage.jpg'
    ),
    (
        'The Kingsmen',
        'Garage Rock Pioneers',
        'Famous for the hit song  Louie Louie .',
        'https://youtu.be/GHgNq9dMViQ',
        'https://upload.wikimedia.org/wikipedia/en/4/4f/Kingsmen.jpg'
    ),
    (
        'Marvin Gaye',
        'Prince of Soul',
        'Smooth and soulful vocalist with social consciousness.',
        'https://youtu.be/hYVCwXkdht4',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Marvin_Gaye_%281973_publicity_photo%29.jpg/330px-Marvin_Gaye_%281973_publicity_photo%29.jpg'
    ),
    (
        'The Rolling Stones',
        'Rock Legends',
        'Long-standing rock band with numerous hits.',
        'https://youtu.be/Xb3fZmkzy84',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/The_Rolling_Stones_Summerfest_in_Milwaukee_-_2015.jpg/415px-The_Rolling_Stones_Summerfest_in_Milwaukee_-_2015.jpg'
    ),
    (
        'Elvis Presley',
        'King of Rock and Roll',
        'Iconic figure in the history of rock music.',
        'https://youtu.be/xqBdTn3_0Rw',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Elvis_Presley_promoting_Jailhouse_Rock.jpg/330px-Elvis_Presley_promoting_Jailhouse_Rock.jpg'
    ),
    (
        'Bob Dylan',
        'Voice of a Generation',
        'Nobel Prize-winning singer-songwriter.',
        'https://youtu.be/OeP4FFr88SQ',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Bob_Dylan_-_Azkena_Rock_Festival_2010_2.jpg/330px-Bob_Dylan_-_Azkena_Rock_Festival_2010_2.jpg'
    ),
    (
        'The Beatles',
        'Fab Four',
        'Revolutionized music and pop culture.',
        'https://youtu.be/1aU8Of01izY',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/The_Beatles_members_at_New_York_City_in_1964.jpg/330px-The_Beatles_members_at_New_York_City_in_1964.jpg'
    ),
    (
        'The Beach Boys',
        'Harmony Masters',
        'Influential for their vocal harmonies and beach-themed music.',
        'https://youtu.be/5a4YupnT1sM',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/The_Beach_Boys%2C_May_29%2C_2012.jpg/411px-The_Beach_Boys%2C_May_29%2C_2012.jpg'
    ),
    (
        'Little Richard',
        'Architect of Rock and Roll',
        'Energetic and flamboyant rock and roll pioneer.',
        'https://youtu.be/R_KQd9Oe1p8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Little_Richard_in_2007_%28cropped%29.jpg/330px-Little_Richard_in_2007_%28cropped%29.jpg'
    ),
    (
        'Ray Charles',
        'Genius of Soul',
        'Blind pianist and soulful singer.',
        'https://youtu.be/SHRuA3fUOYY',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Ray_Charles_classic_piano_pose.jpg/330px-Ray_Charles_classic_piano_pose.jpg'
    ),
    (
        'Eagles',
        'Rock Superstars',
        'Famous for their harmonious sound and hit songs.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Eagles.jpg/450px-Eagles.jpg'
    ),
    (
        'The Righteous Brothers',
        'Blue-Eyed Soul',
        'Known for the emotional ballad  Youve Lost That Lovin Feelin',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/TheRighteousBrothersperformingKBF.jpg/450px-TheRighteousBrothersperformingKBF.jpg'
    ),
    (
        'The Temptations',
        'Motown Legends',
        'Smooth vocal group with soulful hits.',
        'https://youtu.be/zdOyO4f4w0w?list=PLRl7dddF_ZTHqQKraj2qdC9Zqi3phIDWK',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/The-Temptations_%281964_publicity_photo_by_Kriegsmann%29.jpg/330px-The-Temptations_%281964_publicity_photo_by_Kriegsmann%29.jpg'
    ),
    (
        'John Lennon',
        'Imagine',
        'Co-founder of The Beatles and influential solo artist.',
        'https://youtu.be/E-96Ry6oidU?list=PLRl7dddF_ZTHqQKraj2qdC9Zqi3phIDWK',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/John_Lennon%2C_1974_%28restored_cropped%29.jpg/330px-John_Lennon%2C_1974_%28restored_cropped%29.jpg'
    ),
    (
        'Nirvana',
        'Grunge Pioneers',
        'Led by Kurt Cobain, influential in the grunge movement.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/1/19/Nirvana_around_1992.jpg'
    ),
    (
        'Bruce Springsteen',
        'The Boss',
        'Energetic rock performer and songwriter.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Bruce_Springsteen_-_Roskilde_Festival_2012.jpg/330px-Bruce_Springsteen_-_Roskilde_Festival_2012.jpg'
    ),
    (
        'The Doors',
        'Psychedelic Rock',
        'Known for their poetic lyrics and unique sound.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/The_Doors_1968.JPG/375px-The_Doors_1968.JPG'
    ),
    (
        'Stevie Wonder',
        'Musical Prodigy',
        'Blind since birth, multi-instrumentalist and soulful singer.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Derek and the Dominos (Eric Clapton)',
        'Blues-Rock Supergroup',
        'Led by Eric Clapton, famous for Layla .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Queen',
        'Champions',
        'Legendary rock band with diverse musical styles.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Eddie Cochran',
        'Rockabilly Star',
        'Influential rock and roll and rockabilly artist.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Kinks',
        'British Invasion',
        'Known for their distinctive sound and witty lyrics.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Simon & Garfunkel',
        'Folk Rock Duo',
        'Harmonious duo with poetic and introspective songs.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Al Green',
        'The Reverend',
        'Smooth soul singer and ordained pastor.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Jimi Hendrix',
        'Guitar Virtuoso',
        'Innovative guitarist and rock icon.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Jerry Lee Lewis',
        'The Killer',
        'Energetic and flamboyant rock and roll pioneer.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Buddy Holly',
        'Rockabilly Legend',
        'Influential figure in the early days of rock and roll.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Police',
        'New Wave Icons',
        'Sting-led band with a blend of rock and new wave.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'OutKast',
        'Hip-Hop Duo',
        'Andre 3000 and Big Boi, known for their genre-blending music.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Bo Diddley',
        'Bo Diddley Beat',
        'Innovative guitarist and rhythm pioneer.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'James Brown',
        'Godfather of Soul',
        'The hardest-working man in show business.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Prince',
        'Purple One',
        'Musical genius and innovative artist.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Who',
        'Rock Legends',
        'Known for their energetic performances and concept albums.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'R.E.M.',
        'Alternative Pioneers',
        'Influential in the alternative rock genre.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Cream',
        'Supergroup',
        'Eric Clapton, Ginger Baker, and Jack Bruce in a rock supergroup.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'U2',
        'Irish Rock Icons',
        'Led by Bono, known for their anthemic rock songs.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Sam Cooke',
        'Soulful Crooner',
        'One of the greatest soul and R&B singers.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Grandmaster Flash and the Furious Five',
        'Hip-Hop Pioneers',
        'Influential in the early days of hip-hop.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Wilson Pickett',
        'Wicked Pickett',
        'Soulful singer known for his powerful voice.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Byrds',
        'Folk Rock Pioneers',
        'Known for blending folk and rock elements.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Creedence Clearwater Revival',
        'Swamp Rock',
        'Led by John Fogerty, known for their swamp rock sound.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Big Joe Turner',
        'Boss of the Blues',
        'Blues and R&B singer with a powerful voice.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Aerosmith',
        'Bad Boys from Boston',
        'Hard rock band with a string of hits.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Rod Stewart',
        'Rod the Mod',
        'Versatile rocker with a raspy voice.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Don McLean',
        'American Pie',
        'Folk singer-songwriter known for the iconic song.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Otis Redding',
        'King of Soul',
        'Influential soul singer with a raw emotive style.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Bee Gees',
        'Disco Legends',
        'Famous for their contributions to the disco era.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Lynyrd Skynyrd',
        'Southern Rock Pioneers',
        'Known for  Free Bird  and  Sweet Home Alabama .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Dr. Dre',
        'Hip-Hop Mogul',
        'Legendary rapper, producer,',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Percy Sledge',
        'Soulful Balladeer',
        'Known for the classic  When a Man Loves a Woman .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Ben E. King',
        'Stand By Me',
        'R&B and soul singer, famous for the timeless hit  Stand By Me .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Gloria Gaynor',
        'Queen of Disco',
        'Iconic disco singer, best known for  I Will Survive .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Rick James',
        'Super Freak',
        'Funky and flamboyant artist, famous for  Super Freak .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Procol Harum',
        'Progressive Rock',
        'Known for the classic  A Whiter Shade of Pale .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Ronettes',
        'Girl Group',
        'Legendary girl group, famous for  Be My Baby .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Fleetwood Mac',
        'Rock Legends',
        'British-American rock band with a string of hits.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Animals',
        'British Invasion',
        'Rock band known for hits like  House of the Rising Sun .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Supremes',
        'Motown Royalty',
        'One of Motowns most successful acts with numerous chart-topping hits.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Sugarhill Gang',
        'Hip-Hop Pioneers',
        'Early hip-hop group known for the groundbreaking  Rappers Delight .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Jackson 5',
        'Motown Sensation',
        'Childhood group of Michael Jackson, known for hits like  I Want You Back .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Joan Jett & The Blackhearts',
        'Rock Goddess',
        'Punk rock and rock artist, famous for  I Love Rock N Roll .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Human League',
        'Synth-Pop Pioneers',
        'Electropop band known for hits like  Dont You Want Me .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Pearl Jam',
        'Grunge Icons',
        'Influential grunge band with hits like  Jeremy  and  Alive .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Madonna',
        'Queen of Pop',
        'Iconic pop singer, actress, and cultural influencer.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Guns N  Roses',
        'Rock Icons',
        'Hard rock band with hits like  Sweet Child O Mine  and  November Rain .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Red Hot Chili Peppers',
        'Funky Rockers',
        'Alternative rock band with a fusion of funk and rock elements.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Elton John',
        'Rocket Man',
        'Legendary singer-songwriter and pianist with a vast catalog of hits.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'ABBA',
        'Swedish Pop Sensation',
        'One of the most successful pop groups in history, known for  Dancing Queen .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Journey',
        'Arena Rock Legends',
        'Rock band with anthemic hits like  Dont Stop Believin.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Sam & Dave',
        'Soul Duo',
        'Soulful duo known for hits like  Soul Man  and  Hold On, Im Comin .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'AC/DC',
        'Rock or Bust',
        'Legendary rock band known for their electrifying performances.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Everly Brothers',
        'Harmony Kings',
        'Influential duo known for their close harmonies and rockabilly sound.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'The Penguins',
        'Doo-Wop Legends',
        'Doo-wop group famous for the classic  Earth Angel .',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    ),
    (
        'Patsy Cline',
        'Queen of Country',
        'Country music icon known for her timeless songs and emotional performances.',
        'https://youtu.be/P1y2uynnONs?t=8',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/The_Sounds_of_Earth_-_GPN-2000-001976.jpg/260px-The_Sounds_of_Earth_-_GPN-2000-001976.jpg'
    );