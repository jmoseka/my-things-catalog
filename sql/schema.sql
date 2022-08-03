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
