CREATE TYPE Gender AS ENUM ('Male', 'Female');
CREATE TYPE Genre AS ENUM ('DETECTIVE', 'DRAMA', 'HISTORY', 'ROMANCE', 'BIOGRAPHY', 'FANTASY');
CREATE TABLE publishers
(
    name VARCHAR,
    id   SERIAL PRIMARY KEY
);
CREATE TABLE languages
(
    id       SERIAL PRIMARY KEY,
    language VARCHAR NOT NULL
);
CREATE TABLE authors
(
    id            SERIAL PRIMARY KEY,
    first_name    VARCHAR,
    last_name     VARCHAR,
    country       VARCHAR,
    email         VARCHAR UNIQUE,
    date_of_birth TIMESTAMP,
    gender        Gender
);
CREATE TABLE books
(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    country        VARCHAR,
    published_year DATE,
    price          NUMERIC,
    genre          Genre,
    language_id    INT REFERENCES languages (id),
    publisher_id   INT REFERENCES publishers (id),
    author_id      INT REFERENCES authors (id)
);
INSERT INTO publishers(name)
VALUES ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');
INSERT INTO authors(first_name, last_name, email, date_of_birth, country, gender)
VALUES ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', TO_DATE('9/25/1968', 'MM/DD/YYYY'), 'France', 'Female'),
       ('Patti', 'Walster', 'pwalster1@addtoany.com', TO_DATE('10/31/1965', 'MM/DD/YYYY'), 'China', 'Female'),
       ('Sonnie', 'Emmens', 'semmens2@upenn.edu', TO_DATE('5/16/1980', 'MM/DD/YYYY'), 'Germany', 'Male'),
       ('Brand', 'Burel', 'bburel3@ovh.net', TO_DATE('4/24/1964', 'MM/DD/YYYY'), 'United States', 'Male'),
       ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', TO_DATE('7/3/1967', 'MM/DD/YYYY'), 'France', 'Male'),
       ('Alexey', 'Arnov', 'larnoldi5@writer.com', TO_DATE('12/29/1964', 'MM/DD/YYYY'), 'Russia', 'Male'),
       ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', TO_DATE('12/14/1983', 'MM/DD/YYYY'), 'China', 'Female'),
       ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', TO_DATE('1/29/1960', 'MM/DD/YYYY'), 'United States', 'Female'),
       ('Boigie', 'Etridge', 'betridge8@ed.gov', TO_DATE('11/17/1978', 'MM/DD/YYYY'), 'France', 'Male'),
       ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', TO_DATE('9/8/1962', 'MM/DD/YYYY'), 'Germany', 'Male'),
       ('Margarita', 'Bartova', 'mbartova@example.com', TO_DATE('12/3/1984', 'MM/DD/YYYY'), 'Russia', 'Female'),
       ('Innis', 'Hugh', 'ihughb@marriott.com', TO_DATE('8/28/1983', 'MM/DD/YYYY'), 'Germany', 'Male'),
       ('Lera', 'Trimnella', 'ltrimnellc@msn.com', TO_DATE('3/28/1980', 'MM/DD/YYYY'), 'Russia', 'Female'),
       ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', TO_DATE('8/5/1966', 'MM/DD/YYYY'), 'Spain', 'Male'),
       ('Loretta', 'Gronaver', 'lgronavere@technorati.com', TO_DATE('10/17/1962', 'MM/DD/YYYY'), 'United States',
        'Female');


INSERT INTO languages(language)
VALUES ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');

INSERT INTO books(name, country, published_year, price, genre, language_id, publisher_id, author_id)
VALUES ('Taina', 'Russia', TO_DATE('11/12/2021', 'MM/DD/YYYY'), '568', 'DETECTIVE', '5', '12', '6'),
       ('Zvezdopad', 'Russia', TO_DATE('12/9/2004', 'MM/DD/YYYY'), '446', 'ROMANCE', '5', '13', '11'),
       ('Homo Faber', 'Germany', TO_DATE('4/10/2022', 'MM/DD/YYYY'), '772', 'FANTASY', '3', '5', '3'),
       ('Der Richter und Sein Henker', 'Germany', TO_DATE('2/1/2011', 'MM/DD/YYYY'), '780', 'DETECTIVE', '3', '3',
        '10'),
       ('Lord of the Flies', 'United States', TO_DATE('7/11/2015', 'MM/DD/YYYY'), '900', 'FANTASY', '1', '2', '4'),
       ('Un soir au club', 'France', TO_DATE('1/12/2018', 'MM/DD/YYYY'), '480', 'DRAMA', '2', '1', '1'),
       ('Voina', 'Russia', TO_DATE('12/6/2004', 'MM/DD/YYYY'), '880', 'HISTORY', '5', '4', '13'),
       ('Sun Tzu', 'China', TO_DATE('9/5/2022', 'MM/DD/YYYY'), '349', 'HISTORY', '4', '4', '2'),

       ('Emil und die Detektive', 'Germany', TO_DATE('6/11/2010', 'MM/DD/YYYY'), '228', 'DETECTIVE', '3', '5', '10'),
       ('Coule la Seine', 'France', TO_DATE('3/1/2015', 'MM/DD/YYYY'), '732', 'FANTASY', '2', '6', '1'),
       ('Love and hatred', 'Russia', TO_DATE('2/3/2012', 'MM/DD/YYYY'), '763', 'ROMANCE', '5', '14', '13'),
       ('Fantastic Mr Fox', 'United States', TO_DATE('3/10/2018', 'MM/DD/YYYY'), '309', 'FANTASY', '1', '9', '8'),
       ('Contes de la Bécasse', 'France', TO_DATE('10/5/2019', 'MM/DD/YYYY'), '378', 'ROMANCE', '2', '6', '9'),
       ('The Death of Ivan Ilyich', 'Russia', TO_DATE('9/24/2000', 'MM/DD/YYYY'), '814', 'DRAMA', '5', '6', '6'),
       ('Bonjour Tristesse', 'France', TO_DATE('8/2/2015', 'MM/DD/YYYY'), '502', 'ROMANCE', '2', '8', '5'),
       ('Die Verwandlung', 'Germany', TO_DATE('6/19/2008', 'MM/DD/YYYY'), '305', 'DETECTIVE', '3', '7', '12'),
       ('The Inspector Barlach Mysteries', 'Germany', TO_DATE('3/10/2007', 'MM/DD/YYYY'), '566', 'DETECTIVE', '3', '3',
        '3'),
       ('LÉtranger', 'France', TO_DATE('11/14/2017', 'MM/DD/YYYY'), '422', 'ROMANCE', '2', '8', '5'),
       ('Lao Tse', 'China', TO_DATE('7/16/2005', 'MM/DD/YYYY'), '900', 'FANTASY', '4', '4', '2'),
       ('Semya', 'Russia', TO_DATE('4/12/2004', 'MM/DD/YYYY'), '194', 'DRAMA', '5', '13', '11'),
       ('Empty World', 'United States', TO_DATE('1/4/2008', 'MM/DD/YYYY'), '324', 'FANTASY', '1', '11', '15'),
       ('Domainer', 'Germany', TO_DATE('1/6/2020', 'MM/DD/YYYY'), '420', 'ROMANCE', '3', '5', '10'),
       ('The Fault in Our Stars', 'United States', TO_DATE('2/13/2008', 'MM/DD/YYYY'), '396', 'ROMANCE', '1', '9', '4'),
       ('Die R uber', 'Germany', TO_DATE('6/25/2020', 'MM/DD/YYYY'), '300', 'ROMANCE', '3', '7', '12'),
       ('Jung Chang', 'China', TO_DATE('5/14/2021', 'MM/DD/YYYY'), '600', 'HISTORY', '4', '10', '7'),
       ('Les Aventures de Tintin', 'France', TO_DATE('4/10/2015', 'MM/DD/YYYY'), '582', 'DRAMA', '2', '1', '5'),
       ('Unvollendete Geschichte', 'Germany', TO_DATE('12/12/2010', 'MM/DD/YYYY'), '269', 'DETECTIVE', '3', '5', '10'),
       ('Amy Tan', 'China', TO_DATE('1/9/2023', 'MM/DD/YYYY'), '486', 'DRAMA', '4', '4', '7'),
       ('Krasnaya luna', 'Russia', TO_DATE('2/7/2020', 'MM/DD/YYYY'), '550', 'FANTASY', '5', '12', '11'),
       ('Emma', 'United States', TO_DATE('10/11/2021', 'MM/DD/YYYY'), '599', 'BIOGRAPHY', '1', '2', '15');


-- 1
SELECT name, published_year, genre
FROM books;
-- 2
SELECT distinct country
FROM authors;
-- 3
SELECT *
FROM books
WHERE EXTRACT(YEAR FROM published_year) BETWEEN 2020 AND 2023;
-- 4
SELECT *
FROM books
WHERE genre = 'DETECTIVE';
-- 5
SELECT concat(authors.first_name, ' ', authors.last_name) as author
FROM authors;
-- 6
SELECT concat(authors.first_name, ' ', authors.last_name) as author, country
FROM authors
WHERE country = 'Germany'
   OR country = 'France';
-- 7
SELECT name, country, published_year, price, genre
FROM books
WHERE genre != 'ROMANCE'
  AND price > 500;
-- 8
SELECT *
FROM authors
WHERE gender = 'Female'
LIMIT 3;
-- 9
SELECT *
FROM authors
WHERE email ILIKE '%.com'
  AND length(first_name) = 4;
-- 10
SELECT country, count(country)
FROM authors
GROUP BY country;
-- 11
SELECT *
FROM authors
ORDER BY country DESC
LIMIT 3;
-- 12
SELECT genre, count(genre)
FROM books
GROUP BY genre;
-- 13
SELECT genre, min(price)
FROM books
WHERE genre = 'ROMANCE'
   OR genre = 'DETECTIVE'
GROUP BY genre;
-- 14
SELECT genre, price
FROM books
WHERE genre = 'BIOGRAPHY'
   OR genre = 'HISTORY';
-- 15
SELECT language, publishers.name, books.name
FROM books
         INNER JOIN languages ON books.language_id = languages.id
         INNER JOIN publishers ON books.publisher_id = publishers.id;
-- 16
SELECT b.*,
       a.*,
       p.id   AS publisher_id,
       p.name AS publisher_name
FROM books b
         JOIN authors a ON b.author_id = a.id
         LEFT JOIN publishers p ON b.publisher_id = p.id;
-- 17
SELECT b.*,
       a.*
FROM books b
         LEFT JOIN authors a ON b.author_id = a.id;
-- 18
SELECT country, count(country) as count
FROM books
GROUP BY country
ORDER BY count;
-- 19
SELECT p.name, round(avg(price))
FROM publishers p
         INNER JOIN books b on p.id = b.publisher_id
GROUP BY p.name;
-- 20
SELECT b.*, a.first_name, a.last_name
FROM books b
         INNER JOIN authors a on b.author_id = a.id
WHERE EXTRACT(YEAR FROM published_year) BETWEEN 2010 AND 2015;
-- 21
SELECT concat(a.first_name,' ' ,a.last_name) as full_name, sum(b.price)
FROM books b
         INNER JOIN authors a on b.author_id = a.id
WHERE EXTRACT(YEAR FROM published_year) BETWEEN 2010 AND 2015
GROUP BY full_name;
