-- Create the genre table
CREATE TABLE IF NOT EXISTS genre (
    genre_id BIGSERIAL PRIMARY KEY NOT NULL,
    genre_name VARCHAR(50) NOT NULL
);

-- Insert data for genres
INSERT INTO
    genre (genre_name)
VALUES
    ('Rock'),
    ('Pop'),
    ('R&B'),
    ('Hip-Hop'),
    ('Country'),
    ('Jazz'),
    ('Blues'),
    ('Electronic'),
    ('Reggae'),
    ('Classical'),
    ('Rap'),
    ('Trap'),
    ('Soul'),
    ('Folk'),
    ('Indie'),
    ('Metal'),
    ('Punk'),
    ('Alternative'),
    ('K-Pop'),
    ('Latin');
    