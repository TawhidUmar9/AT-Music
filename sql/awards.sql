CREATE TABLE IF NOT EXISTS awards_list (
    award_id BIGSERIAL PRIMARY KEY NOT NULL,
    award_name VARCHAR(50) NOT NULL,
    award_category VARCHAR(50) NOT NULL,
    category_description VARCHAR(255) NOT NULL
);

INSERT INTO
    awards_list (award_name, award_category, category_description)
VALUES
    (
        'Grammy Awards',
        'Music',
        'Recognizes excellence across various music genres.'
    ),
    (
        'MTV Video Music Awards (VMAs)',
        'Music Video',
        'Honors outstanding achievements in music videos.'
    ),
    (
        'Billboard Music Awards',
        'Music',
        'Recognizes artists based on their chart performance in the United States.'
    ),
    (
        'American Music Awards (AMAs)',
        'Music',
        'Based on fan voting, honors outstanding achievements in the music industry.'
    ),
    (
        'Brit Awards',
        'Music',
        'Presented annually by the British Phonographic Industry to honor excellence in music.'
    ),
    (
        'Country Music Association Awards (CMA Awards)',
        'Country Music',
        'Honors achievements in country music.'
    ),
    (
        'Academy of Country Music Awards (ACM Awards)',
        'Country Music',
        'Recognizes excellence in country music.'
    ),
    (
        'Juno Awards',
        'Music',
        'Presented by the Canadian Academy of Recording Arts and Sciences, honors Canadian music artists.'
    ),
    (
        'BET Awards',
        'Music',
        'Celebrates achievements in music, acting, sports, and other fields within the African American community.'
    ),
    (
        'MTV Europe Music Awards (EMAs)',
        'Music',
        'Similar to the VMAs but focused on the European music scene, honors artists across various categories.'
    );

CREATE TABLE IF NOT EXISTS awards(
    award_id INTEGER REFERENCES awards_list(award_id) ON DELETE CASCADE NOT NULL,
    artist_id INTEGER REFERENCES artist(artist_id) ON DELETE CASCADE NOT NULL,
    awards_year INTEGER
);

INSERT INTO
    awards(award_id, artist_id)
VALUES
    (1, 1),
    (1, 3),
    (1, 4),
    (1, 9),
    (2, 1),
    (2, 4),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 9),
    (3, 10),
    (5, 1),
    (2, 4),
    (2, 3);