CREATE TABLE artist (
    artist_id BIGSERIAL NOT NULL PRIMARY KEY,
    artist_name VARCHAR(100),
    alias VARCHAR(100),
    small_biography TEXT
);

INSERT INTO
    artist (artist_name, alias, small_biography)
VALUES
    (
        'Aretha Franklin',
        'Queen of Soul',
        'Legendary singer known for her powerful voice.'
    ),
    (
        'Chuck Berry',
        'Father of Rock and Roll',
        'Pioneer of rock music and iconic guitarist.'
    ),
    (
        'Michael Jackson',
        'King of Pop',
        'Global pop sensation and innovative entertainer.'
    ),
    (
        'Bill Haley & His Comets',
        'Rock and Roll Trailblazers',
        'Early rock and roll pioneers.'
    ),
    (
        'Led Zeppelin',
        'Legendary Rock Band',
        'Known for their iconic rock anthems.'
    ),
    (
        'The Kingsmen',
        'Garage Rock Pioneers',
        'Famous for the hit song  Louie Louie .'
    ),
    (
        'Marvin Gaye',
        'Prince of Soul',
        'Smooth and soulful vocalist with social consciousness.'
    ),
    (
        'The Rolling Stones',
        'Rock Legends',
        'Long-standing rock band with numerous hits.'
    ),
    (
        'Elvis Presley',
        'King of Rock and Roll',
        'Iconic figure in the history of rock music.'
    ),
    (
        'Bob Dylan',
        'Voice of a Generation',
        'Nobel Prize-winning singer-songwriter.'
    ),
    (
        'The Beatles',
        'Fab Four',
        'Revolutionized music and pop culture.'
    ),
    (
        'The Beach Boys',
        'Harmony Masters',
        'Influential for their vocal harmonies and beach-themed music.'
    ),
    (
        'Little Richard',
        'Architect of Rock and Roll',
        'Energetic and flamboyant rock and roll pioneer.'
    ),
    (
        'Ray Charles',
        'Genius of Soul',
        'Blind pianist and soulful singer.'
    ),
    (
        'Eagles',
        'Rock Superstars',
        'Famous for their harmonious sound and hit songs.'
    ),
    (
        'The Righteous Brothers',
        'Blue-Eyed Soul',
        'Known for the emotional ballad  Youve Lost That Lovin Feelin'
    ),
    (
        'The Temptations',
        'Motown Legends',
        'Smooth vocal group with soulful hits.'
    ),
    (
        'John Lennon',
        'Imagine',
        'Co-founder of The Beatles and influential solo artist.'
    ),
    (
        'Nirvana',
        'Grunge Pioneers',
        'Led by Kurt Cobain, influential in the grunge movement.'
    ),
    (
        'Bruce Springsteen',
        'The Boss',
        'Energetic rock performer and songwriter.'
    ),
    (
        'The Doors',
        'Psychedelic Rock',
        'Known for their poetic lyrics and unique sound.'
    ),
    (
        'Stevie Wonder',
        'Musical Prodigy',
        'Blind since birth, multi-instrumentalist and soulful singer.'
    ),
    (
        'Derek and the Dominos (Eric Clapton)',
        'Blues-Rock Supergroup',
        'Led by Eric Clapton, famous for Layla .'
    ),
    (
        'Queen',
        'Champions',
        'Legendary rock band with diverse musical styles.'
    ),
    (
        'Eddie Cochran',
        'Rockabilly Star',
        'Influential rock and roll and rockabilly artist.'
    ),
    (
        'The Kinks',
        'British Invasion',
        'Known for their distinctive sound and witty lyrics.'
    ),
    (
        'Simon & Garfunkel',
        'Folk Rock Duo',
        'Harmonious duo with poetic and introspective songs.'
    ),
    (
        'Al Green',
        'The Reverend',
        'Smooth soul singer and ordained pastor.'
    ),
    (
        'Jimi Hendrix',
        'Guitar Virtuoso',
        'Innovative guitarist and rock icon.'
    ),
    (
        'Jerry Lee Lewis',
        'The Killer',
        'Energetic and flamboyant rock and roll pioneer.'
    ),
    (
        'Buddy Holly',
        'Rockabilly Legend',
        'Influential figure in the early days of rock and roll.'
    ),
    (
        'The Police',
        'New Wave Icons',
        'Sting-led band with a blend of rock and new wave.'
    ),
    (
        'OutKast',
        'Hip-Hop Duo',
        'Andre 3000 and Big Boi, known for their genre-blending music.'
    ),
    (
        'Bo Diddley',
        'Bo Diddley Beat',
        'Innovative guitarist and rhythm pioneer.'
    ),
    (
        'James Brown',
        'Godfather of Soul',
        'The hardest-working man in show business.'
    ),
    (
        'Prince',
        'Purple One',
        'Musical genius and innovative artist.'
    ),
    (
        'The Who',
        'Rock Legends',
        'Known for their energetic performances and concept albums.'
    ),
    (
        'R.E.M.',
        'Alternative Pioneers',
        'Influential in the alternative rock genre.'
    ),
    (
        'Cream',
        'Supergroup',
        'Eric Clapton, Ginger Baker, and Jack Bruce in a rock supergroup.'
    ),
    (
        'U2',
        'Irish Rock Icons',
        'Led by Bono, known for their anthemic rock songs.'
    ),
    (
        'Sam Cooke',
        'Soulful Crooner',
        'One of the greatest soul and R&B singers.'
    ),
    (
        'Grandmaster Flash and the Furious Five',
        'Hip-Hop Pioneers',
        'Influential in the early days of hip-hop.'
    ),
    (
        'Wilson Pickett',
        'Wicked Pickett',
        'Soulful singer known for his powerful voice.'
    ),
    (
        'The Byrds',
        'Folk Rock Pioneers',
        'Known for blending folk and rock elements.'
    ),
    (
        'Creedence Clearwater Revival',
        'Swamp Rock',
        'Led by John Fogerty, known for their swamp rock sound.'
    ),
    (
        'Big Joe Turner',
        'Boss of the Blues',
        'Blues and R&B singer with a powerful voice.'
    ),
    (
        'Aerosmith',
        'Bad Boys from Boston',
        'Hard rock band with a string of hits.'
    ),
    (
        'Rod Stewart',
        'Rod the Mod',
        'Versatile rocker with a raspy voice.'
    ),
    (
        'Don McLean',
        'American Pie',
        'Folk singer-songwriter known for the iconic song.'
    ),
    (
        'Otis Redding',
        'King of Soul',
        'Influential soul singer with a raw emotive style.'
    ),
    (
        'Bee Gees',
        'Disco Legends',
        'Famous for their contributions to the disco era.'
    ),
    (
        'Lynyrd Skynyrd',
        'Southern Rock Pioneers',
        'Known for  Free Bird  and  Sweet Home Alabama .'
    ),
    (
        'Dr. Dre',
        'Hip-Hop Mogul',
        'Legendary rapper, producer,'
    ),
    (
        'Percy Sledge',
        'Soulful Balladeer',
        'Known for the classic  When a Man Loves a Woman .'
    ),
    (
        'Ben E. King',
        'Stand By Me',
        'R&B and soul singer, famous for the timeless hit  Stand By Me .'
    ),
    (
        'Gloria Gaynor',
        'Queen of Disco',
        'Iconic disco singer, best known for  I Will Survive .'
    ),
    (
        'Rick James',
        'Super Freak',
        'Funky and flamboyant artist, famous for  Super Freak .'
    ),
    (
        'Procol Harum',
        'Progressive Rock',
        'Known for the classic  A Whiter Shade of Pale .'
    ),
    (
        'The Ronettes',
        'Girl Group',
        'Legendary girl group, famous for  Be My Baby .'
    ),
    (
        'Fleetwood Mac',
        'Rock Legends',
        'British-American rock band with a string of hits.'
    ),
    (
        'The Animals',
        'British Invasion',
        'Rock band known for hits like  House of the Rising Sun .'
    ),
    (
        'The Supremes',
        'Motown Royalty',
        'One of Motowns most successful acts with numerous chart-topping hits.'
    ),
    (
        'Sugarhill Gang',
        'Hip-Hop Pioneers',
        'Early hip-hop group known for the groundbreaking  Rappers Delight .'
    ),
    (
        'The Jackson 5',
        'Motown Sensation',
        'Childhood group of Michael Jackson, known for hits like  I Want You Back .'
    ),
    (
        'Joan Jett & The Blackhearts',
        'Rock Goddess',
        'Punk rock and rock artist, famous for  I Love Rock N Roll .'
    ),
    (
        'The Human League',
        'Synth-Pop Pioneers',
        'Electropop band known for hits like  Dont You Want Me .'
    ),
    (
        'Pearl Jam',
        'Grunge Icons',
        'Influential grunge band with hits like  Jeremy  and  Alive .'
    ),
    (
        'Madonna',
        'Queen of Pop',
        'Iconic pop singer, actress, and cultural influencer.'
    ),
    (
        'Guns N  Roses',
        'Rock Icons',
        'Hard rock band with hits like  Sweet Child O Mine  and  November Rain .'
    ),
    (
        'Red Hot Chili Peppers',
        'Funky Rockers',
        'Alternative rock band with a fusion of funk and rock elements.'
    ),
    (
        'Elton John',
        'Rocket Man',
        'Legendary singer-songwriter and pianist with a vast catalog of hits.'
    ),
    (
        'ABBA',
        'Swedish Pop Sensation',
        'One of the most successful pop groups in history, known for  Dancing Queen .'
    ),
    (
        'Journey',
        'Arena Rock Legends',
        'Rock band with anthemic hits like  Dont Stop Believin.'
    ),
    (
        'Sam & Dave',
        'Soul Duo',
        'Soulful duo known for hits like  Soul Man  and  Hold On, Im Comin .'
    ),
    (
        'AC/DC',
        'Rock or Bust',
        'Legendary rock band known for their electrifying performances.'
    ),
    (
        'The Everly Brothers',
        'Harmony Kings',
        'Influential duo known for their close harmonies and rockabilly sound.'
    ),
    (
        'The Penguins',
        'Doo-Wop Legends',
        'Doo-wop group famous for the classic  Earth Angel .'
    ),
    (
        'Patsy Cline',
        'Queen of Country',
        'Country music icon known for her timeless songs and emotional performances.'
    );