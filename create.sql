-- a) Назва схеми — “LibraryManagement”
CREATE SCHEMA LibraryManagement;
use LibraryManagement;

-- b) Таблиця "authors":
--    author_id (INT, автоматично зростаючий PRIMARY KEY)
--    author_name (VARCHAR)
CREATE TABLE authors(
	author_id INT PRIMARY KEY,
    author_name VARCHAR(255)
);

-- c) Таблиця "genres":
--    genre_id (INT, автоматично зростаючий PRIMARY KEY)
--    genre_name (VARCHAR)
CREATE TABLE genres(
	genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

-- d) Таблиця "books":
--    book_id (INT, автоматично зростаючий PRIMARY KEY)
--    title (VARCHAR)
--    publication_year (YEAR)
--    author_id (INT, FOREIGN KEY зв'язок з "Authors")
--    genre_id (INT, FOREIGN KEY зв'язок з "Genres")
CREATE TABLE books(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    publication_year YEAR,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- e) Таблиця "users":
--    user_id (INT, автоматично зростаючий PRIMARY KEY)
--    username (VARCHAR)
--    email (VARCHAR)
CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    email VARCHAR(255)
);

-- f) Таблиця "borrowed_books":
--    borrow_id (INT, автоматично зростаючий PRIMARY KEY)
--    book_id (INT, FOREIGN KEY зв'язок з "Books")
--    user_id (INT, FOREIGN KEY зв'язок з "Users")
--    borrow_date (DATE)
--    return_date (DATE)
CREATE TABLE borrowed_books(
	borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    borrow_date DATE,
    return_date DATE
);


