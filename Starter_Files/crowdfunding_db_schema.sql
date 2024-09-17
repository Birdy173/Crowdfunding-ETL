DROP TABLE IF EXISTS Contact CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Subcategory CASCADE;
DROP TABLE IF EXISTS Campaign;

-- Table for Contact
CREATE TABLE Contact (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(100)
);

-- Table for Category
CREATE TABLE Category (
    category_id VARCHAR(4) PRIMARY KEY,
    category VARCHAR(100)
);

-- Table for Subcategory
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(8) PRIMARY KEY,
    subcategory VARCHAR(100)
);

-- Table for Campaign
CREATE TABLE Campaign (
    cf_id INT PRIMARY KEY,
    contact_id INT,
    company_name VARCHAR(100),
    description VARCHAR(100),
    goal INT,
    pledged INT,
    outcome VARCHAR(50),
    backers_count INT,
    country VARCHAR(50),
    currency VARCHAR(10),
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR(4),
    subcategory_id VARCHAR(8),
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