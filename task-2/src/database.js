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
  // TODO: return all rows from the decks table
  throw new Error('Not implemented');
}

export function getDeckById(id) {
  // TODO: return the deck row with the given id, or null if not found
  throw new Error('Not implemented');
}

export function addDeck(name, description) {
  // TODO: insert a new deck and return the new row (including its id)
  throw new Error('Not implemented');
}

export function deleteDeck(deckId) {
  // TODO: delete the deck with the given id
  //       return true if a row was deleted, false otherwise
  throw new Error('Not implemented');
}

// ----------------------------------------------------------------
// Cards
// ----------------------------------------------------------------

export function getAllCardsForDeck(deckId) {
  // TODO: return all card rows whose deckId matches
  throw new Error('Not implemented');
}

export function addCard(question, answer, deckId) {
  // TODO: insert a new card and return the new row (including its id)
  throw new Error('Not implemented');
}

export function markCardLearned(cardId) {
  // TODO: set learned = 1 for the card with the given id
  //       return the updated row, or null if not found
  throw new Error('Not implemented');
}

export function deleteCard(cardId) {
  // TODO: delete the card with the given id
  //       return true if a row was deleted, false otherwise
  throw new Error('Not implemented');
}
