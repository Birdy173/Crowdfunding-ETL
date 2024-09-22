DROP TABLE IF EXISTS Contact CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Subcategory CASCADE;
DROP TABLE IF EXISTS Campaign;

-- Table for Contact
CREATE TABLE Contact (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Table for Category
CREATE TABLE Category (
    category_id VARCHAR(4) PRIMARY KEY,
    category VARCHAR(100) NOT NULL
);

-- Table for Subcategory
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(8) PRIMARY KEY,
    subcategory VARCHAR(100) NOT NULL
);

-- Table for Campaign
CREATE TABLE Campaign (
    cf_id INT PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    goal INT NOT NULL,
    pledged INT NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(50) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(4) NOT NULL,
    subcategory_id VARCHAR(8) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES Contact(contact_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id)
);

-- Verification that each table is correctly handled
SELECT *
FROM Contact;

SELECT *
FROM Category;

SELECT *
FROM Subcategory;

SELECT *
FROM Campaign;