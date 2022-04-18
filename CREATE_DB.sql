DROP DATABASE IF EXISTS nova_shop;

CREATE DATABASE nova_shop;

USE nova_shop;

DROP TABLE IF EXISTS Addresses;

DROP TABLE IF EXISTS Clients;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Suppliers;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Shops;

DROP TABLE IF EXISTS Categories;

-- MAKE TABLES
CREATE TABLE Addresses (
    id INT NOT NULL AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    tk VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Clients (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id) REFERENCES Addresses(id)
);

CREATE TABLE Categories (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Products (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Suppliers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id) REFERENCES Addresses(id)
);

CREATE TABLE Shops (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id) REFERENCES Addresses(id)
);

CREATE TABLE Orders (
    id INT NOT NULL AUTO_INCREMENT,
    client_id int NOT NULL,
    shop_id int NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    product_id int NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES Clients(id),
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (shop_id) REFERENCES Shops(id)
);