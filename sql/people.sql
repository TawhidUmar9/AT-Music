CREATE TABLE IF NOT EXISTS people(
    person_id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    biography TEXT
);

CREATE TABLE IF NOT EXISTS composer (
    composer_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (composer_id) REFERENCES people(person_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE,
    PRIMARY KEY (composer_id, song_id)
);

CREATE TABLE IF NOT EXISTS producer (
    producer_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (producer_id) REFERENCES people(person_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE,
    PRIMARY KEY (producer_id, song_id)
);

CREATE TABLE IF NOT EXISTS lyricist (
    lyricist_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (lyricist_id) REFERENCES people(person_id),
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE,
    PRIMARY KEY (lyricist_id, song_id)
);

INSERT INTO
    people(name, nationality, gender, biography)
VALUES
    (
        'Quincy Jones',
        'American',
        'Male',
        'Quincy Jones is an iconic American music producer, composer, and arranger known for his work across various genres.
        He'' s famous for producing Michael Jackson ''s hit albums like "Off the Wall" and "Thriller." With 28 Grammy Awards, he'' s one of the most awarded artists.Jones has also made significant contributions to film
        and television,
        composing scores for movies like "The Color Purple."
        He ''s known for his versatility, social activism, 
        and lasting impact on the music industry.'
    ),
    (
        'Micheal Jackson',
        'American',
        'Male',
        'Michael Jackson, born in 1958, was a music icon known as the "King of Pop.
        " Rising to fame with the Jackson 5,
        he later pursued a hugely successful solo career,
        releasing groundbreaking albums like "Thriller."
        Renowned for his innovative dance moves and iconic music videos,
        Jackson''s legacy extends beyond music to include philanthropy and cultural influence.
        Despite controversies, his impact on popular culture remains profound even 
        after his death.'
    ),
    (
        'Jimmy Page',
        'British',
        'Male',
        'Jimmy Page is a legendary English musician, songwriter, and producer,
        best known as the guitarist and founder of the iconic rock band Led Zeppelin.
        With his innovative guitar playing and songwriting skills,
        he helped shape the landscape of rock music. Page''s 
        influence extends beyond Led Zeppelin,
         as he has collaborated with numerous artists and
          continues to be revered as one of the greatest guitarists of all time.'
    ),
    (
        'Robert Plant',
        'British',
        'Male',
        'Robert Plant is an English singer-songwriter best
        known as the lead vocalist of Led Zeppelin, one of the greatest rock
        bands of all time. With his powerful voice and poetic lyrics,
        he helped define the sound of rock music in the 1970s.
        After Led Zeppelin, Plant pursued a successful solo career,
        exploring various musical styles.
        He remains a legendary figure in the music industry,
        celebrated for his contributions to rock music.'
    );

INSERT INTO
    composer(composer_id, song_id)
VALUES
    (2, 3),
    (3, 5);

INSERT INTO
    producer(producer_id, song_id)
VALUES
    (1, 3),
    (3, 5);

INSERT INTO
    lyricist(lyricist_id, song_id)
VALUES
    (2, 3),
    (4, 5);