-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS my_app_db;

-- Use the newly created database
USE my_app_db;

-- Step 2: Create the Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,  -- Store the hashed password here
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Create the Profiles Table (stores additional profile information)
CREATE TABLE IF NOT EXISTS profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(255),
    bio TEXT,
    profile_picture VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 4: Create the Events Table (for storing events like those displayed on the calendar)
CREATE TABLE IF NOT EXISTS events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    event_title VARCHAR(255),
    event_description TEXT,
    event_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 5: Create the Period Information Table (for period tracking and ovulation)
CREATE TABLE IF NOT EXISTS period_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    period_start_date DATE,
    period_end_date DATE,
    ovulation_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 6: Create the Medicines and Nutrients Table (for storing user medicine/nutrient data)
CREATE TABLE IF NOT EXISTS medicines_nutrients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    medicine_name VARCHAR(255),
    nutrient_name VARCHAR(255),
    dosage VARCHAR(255),
    frequency VARCHAR(255),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 7: Create the Exercises Table (for storing exercise data)
CREATE TABLE IF NOT EXISTS exercises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    exercise_name VARCHAR(255),
    duration INT,  -- Duration in minutes
    calories_burned INT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 8: Create the FAQ Table (for frequently asked questions)
CREATE TABLE IF NOT EXISTS faq (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT,
    answer TEXT
);

-- Step 9: Insert sample FAQ data (optional)
INSERT INTO faq (question, answer) VALUES 
('What is the period tracking feature?', 'It helps track the start and end dates of your period and your ovulation cycle.'),
('How do I add an event?', 'Click the "Add Event" button to create new events in your calendar.');

-- Step 10: Create a table for storing icons or user preferences (optional, for settings)
CREATE TABLE IF NOT EXISTS user_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    language_preference VARCHAR(50),
    theme_preference VARCHAR(50),  -- For example, light or dark mode
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Step 11: Insert some initial language preferences (optional)
INSERT INTO user_settings (user_id, language_preference, theme_preference) VALUES 
(1, 'English', 'Light'),
(2, 'Spanish', 'Dark');
