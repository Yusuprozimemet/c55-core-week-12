// storage.js
// This file handles all reading and writing of data.
// Currently it uses a JSON file on disk.
// In the assignment you will replace each function here with a SQLite query.

import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const DATA_FILE = join(__dirname, '../data/data.json');

// --- helpers (you will remove these when you switch to SQLite) ---

function readData() {
  const raw = readFileSync(DATA_FILE, 'utf-8');
  return JSON.parse(raw);
}

function writeData(data) {
  writeFileSync(DATA_FILE, JSON.stringify(data, null, 2), 'utf-8');
}

// ----------------------------------------------------------------
// Decks
// ----------------------------------------------------------------

export function getAllDecks() {
  const data = readData();
  return data.decks;
}

export function getDeckById(id) {
  const data = readData();
  return data.decks.find(d => d.id === id) ?? null;
}

export function addDeck(name, description) {
  const data = readData();
  const newId = Math.max(0, ...data.decks.map(d => d.id)) + 1;
  const deck = { id: newId, name, description };
  data.decks.push(deck);
  writeData(data);
  return deck;
}

export function deleteDeck(deckId) {
  const data = readData();
  const index = data.decks.findIndex(d => d.id === deckId);
  if (index === -1) return false;
  data.decks.splice(index, 1);
  writeData(data);
  return true;
}

// ----------------------------------------------------------------
// Cards
// ----------------------------------------------------------------

export function getAllCardsForDeck(deckId) {
  const data = readData();
  return data.cards.filter(c => c.deckId === deckId);
}

export function addCard(question, answer, deckId) {
  const data = readData();
  const newId = Math.max(0, ...data.cards.map(c => c.id)) + 1;
  const card = { id: newId, question, answer, learned: false, deckId };
  data.cards.push(card);
  writeData(data);
  return card;
}

export function markCardLearned(cardId) {
  const data = readData();
  const card = data.cards.find(c => c.id === cardId);
  if (!card) return null;
  card.learned = true;
  writeData(data);
  return card;
}

export function deleteCard(cardId) {
  const data = readData();
  const index = data.cards.findIndex(c => c.id === cardId);
  if (index === -1) return false;
  data.cards.splice(index, 1);
  writeData(data);
  return true;
}
