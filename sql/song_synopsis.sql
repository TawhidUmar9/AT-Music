CREATE TABLE IF NOT EXISTS song_synopsis(
    song_id INTEGER NOT NULL,
    synopsis TEXT NOT NULL
);

INSERT INTO
    song_synopsis(song_id, synopsis)
VALUES
    (
        3,
        'The song "Billie Jean" tells the story of a woman who claims 
        that the narrator is the father of her child.
        Despite the narrator''s denial, the woman continues to insist on her accusation.
        The song explores themes of paranoia, distrust, and the consequences of fame.
        The narrator''s repeated refrain of "the kid is not my son" 
        highlights his frustration and determination to refute the woman''s claims.
        Ultimately, "Billie Jean" is a compelling narrative that delves into the
        complexities of relationships and the pressures of celebrity.'
    ),
    (
        5,
        '"Stairway to Heaven" is a song that narrates a metaphorical journey
        through life''s choices and consequences.
        It begins with a contemplative acoustic guitar introduction,
        setting a serene mood. The lyrics tell the story of a woman 
        who is searching for spiritual fulfillment but is tempted by 
        materialism and false promises of happiness. 
        As the song progresses, it builds in intensity, 
        with soaring vocals and intricate instrumentation, 
        reflecting the protagonist''s inner conflict and quest for enlightenment.
        Ultimately, the song''s message is open to interpretation, 
        with themes of self-discovery, morality, and the pursuit of higher meaning. 
        "Stairway to Heaven" invites listeners to reflect on the choices they make 
        in life and the paths they choose to follow.
        '
    )