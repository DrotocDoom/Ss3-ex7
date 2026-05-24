CREATE DATABASE libraryDB;
CREATE SCHEMA library;
CREATE TABLE library.Books(
                              book_id SERIAL PRIMARY KEY,
                              title VARCHAR(255),
                              author VARCHAR(255),
                              published_year INT,
                              available BOOLEAN DEFAULT TRUE
);

CREATE TABLE library.Members(
                                member_id SERIAL PRIMARY KEY,
                                name VARCHAR(255),
                                email VARCHAR(255) UNIQUE,
                                join_date DATE DEFAULT CURRENT_DATE
);

CREATE SCHEMA sales;
CREATE TABLE sales.Products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    price NUMERIC(10, 2),
    stock_quantity INT
);

CREATE TABLE Orders(
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES library.Members(member_id)
);

CREATE TABLE OrderIDetail(
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES sales.Products(product_id)
);