CREATE TABLE author (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE game (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    author_id INTEGER,
    CONSTRAINT fkey_author FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

-- MusicAlbum DB
CREATE TABLE genre (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE music_album (
    id  INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY(id) REFERENCES item(id)
);