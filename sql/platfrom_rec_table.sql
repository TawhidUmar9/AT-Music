CREATE TABLE platform (
    platform_id BIGSERIAL PRIMARY KEY NOT NULL,
    platform_name VARCHAR(50) NOT NULL,
    total_visit INTEGER
);

INSERT INTO
    platform (platform_name, total_visit)
VALUES
    ('Spotify', 0),
    ('Apple Music', 0),
    ('Deezer', 0);

CREATE TABLE rec_type (
    rectype_id BIGSERIAL PRIMARY KEY NOT NULL,
    rectype_name VARCHAR(30) NOT NULL
);

INSERT INTO
    rec_type(rectype_name)
VALUES
    ('Studio Recording'),
    ('Live Recording'),
    ('Remote Recording');