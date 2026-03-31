---- Queries

-- **Question 1** — List the title and published year of every book in the `'Science Fiction'` genre, ordered by published year (oldest first).

-- **Question 2** — Show every book published before 1950. Display the title and year only.

-- **Question 3** — Show every book in the database along with its author's full name. Combine `first_name` and `last_name` into a single column called `author`. _(Hint: you will need a JOIN.)_

-- **Question 4** — List all books written by Stephen King. Show the title and published year, ordered by year. _(Hint: JOIN the two tables and filter on the author's name.)_

-- **Question 5** — Add yourself as a new author. Use your real name, or make one up. Pick any nationality and birth year.

-- **Question 6** — Add one book for the author you just inserted. It can be a real book or a made-up one.

-- **Question 7** — The genre for "The Dark Tower: The Gunslinger" was entered incorrectly as `'Fantasy'`. It should be `'Horror'`. Write an UPDATE to fix it, then verify the change with a SELECT.

-- **Question 8** — Delete the book you added in Question 6. Make sure your query targets only that specific row.

---

-- ### Bonus questions _(optional)_

-- These cover topics slightly beyond the core material. Have a go if you finish early.

-- **Bonus A** — How many books are there per genre? Show the genre name and the count, ordered from most to fewest books.

-- **Bonus B** — Find any authors in the database who have no books at all. _(Hint: you will need a LEFT JOIN and check for NULL.)
