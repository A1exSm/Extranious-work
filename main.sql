CREATE TABLE User (
    Email VARCHAR(50) NOT NULL,
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
    Invoice_ID INTEGER(10) NOT NULL,
    Game_title VARCHAR(50) NOT NULL,
    Game_serial_number INTEGER(10) NOT NULL,
    Shared_redemption_key INTEGER(10),
    Redemption_key INTEGER(10) NOT NULL UNIQUE,
    User_email VARCHAR(50) NOT NULL,
    User_rating INTEGER(1) NOT NULL,
    Completion_status INTEGER(2) NOT NULL,
    Time_played INTEGER(6) NOT NULL,
    Last_opened DATE,
    PRIMARY KEY (Invoice_ID),
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
 -- date = year-month-day
-- Insert data into User
INSERT INTO User (Email, Refferal, Creation_date, Username, Date_of_birth) VALUES
('user1@example.com', NULL, '2009-01-01', 'UserOne', '1990-01-01'),
('user2@example.com', NULL, '2010-01-01', 'UserTwo', '1991-02-01'),
('user3@example.com', NULL, '2011-01-01', 'UserThree', '1992-03-01'),
('alex@example.com', NULL, '2009-12-26', 'a1ex', '1998-03-25'),
('Lior@example.com', 'alex@example.com', '2010-1-10', 'Lion', '199-02-12'),
('john.doe@example.com', 'alex@example.com', '2010-02-14', 'ShadowHawk99', '1995-07-19'),
('jane.smith@example.com', NULL, '2011-05-23', 'FireDragonX', '1994-11-08'),
('mike.tyson@example.com', 'Lior@example.com', '2012-09-15', 'SteelFury76', '1996-04-01'),
('anna.brown@example.com', 'jane.smith@example.com', '2013-12-30', 'NovaStrike23', '1993-02-20'),
('chris.green@example.com', NULL, '2014-07-11', 'PhantomGale', '1997-08-16'),
('emily.white@example.com', 'john.doe@example.com', '2015-03-27', 'CrimsonWolfX', '1998-10-05'),
('daniel.jackson@example.com', 'chris.green@example.com', '2016-06-18', 'BlazeVortex', '1999-01-12'),
('sarah.jones@example.com', 'emily.white@example.com', '2017-01-22', 'LunarGhost88', '2000-09-21'),
('oliver.king@example.com', 'daniel.jackson@example.com', '2018-04-05', 'ThunderRavenZ', '1996-12-03'),
('lucy.adams@example.com', 'sarah.jones@example.com', '2019-11-09', 'PixelHunter42', '1999-06-15');

-- Insert data into User_Library
INSERT INTO User_Library (User_email, Achievement_completion, Total_playtime) VALUES
('user1@example.com', 75, 1200),
('user2@example.com', 50, 800),
('user3@example.com', 90, 1500),
('alex@example.com', 85, 2200),
('Lior@example.com', 60, 1400),
('john.doe@example.com', 75, 1200),
('jane.smith@example.com', 50, 800),
('mike.tyson@example.com', 90, 1500),
('anna.brown@example.com', 10, 50),
('chris.green@example.com', 45, 900),
('emily.white@example.com', 70, 2000),
('daniel.jackson@example.com', 55, 1000),
('sarah.jones@example.com', 30, 600),
('oliver.king@example.com', 65, 1800),
('lucy.adams@example.com', 20, 400);

-- Insert data into Game
INSERT INTO Game (Title, Serial_number, Genre, Required_storage, Studio, Rating, Price) VALUES
('Adventure Quest', 1001, 'Adventure', 15000, 'Artix Entertainment', 3, 30),
('Call of Duty', 1002, 'Shooter', 60000, 'Treyarch', 4, 70),
('Celeste', 1010, 'Adventure', 3000, 'Maddy Makes Games', 5, 20),
('Grand Theft Auto V', 1011, 'Adventure', 65000, 'Rockstar Games', 5, 40),
('The Witcher 3: Wild Hunt', 1012, 'Action', 50000, 'CD Projekt Red', 5, 50),
('Among Us', 1013, 'Party', 250, 'Innersloth', 4, 5),
('Red Dead Redemption 2', 1014, 'Action', 120000, 'Rockstar Games', 5, 70),
('Halo Infinite', 1015, 'Shooter', 50000, '343 Industries', 4, 60),
('Animal Crossing: New Horizons', 1016, 'Simulation', 8000, 'Nintendo', 5, 60),
('The Legend of Heroes', 1003, 'RPG', 45000, 'Nihon Falcom', 5, 50),
('Minecraft', 1004, 'Adventure', 10000, 'Mojang Studios', 5, 25),
('Overwatch', 1005, 'Action', 22000, 'Blizzard Entertainment', 4, 40),
('Stardew Valley', 1006, 'Simulation', 5000, 'ConcernedApe', 5, 15),
('Dark Souls III', 1007, 'RPG', 25000, 'FromSoftware', 4, 60),
('Hollow Knight', 1008, 'Adventure', 9000, 'Team Cherry', 5, 20),
('Cyberpunk 2077', 1009, 'Action', 70000, 'CD Projekt Red', 4, 60);

-- Insert data into Personal_Game
INSERT INTO Personal_Game (Invoice_ID, Game_title, Game_serial_number, Shared_redemption_key, Redemption_key, User_email, User_rating, Completion_status, Time_played, Last_opened) VALUES 
(1, 'Adventure Quest', 1001, NULL, 0000, 'user1@example.com', 5, 100, 300, '2023-01-01'),
(2, 'Call of Duty', 1002, NULL, 0001, 'user2@example.com', 4, 80, 200, '2023-01-15'),
(3, 'The Witcher 3: Wild Hunt', 1012, NULL, 0002, 'user3@example.com', 3, 60, 150, '2023-02-01'),
(4, 'Among Us', 1013, NULL, 0003, 'alex@example.com', 4, 90, 180, '2023-03-10'),
(5, 'Celeste', 1010, NULL, 0004, 'Lior@example.com', 5, 95, 220, '2023-04-12'),
(6, 'Grand Theft Auto V', 1011, NULL, 0005, 'john.doe@example.com', 5, 85, 250, '2023-05-08'),
(7, 'The Legend of Heroes', 1003, NULL, 0006, 'jane.smith@example.com', 4, 75, 180, '2023-06-22'),
(8, 'Red Dead Redemption 2', 1014, NULL, 0007, 'mike.tyson@example.com', 5, 100, 350, '2023-07-01'),
(9, 'Halo Infinite', 1015, NULL, 0008, 'anna.brown@example.com', 4, 60, 120, '2023-08-03'),
(10, 'Minecraft', 1004, NULL, 0009, 'chris.green@example.com', 5, 100, 500, '2023-09-11'),
(11, 'Stardew Valley', 1006, NULL, 0010, 'emily.white@example.com', 4, 80, 200, '2023-10-15'),
(12, 'Dark Souls III', 1007, NULL, 0011, 'daniel.jackson@example.com', 4, 70, 300, '2023-11-12'),
(13, 'Hollow Knight', 1008, NULL, 0012, 'sarah.jones@example.com', 5, 95, 250, '2023-12-01'),
(14, 'Cyberpunk 2077', 1009, NULL, 0013, 'oliver.king@example.com', 4, 85, 220, '2023-12-10'),
(15, 'Animal Crossing: New Horizons', 1016, NULL, 0014, 'lucy.adams@example.com', 5, 90, 300, '2023-12-12');

-- Insert data into Category
INSERT INTO Category (Name, Age_restriction, Device_specific) VALUES
('Adventure', 12, 'No'),
('Shooter', 18, 'No'),
('Action', 16, 'No');

-- Insert data into Game_Category
INSERT INTO Game_Category (Game_title, Game_serial_number, Category_name) VALUES
('Adventure Quest', 1001, 'Adventure'),
('Call of Duty', 1002, 'Shooter'),
('The Witcher 3: Wild Hunt', 1003, 'Action');
DESC User;
DESC User_Library;
DESC Personal_Game;
DESC Game;
DESC Category;
DESC Game_Category;

Select * FROM User;
-- Select * FROM User WHERE Date_of_birth >= '1990-01-12';
/* SECTION 6 DROP TABLES */
DROP TABLE Game_Category;
DROP TABLE Personal_Game;
DROP TABLE Game;
DROP TABLE User_Library;
DROP TABLE User;
DROP TABLE Category;


SHOW TABLES;
