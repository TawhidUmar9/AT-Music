CREATE TABLE IF NOT EXISTS genre (
    genre_id BIGSERIAL PRIMARY KEY NOT NULL,
    genre_name VARCHAR(50) NOT NULL,
    genre_image_url VARCHAR(255)
);

-- Insert data for genres
INSERT INTO
    genre (genre_name, genre_image_url)
VALUES
    (
        'Rock',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.YNhN4rU9JwDuvh__f8TnTQHaHa%26pid%3DApi&f=1&ipt=fbdd008f906d2fb69119f1476965a1d9431fd82156b499e64fd1dfd868796085&ipo=images'
    ),
    (
        'Pop',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'R&B',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Hip-Hop',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Country',
        'https://emby.media/community/uploads/monthly_2020_08/country.png.7ce72a5b848d9489c491b442d9de3b20.png'
    ),
    (
        'Jazz',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Blues',
        'https://emby.media/community/uploads/monthly_2020_08/blues.png.f2db5148877e864d6645ebf1be696f47.png'
    ),
    (
        'Electronic',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Reggae',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Classical',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Rap',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Trap',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Soul',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Folk',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Indie',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Metal',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Punk',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.Iqxxk3Nh7G_6GOx4t57BQgHaHa%26pid%3DApi&f=1&ipt=4c1d3c18d0d045a4f8ee7ae61870329c6831235074acd5396b0b75c30746e2a6&ipo=images'
    ),
    (
        'Alternative',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.explicit.bing.net%2Fth%3Fid%3DOIP.YqLHtLt8pEe1Lo1xndhAogHaHa%26pid%3DApi&f=1&ipt=5eeaebf5d56b832fe0ae44f27831214cc874a8912480def4e0e439e456852ecd&ipo=images'
    ),
    (
        'K-Pop',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    ),
    (
        'Latin',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jVjFElbO2HfaWLsv_trBFQHaE8%26pid%3DApi&f=1&ipt=4bf136cb30afa2f4ee2510a95d07477a70fdd4b16fff0906b6cb8f4a2e249f6c&ipo=images'
    );



ALTER TABLE genre
ADD COLUMN total_sold INTEGER DEFAULT 0;