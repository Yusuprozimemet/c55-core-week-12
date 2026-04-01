import Database from 'better-sqlite3';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const DB_FILE = join(__dirname, '../data/flashcards.db');
const DATA_FILE = join(__dirname, '../data/data.json');

// Read the JSON file
const rawJsonData = readFileSync(DATA_FILE, 'utf-8');
const parsedJsonData = JSON.parse(rawJsonData);

// Open the database
const db = new Database(DB_FILE);

// Prepare the SQL statements
const insertDeckStatement = db.prepare('INSERT INTO decks (id, name, description) VALUES (?, ?, ?)');
const insertCardStatement = db.prepare('INSERT INTO cards (id, question, answer, learned, deck_id) VALUES (?, ?, ?, ?, ?)');

// Insert all decks from JSON into database
const allDecksFromJson = parsedJsonData.decks;
for (const eachDeck of allDecksFromJson) {
  insertDeckStatement.run(eachDeck.id, eachDeck.name, eachDeck.description);
}

// Insert all cards from JSON into database
const allCardsFromJson = parsedJsonData.cards;
for (const eachCard of allCardsFromJson) {
  let learnedValue;
  if (eachCard.learned === true) {
    learnedValue = 1;
  } else {
    learnedValue = 0;
  }
  insertCardStatement.run(eachCard.id, eachCard.question, eachCard.answer, learnedValue, eachCard.deckId);
}

console.log(`Migrated ${allDecksFromJson.length} decks and ${allCardsFromJson.length} cards`);

// Close the database connection
db.close();
