-- Drop Tables if already exist in the database
DROP TABLE IF EXISTS Campaign;
DROP TABLE IF EXISTS Contacts;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Subcategory;

	
-- Create all tables
-- Create a table of contacts
CREATE TABLE Contacts(
	contact_id INTEGER NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	UNIQUE (contact_id),
	PRIMARY KEY (contact_id)
);

-- Create a table of categories
CREATE TABLE Category(
	category_id VARCHAR(10) NOT NULL,
	category VARCHAR(50) NOT NULL,
	UNIQUE (category_id),
	PRIMARY KEY (category_id)
);

-- Create a table of subcategories
CREATE TABLE Subcategory(
	subcategory_id VARCHAR(10) NOT NULL,
	subcategory VARCHAR(50) NOT NULL,
	UNIQUE (subcategory_id),
	PRIMARY KEY (subcategory_id)
);

-- Create a table of campaigns
CREATE TABLE Campaign(
	cf_id INTEGER NOT NULL,
	contact_id INTEGER NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id),
	company_name VARCHAR(100) NOT NULL,
	description VARCHAR(100) NOT NULL,
	goal NUMERIC NOT NULL,
	pledged NUMERIC NOT NULL,
	outcome VARCHAR(20) NOT NULL,
	backers_count INTEGER NOT NULL,
	country VARCHAR(10) NOT NULL,
	currency VARCHAR(10) NOT NULL,
	launch_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES Category(category_id),
	subcategory_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id),
	UNIQUE (cf_id),
	PRIMARY KEY (cf_id)
);


-- Import each CSV file into its corresponding SQL table
-- Display each table to confirm data is imported properly
SELECT * FROM Contacts;
SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Campaign;
