# Crowdfunding Campaign Database Project

This project creates a Crowdfunding Campaign database to manage campaign details, contacts, and categories. It provides SQL scripts for creating tables and Python scripts for importing and manipulating the data.

## Project Overview

The database stores details about crowdfunding campaigns, including campaign information, financial goals, contact information, and categorization.

## Requirements

- SQL database (MySQL, PostgreSQL, etc.)
- SQL client (MySQL Workbench, pgAdmin, etc.)
- Python 3.x installed with Pandas library (`pip install pandas`)
- CSV files for campaign data

## Setting Up the Database
Use the following Python script to load and manipulate campaign data from a CSV file:
```python
import pandas as pd

# Load CSV data
df = pd.read_csv('path/to/campaign_data.csv')

# Extract campaign information
campaign_info_df = df[['cf_id', 'contact_id', 'company_name', 'description', 'goal', 'pledged', 'outcome', 'backers_count', 'country', 'currency', 'launched_date', 'end_date', 'category_id', 'subcategory_id']]

# Save the cleaned data
campaign_info_df.to_csv('cleaned_campaign_data.csv', index=False)
```
### Campaign Table

```sql
CREATE TABLE Campaign (
    cf_id INT PRIMARY KEY,
    contact_id INT,
    company_name VARCHAR(255),
    description VARCHAR(300),
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
CREATE TABLE Contact (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(100)
);
CREATE TABLE Category (
    category_id VARCHAR(4) PRIMARY KEY,
    category VARCHAR(100)
);
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(8) PRIMARY KEY,
    subcategory VARCHAR(100),
    category_id VARCHAR(4),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

