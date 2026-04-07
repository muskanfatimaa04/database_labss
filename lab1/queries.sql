-- Lab 1: Analytical Queries
-- Author: Muskan

-- Query 1: Books rated above 4.0
SELECT title, author, rating FROM books_read WHERE rating > 4.0 ORDER BY rating DESC;

-- Query 2: Average pages by category
SELECT category, AVG(pages) AS avg_pages, COUNT(*) AS book_count FROM books_read GROUP BY category ORDER BY avg_pages DESC;

-- Query 3: Books by finish date
SELECT title, author, date_finished FROM books_read ORDER BY date_finished ASC;

-- Query 4: Month finished
SELECT title, TO_CHAR(date_finished, 'Month YYYY') AS month_finished FROM books_read;

-- Query 5: High rated and long books
SELECT title, category, rating FROM books_read WHERE rating >= 4.5 AND pages > 500;


