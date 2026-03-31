# Core program week 12 assignment

The week 12 assignment for the HackYourFuture Core program can be found at the following link: https://hub.hackyourfuture.nl/core-program-week-12-assignment

## Implementation Instructions

### Task 1

See the README.md in the task-1 directory

### Task 2 — Refactor the flashcard app

You are given a small Node.js app that manages study flashcards. It currently stores all data in a JSON file. Your job is to replace that file-based storage layer with SQLite by implementing a new `database.js` file, one function at a time.

#### Getting started

1. Run `npm install` to install dependencies.
2. To see the expected output, temporarily change the import in `app.js` from `./src/database.js` to `./src/storage.js` and run `node app.js`. **Take a note of this output.** Change the import back to `./src/database.js` when you're done.

#### Understand the structure

Before writing anything, read through these files:

- `src/storage.js` — the original JSON-based implementation. **Do not change this file.** It is your reference: every function shows exactly what shape of data to return.
- `src/database.js` — your file to implement. It exports the same functions as `storage.js`, each currently throwing `'Not implemented'`.
- `app.js` — calls the storage functions to demonstrate each operation. **You will not change this file.**

The functions you need to implement in `database.js` are:

| Function                            | What it does                                |
| ----------------------------------- | ------------------------------------------- |
| `getAllDecks()`                     | Returns every deck                          |
| `getDeckById(id)`                   | Returns one deck by id                      |
| `addDeck(name, description)`        | Inserts a new deck, returns it              |
| `deleteDeck(deckId)`                | Deletes a deck, returns true/false          |
| `getAllCardsForDeck(deckId)`        | Returns all cards belonging to a deck       |
| `addCard(question, answer, deckId)` | Inserts a new card, returns it              |
| `markCardLearned(cardId)`           | Sets `learned = true` on a card, returns it |
| `deleteCard(cardId)`                | Deletes a card, returns true/false          |

---

#### Step 1 — Create the database schema

Create a new file called `setup.sql` inside the `task-2` directory. In it, write the DDL to create two tables:

**`decks`**

| Column      | Type    | Constraints               |
| ----------- | ------- | ------------------------- |
| id          | INTEGER | PRIMARY KEY AUTOINCREMENT |
| name        | TEXT    | NOT NULL                  |
| description | TEXT    |                           |

**`cards`**

| Column   | Type    | Constraints                   |
| -------- | ------- | ----------------------------- |
| id       | INTEGER | PRIMARY KEY AUTOINCREMENT     |
| question | TEXT    | NOT NULL                      |
| answer   | TEXT    | NOT NULL                      |
| learned  | INTEGER | NOT NULL DEFAULT 0            |
| deck_id  | INTEGER | NOT NULL, FOREIGN KEY → decks |

> **Note:** SQLite does not have a boolean type. Use `INTEGER` with `0` for false and `1` for true.

Create the database by running (from the `task-2` directory):

```bash
sqlite3 data/flashcards.db < setup.sql
```

Or load it through DBeaver as you did on the SQL Scripts page.

---

#### Step 2 — Migrate the existing data

Create a new file called `migrate.js` inside the `task-2` directory. It should:

1. Read `data/data.json`
2. Open `data/flashcards.db` using `better-sqlite3`
3. Insert every deck from the JSON into the `decks` table
4. Insert every card from the JSON into the `cards` table (remember `learned` is `0`/`1`, not `false`/`true`)

Run it once:

```bash
node migrate.js
```

Open the database in DBeaver and confirm the data is there before moving on.

---

#### Step 3 — Implement the functions in `database.js`

The `better-sqlite3` import and database connection are already set up at the top of `src/database.js`. Implement each function **one at a time**, running `node app.js` after each one to confirm it still works.

Keep `src/storage.js` open alongside `src/database.js` — it shows you exactly what each function should do and what shape of data it must return.

**`getAllDecks()`** — use a `SELECT * FROM decks` query with `.all()`.

**`getDeckById(id)`** — use a `SELECT ... WHERE id = ?` query with `.get()`. Return `null` if not found.

**`addDeck(name, description)`** — use an `INSERT` with `.run()`. Return an object with `id` (from `info.lastInsertRowid`), `name`, and `description`.

**`deleteDeck(deckId)`** — use a `DELETE FROM decks WHERE id = ?` with `.run()`. Return `true` if a row was deleted (`info.changes > 0`), `false` otherwise.

**`getAllCardsForDeck(deckId)`** — use a `SELECT ... WHERE deck_id = ?` query. Note the column is `deck_id` in the database but `deckId` in the app — use `AS` to alias it:

```sql
SELECT id, question, answer, learned, deck_id AS deckId FROM cards WHERE deck_id = ?
```

**`addCard(question, answer, deckId)`** — use an `INSERT`. Return the new card object including its id.

**`markCardLearned(cardId)`** — use `UPDATE cards SET learned = 1 WHERE id = ?`. Then fetch and return the updated card, or `null` if not found.

**`deleteCard(cardId)`** — use `DELETE FROM cards WHERE id = ?`. Return `true` if a row was deleted, `false` otherwise.

---

#### Step 4 — Final check

Once all functions are implemented:

1. Run `node app.js` and compare the output to the notes you took in the Getting Started step. It should be identical.
2. Open `data/flashcards.db` in DBeaver and confirm the data looks correct.

> **The goal of this task is not just to get it working — it is to notice what changed and what didn't.** The functions in `database.js` have exactly the same names and return exactly the same shapes as `storage.js`. `app.js` didn't change at all. This is the point: a well-structured app can swap its storage layer without touching anything else.
