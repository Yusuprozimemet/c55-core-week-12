// database.js
// Your task: implement each function below using better-sqlite3.
// The function signatures are identical to storage.js so you can
// compare the two files side by side.
//
// When every function works correctly, `node app.js` should
// print exactly the same output as it did with storage.js.

import Database from 'better-sqlite3';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const DB_FILE = join(__dirname, '../data/flashcards.db');

const db = new Database(DB_FILE);

// ----------------------------------------------------------------
// Decks
// ----------------------------------------------------------------

export function getAllDecks() {
  return db.prepare('SELECT * FROM decks').all();
}

export function getDeckById(id) {
  const aSingleDeck = db.prepare('SELECT * FROM decks WHERE id = ?').get(id);
  if (aSingleDeck) {
    return aSingleDeck;
  } else {
    return null;
  }
}

export function addDeck(name, description) {
  const insertResult = db.prepare('INSERT INTO decks (name, description) VALUES (?, ?)').run(name, description);
  return { id: insertResult.lastInsertRowid, name, description };
}

export function deleteDeck(deckId) {
  const deleteResult = db.prepare('DELETE FROM decks WHERE id = ?').run(deckId);
  if (deleteResult.changes > 0) {
    return true;
  } else {
    return false;
  }
}

// ----------------------------------------------------------------
// Cards
// ----------------------------------------------------------------

export function getAllCardsForDeck(deckId) {
  return db.prepare('SELECT id, question, answer, learned, deck_id AS deckId FROM cards WHERE deck_id = ?').all(deckId);
}

export function addCard(question, answer, deckId) {
  const insertResult = db.prepare('INSERT INTO cards (question, answer, deck_id) VALUES (?, ?, ?)').run(question, answer, deckId);
  return { id: insertResult.lastInsertRowid, question, answer, learned: false, deckId };
}

export function markCardLearned(cardId) {
  db.prepare('UPDATE cards SET learned = 1 WHERE id = ?').run(cardId);
  const aSingleCard = db.prepare('SELECT id, question, answer, learned, deck_id AS deckId FROM cards WHERE id = ?').get(cardId);
  if (aSingleCard) {
    return aSingleCard;
  } else {
    return null;
  }
}

export function deleteCard(cardId) {
  const deleteResult = db.prepare('DELETE FROM cards WHERE id = ?').run(cardId);
  if (deleteResult.changes > 0) {
    return true;
  } else {
    return false;
  }
}
