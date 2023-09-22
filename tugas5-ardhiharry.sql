-- soal 1
CREATE DATABASE books_store;

CREATE TABLE books (
  id_buku INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  judul_buku VARCHAR(255),
  pengarang VARCHAR(255),
  tahun_terbit INT,
  penerbit VARCHAR(255),
  tanggal_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  tanggal_diupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE category (
  id_category INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nama_category VARCHAR(255),
  tanggal_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  tanggal_diupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- soal 2
INSERT INTO books (judul_buku, pengarang, tahun_terbit, penerbit, tanggal_dibuat, tanggal_diupdate)
VALUES
("Building Microservices", "Sam Newman", 2014, "O'Reilly", "2023-09-18", "2023-09-18"),
("Clean Code", "Robert C. Martin", 2008, "Prentice Hall", "2023-09-18", "2023-09-18"),
("The Pragmatic Programmer", "Andrew Hunt", 1999, "Addison-Wesley", "2023-09-18", "2023-09-18"),
("Design Patterns", "Erich Gamma", 1994, "Addison-Wesley", "2023-09-18", "2023-09-18"),
("Introduction to Algorithms", "Thomas H. Cormen", 1990, "MIT Press", "2023-09-18", "2023-09-18"),
("The Art of Computer Prog.", "Donald E. Knuth", 1968, "Addison-Wesley", "2023-09-18", "2023-09-18"),
("Clean Architecture", "Robert C. Martin", 2017, "Prentice Hall", "2023-09-18", "2023-09-18"),
("Refactoring", "Martin Fowler", 1999, "Addison-Wesley", "2023-09-18", "2023-09-18"),
("Domain-Driven-Design", "Eric Evans", 2003, "Addison-Wesley", "2023-09-18", "2023-09-18"),
("The Mythical Man-Month", "Frederick Brooks", 1975, "asdasdas", "2023-09-18", "2023-09-18");

INSERT INTO category (nama_category, tanggal_dibuat, tanggal_diupdate)
VALUES
("Pemrograman", "2023-09-18", "2023-09-18"),
("Fiksi", "2023-09-18", "2023-09-18"),
("Nonfiksi", "2023-09-18", "2023-09-18"),
("Bisnis", "2023-09-18", "2023-09-18"),
("Teknologi", "2023-09-18", "2023-09-18"),
("Seni", "2023-09-18", "2023-09-18"),
("Sejarah", "2023-09-18", "2023-09-18"),
("Sains", "2023-09-18", "2023-09-18"),
("Hukum", "2023-09-18", "2023-09-18"),
("Kesehatan", "2023-09-18", "2023-09-18");

-- soal 3
SELECT * FROM books;
SELECT * FROM category;

-- soal 4
UPDATE books
SET judul_buku = "Building Microservices: Designing Fine-Grained Systems 1st", tahun_terbit = 2015, tanggal_diupdate = "2023-09-20"
WHERE id_buku = 1;

-- soal 5
DELETE FROM books WHERE id_buku = 10;
DELETE FROM category WHERE id_category = 10;

-- soal 6
SELECT judul_buku
FROM books
WHERE penerbit = "Addison-Wesley";

SELECT * FROM books
WHERE tahun_terbit >= 2003 AND tahun_terbit <= 2023;

SELECT * FROM books
WHERE judul_buku LIKE "%design%";

-- soal 7
CREATE TABLE book_categories (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_category INT ,
  id_book INT,
  tanggal_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  tanggal_diupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_category) REFERENCES category(id_category),
  FOREIGN KEY (id_book) REFERENCES books(id_buku)
);

-- soal 8
INSERT INTO book_categories (id_category, id_book, tanggal_dibuat, tanggal_diupdate)
VALUES
(1, 2, "2023-09-18", "2023-09-18"),
(5, 3, "2023-09-18", "2023-09-18"),
(1, 1, "2023-09-18", "2023-09-18");

-- soal 9
SELECT b.id_buku, b.judul_buku, c.nama_category
FROM book_categories
LEFT JOIN books b
ON book_categories.id_book = b.id_buku
LEFT JOIN category c
ON book_categories.id_category = c.id_category;

-- soal 10
ALTER TABLE books
ADD jumlah_halaman INT;
