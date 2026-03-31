-- ============================================================
-- books_library.sql
-- Schema and seed data for the HackYourFuture books database
-- Authors: 24 | Books: 100
-- Usage:
--   SQLite CLI : sqlite3 books_library.db < books_library.sql
--   DBeaver    : Open SQL Editor → paste → Execute Script
-- ============================================================

PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------
-- Drop tables if they already exist (safe to re-run)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- ------------------------------------------------------------
-- Schema
-- ------------------------------------------------------------
CREATE TABLE authors (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name  TEXT    NOT NULL,
    last_name   TEXT    NOT NULL,
    nationality TEXT,
    birth_year  INTEGER
);

CREATE TABLE books (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    title          TEXT    NOT NULL,
    published_year INTEGER,
    genre          TEXT,
    author_id      INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- ------------------------------------------------------------
-- Authors  (24 authors)
-- ------------------------------------------------------------
INSERT INTO authors (first_name, last_name, nationality, birth_year) VALUES
    ('J.K.',        'Rowling',         'British',    1965),  -- 1
    ('George R.R.', 'Martin',          'American',   1948),  -- 2
    ('J.R.R.',      'Tolkien',         'British',    1892),  -- 3
    ('Agatha',      'Christie',        'British',    1890),  -- 4
    ('Stephen',     'King',            'American',   1947),  -- 5
    ('Terry',       'Pratchett',       'British',    1948),  -- 6
    ('Isaac',       'Asimov',          'American',   1920),  -- 7
    ('Frank',       'Herbert',         'American',   1920),  -- 8
    ('Douglas',     'Adams',           'British',    1952),  -- 9
    ('George',      'Orwell',          'British',    1903),  -- 10
    ('Harper',      'Lee',             'American',   1926),  -- 11
    ('F. Scott',    'Fitzgerald',      'American',   1896),  -- 12
    ('Ernest',      'Hemingway',       'American',   1899),  -- 13
    ('Jane',        'Austen',          'British',    1775),  -- 14
    ('Charles',     'Dickens',         'British',    1812),  -- 15
    ('Mark',        'Twain',           'American',   1835),  -- 16
    ('Gabriel',     'García Márquez',  'Colombian',  1927),  -- 17
    ('Cormac',      'McCarthy',        'American',   1933),  -- 18
    ('Toni',        'Morrison',        'American',   1931),  -- 19
    ('Ursula K.',   'Le Guin',         'American',   1929),  -- 20
    ('Philip K.',   'Dick',            'American',   1928),  -- 21
    ('Neil',        'Gaiman',          'British',    1960),  -- 22
    ('Margaret',    'Atwood',          'Canadian',   1939),  -- 23
    ('Kazuo',       'Ishiguro',        'British',    1954);  -- 24

-- ------------------------------------------------------------
-- Books  (100 books)
-- ------------------------------------------------------------
INSERT INTO books (title, published_year, genre, author_id) VALUES
    -- J.K. Rowling (7)
    ('Harry Potter and the Philosopher''s Stone',  1997, 'Fantasy',        1),
    ('Harry Potter and the Chamber of Secrets',    1998, 'Fantasy',        1),
    ('Harry Potter and the Prisoner of Azkaban',   1999, 'Fantasy',        1),
    ('Harry Potter and the Goblet of Fire',        2000, 'Fantasy',        1),
    ('Harry Potter and the Order of the Phoenix',  2003, 'Fantasy',        1),
    ('Harry Potter and the Half-Blood Prince',     2005, 'Fantasy',        1),
    ('Harry Potter and the Deathly Hallows',       2007, 'Fantasy',        1),

    -- George R.R. Martin (5)
    ('A Game of Thrones',                          1996, 'Fantasy',        2),
    ('A Clash of Kings',                           1998, 'Fantasy',        2),
    ('A Storm of Swords',                          2000, 'Fantasy',        2),
    ('A Feast for Crows',                          2005, 'Fantasy',        2),
    ('A Dance with Dragons',                       2011, 'Fantasy',        2),

    -- J.R.R. Tolkien (5)
    ('The Hobbit',                                 1937, 'Fantasy',        3),
    ('The Fellowship of the Ring',                 1954, 'Fantasy',        3),
    ('The Two Towers',                             1954, 'Fantasy',        3),
    ('The Return of the King',                     1955, 'Fantasy',        3),
    ('The Silmarillion',                           1977, 'Fantasy',        3),

    -- Agatha Christie (5)
    ('Murder on the Orient Express',               1934, 'Mystery',        4),
    ('And Then There Were None',                   1939, 'Mystery',        4),
    ('Death on the Nile',                          1937, 'Mystery',        4),
    ('The ABC Murders',                            1936, 'Mystery',        4),
    ('Crooked House',                              1949, 'Mystery',        4),

    -- Stephen King (5)
    ('The Shining',                                1977, 'Horror',         5),
    ('It',                                         1986, 'Horror',         5),
    ('Misery',                                     1987, 'Horror',         5),
    ('The Stand',                                  1978, 'Horror',         5),
    ('Pet Sematary',                               1983, 'Horror',         5),

    -- Terry Pratchett (5)
    ('The Colour of Magic',                        1983, 'Comedy Fantasy', 6),
    ('Guards! Guards!',                            1989, 'Comedy Fantasy', 6),
    ('Small Gods',                                 1992, 'Comedy Fantasy', 6),
    ('Mort',                                       1987, 'Comedy Fantasy', 6),
    ('Good Omens',                                 1990, 'Comedy Fantasy', 6),

    -- Isaac Asimov (5)
    ('Foundation',                                 1951, 'Science Fiction', 7),
    ('Foundation and Empire',                      1952, 'Science Fiction', 7),
    ('Second Foundation',                          1953, 'Science Fiction', 7),
    ('The Caves of Steel',                         1954, 'Science Fiction', 7),
    ('I, Robot',                                   1950, 'Science Fiction', 7),

    -- Frank Herbert (3)
    ('Dune',                                       1965, 'Science Fiction', 8),
    ('Dune Messiah',                               1969, 'Science Fiction', 8),
    ('Children of Dune',                           1976, 'Science Fiction', 8),

    -- Douglas Adams (5)
    ('The Hitchhiker''s Guide to the Galaxy',      1979, 'Comedy Sci-Fi',  9),
    ('The Restaurant at the End of the Universe',  1980, 'Comedy Sci-Fi',  9),
    ('Life, the Universe and Everything',          1982, 'Comedy Sci-Fi',  9),
    ('So Long, and Thanks for All the Fish',       1984, 'Comedy Sci-Fi',  9),
    ('Mostly Harmless',                            1992, 'Comedy Sci-Fi',  9),

    -- George Orwell (2)
    ('Nineteen Eighty-Four',                       1949, 'Dystopian',     10),
    ('Animal Farm',                                1945, 'Satire',        10),

    -- Harper Lee (1)
    ('To Kill a Mockingbird',                      1960, 'Literary Fiction', 11),

    -- F. Scott Fitzgerald (1)
    ('The Great Gatsby',                           1925, 'Literary Fiction', 12),

    -- Ernest Hemingway (3)
    ('The Old Man and the Sea',                    1952, 'Literary Fiction', 13),
    ('A Farewell to Arms',                         1929, 'Literary Fiction', 13),
    ('For Whom the Bell Tolls',                    1940, 'Literary Fiction', 13),

    -- Jane Austen (4)
    ('Pride and Prejudice',                        1813, 'Romance',        14),
    ('Sense and Sensibility',                      1811, 'Romance',        14),
    ('Emma',                                       1815, 'Romance',        14),
    ('Persuasion',                                 1817, 'Romance',        14),

    -- Charles Dickens (4)
    ('Oliver Twist',                               1837, 'Literary Fiction', 15),
    ('A Tale of Two Cities',                       1859, 'Historical Fiction', 15),
    ('Great Expectations',                         1861, 'Literary Fiction', 15),
    ('A Christmas Carol',                          1843, 'Literary Fiction', 15),

    -- Mark Twain (3)
    ('The Adventures of Tom Sawyer',               1876, 'Adventure',      16),
    ('Adventures of Huckleberry Finn',             1884, 'Adventure',      16),
    ('The Prince and the Pauper',                  1881, 'Historical Fiction', 16),

    -- Gabriel García Márquez (3)
    ('One Hundred Years of Solitude',              1967, 'Magical Realism', 17),
    ('Love in the Time of Cholera',                1985, 'Magical Realism', 17),
    ('Chronicle of a Death Foretold',              1981, 'Magical Realism', 17),

    -- Cormac McCarthy (3)
    ('The Road',                                   2006, 'Post-Apocalyptic', 18),
    ('No Country for Old Men',                     2005, 'Crime',          18),
    ('Blood Meridian',                             1985, 'Western',        18),

    -- Toni Morrison (3)
    ('Beloved',                                    1987, 'Literary Fiction', 19),
    ('Song of Solomon',                            1977, 'Literary Fiction', 19),
    ('The Bluest Eye',                             1970, 'Literary Fiction', 19),

    -- Ursula K. Le Guin (4)
    ('A Wizard of Earthsea',                       1968, 'Fantasy',        20),
    ('The Tombs of Atuan',                         1971, 'Fantasy',        20),
    ('The Farthest Shore',                         1972, 'Fantasy',        20),
    ('The Left Hand of Darkness',                  1969, 'Science Fiction', 20),

    -- Philip K. Dick (4)
    ('Do Androids Dream of Electric Sheep?',       1968, 'Science Fiction', 21),
    ('The Man in the High Castle',                 1962, 'Science Fiction', 21),
    ('Ubik',                                       1969, 'Science Fiction', 21),
    ('A Scanner Darkly',                           1977, 'Science Fiction', 21),

    -- Neil Gaiman (4)
    ('American Gods',                              2001, 'Fantasy',        22),
    ('Neverwhere',                                 1996, 'Fantasy',        22),
    ('Coraline',                                   2002, 'Fantasy',        22),
    ('The Ocean at the End of the Lane',           2013, 'Fantasy',        22),

    -- Margaret Atwood (3)
    ('The Handmaid''s Tale',                       1985, 'Dystopian',     23),
    ('Oryx and Crake',                             2003, 'Dystopian',     23),
    ('The Blind Assassin',                         2000, 'Literary Fiction', 23),

    -- Kazuo Ishiguro (3)
    ('The Remains of the Day',                     1989, 'Literary Fiction', 24),
    ('Never Let Me Go',                            2005, 'Dystopian',     24),
    ('Klara and the Sun',                          2021, 'Science Fiction', 24),

    -- Stephen King — extended (2 more = 7 total)
    ('Carrie',                                     1974, 'Horror',         5),
    ('The Dark Tower: The Gunslinger',             1982, 'Fantasy',        5),

    -- Terry Pratchett — extended (2 more = 7 total)
    ('Reaper Man',                                 1991, 'Comedy Fantasy', 6),
    ('Feet of Clay',                               1996, 'Comedy Fantasy', 6),

    -- Isaac Asimov — extended (2 more = 7 total)
    ('The Gods Themselves',                        1972, 'Science Fiction', 7),
    ('The End of Eternity',                        1955, 'Science Fiction', 7),

    -- Jane Austen — extended (2 more = 6 total)
    ('Northanger Abbey',                           1817, 'Romance',        14),
    ('Mansfield Park',                             1814, 'Romance',        14),

    -- Charles Dickens — extended (2 more = 6 total)
    ('David Copperfield',                          1850, 'Literary Fiction', 15),
    ('Bleak House',                                1853, 'Literary Fiction', 15);

-- ------------------------------------------------------------
-- Quick sanity check
-- ------------------------------------------------------------
SELECT 'Authors: ' || COUNT(*) AS check_count FROM authors
UNION ALL
SELECT 'Books:   ' || COUNT(*)               FROM books;
