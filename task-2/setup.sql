-- Create the flashcards database schema

-- Decks table
CREATE TABLE IF NOT EXISTS decks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT
);

-- Cards table
CREATE TABLE IF NOT EXISTS cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    learned INTEGER NOT NULL DEFAULT 0,
    deck_id INTEGER NOT NULL,
    FOREIGN KEY (deck_id) REFERENCES decks(id)
);
