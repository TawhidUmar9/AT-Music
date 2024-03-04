-- Create the genre table
CREATE TABLE IF NOT EXISTS genre (
    genre_id BIGSERIAL PRIMARY KEY NOT NULL,
    genre_name VARCHAR(50) NOT NULL
);

-- Insert data for genres
INSERT INTO
    genre (genre_name)
VALUES
    ('Rock','https://images.pexels.com/photos/164693/pexels-photo-164693.jpeg?auto=compress&cs=tinysrgb&w=600'),
    ('Pop','https://images.pexels.com/photos/219101/pexels-photo-219101.jpeg?auto=compress&cs=tinysrgb&w=600'),
    ('R&B','https://images.pexels.com/photos/15894591/pexels-photo-15894591/free-photo-of-electric-guitar-on-blanket.jpeg?auto=compress&cs=tinysrgb&w=600'),
    ('Hip-Hop','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.QkZKyT_KRDLkiGj5SQxs0wHaFj%26pid%3DApi&f=1&ipt=07bbf45e463988a92afef7fdc0370cf992852b4ecba41d8879c685a2b65df05e&ipo=images'),
    ('Country','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.UBmLzgzRcXL2_upOiqR2ngHaFj%26pid%3DApi&f=1&ipt=d39b344a9bc0fe230401239d2f441f5f2cfa7b57d8f0c90b68b7ebb8140d2333&ipo=images'),
    ('Jazz'),
    ('Blues'),
    ('Electronic'),
    ('Reggae'),
    ('Classical'),
    ('Rap','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Ur6iIJkdIDzRobYNRtR5pwHaE8%26pid%3DApi&f=1&ipt=aa672ff0dccc73daebabc96cc59502d3c7fc583db7c0b41c63812c6960795753&ipo=images'),
    ('Trap'),
    ('Soul'),
    ('Folk'),
    ('Indie'),
    ('Metal'),
    ('Punk'),
    ('Alternative'),
    ('K-Pop'),
    ('Latin');
    