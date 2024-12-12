CREATE TABLE User (
    Email VARCHAR(50) UNIQUE NOT NULL,
    Refferal VARCHAR(50),
    Creation_date DATE NOT NULL,
    Username VARCHAR(50) NOT NULL,
    Date_of_birth DATE NOT NULL,
    PRIMARY KEY (Email),
    FOREIGN KEY (Refferal) REFERENCES User(Email)
);

CREATE TABLE User_Library (
    User_email VARCHAR(50) NOT NULL PRIMARY KEY,
    Achievement_completion INTEGER(2) NOT NULL,
    Total_playtime INTEGER(6) NOT NULL,
    FOREIGN KEY (User_email) REFERENCES User(Email)
);

CREATE TABLE Game (
    Title VARCHAR(200) NOT NULL,
    Serial_number INTEGER(20) UNIQUE NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Required_storage INTEGER(10) NOT NULL,
    Studio VARCHAR(100) NOT NULL,
    Rating INTEGER(1),
    Price INTEGER(5) NOT NULL,
    PRIMARY KEY (Title, Serial_number)
);

CREATE TABLE Personal_Game (
    Invoice_ID INTEGER(10) UNIQUE NOT NULL,
    Game_title VARCHAR(50) NOT NULL,
    Game_serial_number INTEGER(10) NOT NULL,
    Shared_redemption_key INTEGER(10),
    Redemption_key INTEGER(10) NOT NULL UNIQUE,
    User_email VARCHAR(50) NOT NULL,
    User_rating INTEGER(1) NOT NULL,
    Completion_status INTEGER(2) NOT NULL,
    Time_played INTEGER(6) NOT NULL,
    Last_opened DATE,
    PRIMARY KEY (Invoice_ID, Game_title, Game_serial_number),
    FOREIGN KEY (Shared_redemption_key) REFERENCES Personal_Game (Redemption_key),
    FOREIGN KEY (Game_title) REFERENCES Game (Title),
    FOREIGN KEY (User_email) REFERENCES User (Email),
    FOREIGN KEY (Game_serial_number) REFERENCES Game (serial_number)
);

CREATE TABLE Category (
    Name VARCHAR(50) UNIQUE NOT NULL,
    Age_restriction INTEGER(3),
    Device_specific VARCHAR(3) NOT NULL,
    PRIMARY KEY (Name)
);
CREATE TABLE Game_Category (
    Game_title VARCHAR(50) NOT NULL,
    Game_serial_number INTEGER(10) NOT NULL,
    Category_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Game_title, Game_serial_number, Category_name),
    FOREIGN KEY (Game_title) REFERENCES Game (Title),
    FOREIGN KEY (Game_serial_number) REFERENCES Game (Serial_number),
    FOREIGN KEY (Category_name) REFERENCES Category (Name)
);

-- Insert data into User
INSERT INTO User (Email, Refferal, Creation_date, Username, Date_of_birth) VALUES
('user1@example.com', NULL, '2022-01-01', 'UserOne', '1990-01-01'),
('user2@example.com', 'user1@example.com', '2022-02-01', 'UserTwo', '1992-02-02'),
('user3@example.com', 'user1@example.com', '2022-03-01', 'UserThree', '1995-03-03');

-- Insert data into User_Library
INSERT INTO User_Library (User_email, Achievement_completion, Total_playtime) VALUES
('user1@example.com', 75, 1200),
('user2@example.com', 50, 800),
('user3@example.com', 90, 1500);

-- Insert data into Game
INSERT INTO Game (Title, Serial_number, Genre, Required_storage, Studio, Rating, Price) VALUES
('Adventure Quest', 1001, 'Adventure', 15000, 'Studio A', 5, 4999),
('Space Battle', 1002, 'Action', 20000, 'Studio B', 4, 5999),
('Mystery World', 1003, 'Puzzle', 10000, 'Studio C', 3, 3999);

-- Insert data into Personal_Game
INSERT INTO Personal_Game (Invoice_ID, Game_title, Game_serial_number, Shared_redemption_key, Redemption_key, User_email, User_rating, Completion_status, Time_played, Last_opened) VALUES
(1, 'Adventure Quest', 1001, NULL, 1234567890, 'user1@example.com', 5, 100, 300, '2023-01-01'),
(2, 'Space Battle', 1002, 1234567890, 1234567891, 'user2@example.com', 4, 80, 200, '2023-01-15'),
(3, 'Mystery World', 1003, NULL, 1234567892, 'user3@example.com', 3, 60, 150, '2023-02-01');

-- Insert data into Category
INSERT INTO Category (Name, Age_restriction, Device_specific) VALUES
('Adventure', 12, 'No'),
('Action', 16, 'No'),
('Puzzle', 0, 'Yes');

-- Insert data into Game_Category
INSERT INTO Game_Category (Game_title, Game_serial_number, Category_name) VALUES
('Adventure Quest', 1001, 'Adventure'),
('Space Battle', 1002, 'Action'),
('Mystery World', 1003, 'Puzzle');


DESC Game_Category;
DESC Category;
DESC Personal_Game;
DESC Game;
DESC User;
DESC User_Library;
