-- Airbnb Hospitality & Booking Trends 

-- Project Overview -:
-- This project focuses strictly on relational logic using JOINs and aggregation functions. 
-- Subqueries and CTEs are intentionally excluded to strengthen core SQL fundamentals. 

-- Problem Statement -: 
-- Provide strategic insights into property performance and booking behavior. 


-- Create the Database 
CREATE DATABASE AirbnbHospitalityproject; 


-- use the database
USE AirbnbHospitalityproject;


-- create the table Dim_Customer
CREATE TABLE Dim_Customer(
Customer_ID	INT PRIMARY KEY,
First_Name VARCHAR(50),	
Last_Name VARCHAR(50),	
Age_Group INT,	
Gender VARCHAR(50),	
Nationality VARCHAR(50),	
Customer_Segment VARCHAR(50)
);


-- create the table Dim_Date
CREATE TABLE Dim_Date(
Date_ID	INT PRIMARY KEY,
Full_Date DATE,	
Day INT,	
Month INT,	
Quarter INT,	
Year INT,	
Weekday_Name VARCHAR(50),
Is_Weekend BOOLEAN
);


-- create the table Dim_Host
CREATE TABLE Dim_Host(
Host_ID	INT PRIMARY KEY,
Host_Name VARCHAR(50),	
Superhost_Flag BOOLEAN,	
Total_Listings INT,	
Host_Since_Year INT,	
Response_Time VARCHAR(50)
);

-- create the table Dim_Property
CREATE TABLE Dim_Property(
Property_ID	INT PRIMARY KEY,
Host_ID INT,	
Property_Type VARCHAR(50),
Room_Type VARCHAR(50),
Location_City VARCHAR(50),	
Location_Country VARCHAR(50),
No_of_Bedrooms INT,	
No_of_Bathrooms INT,	
Amenities VARCHAR(150),
Price_per_Night FLOAT
);


-- create the table Fact_Bookings
CREATE TABLE Fact_Bookings(
Booking_ID	INT PRIMARY KEY,	
Property_ID INT,	
Date_ID INT,	
Customer_ID INT,	
Host_ID INT,	
Revenue FLOAT,
Nights_Booked INT,
Number_of_Guests INT,
Cleaning_Fee FLOAT,
Service_Fee FLOAT
);


-- Insert the value into the table Dim_Customer
INSERT INTO Dim_Customer VALUES
(0,"Michael","Chapman",18-25,"Other","Guernsey","Budget"),
(1,"Elizabeth","Hardin",50-75,"Female","Angola","Premium"),
(2,"Marc","Ball",26-35,"Female","Belarus","Budget"),
(3,"Michael","Maxwell",18-25,"Male","Guam","Premium"),
(4,"Christina","Figueroa",36-50,"Other","French Southern Territories","Standard"),
(5,"Ashley","Robinson",50-75,"Male","Guinea","Standard"),
(6,"Madison","Rodriguez",50-75,"Female","Algeria","Premium"),
(7,"Jessica","Rogers",18-25,"Male","Colombia","Standard"),
(8,"Frank","Wheeler",50-75,"Male","Micronesia","Standard"),
(9,"Eduardo","Thompson",26-35,"Male","Sierra Leone","Budget"),
(10,"Angela","Rodgers",18-25,"Male","Vietnam","Budget"),
(11,"Scott","Williams",26-35,"Female","French Southern Territories","Premium"),
(12,"Jamie","Cox",51,"Female","Grenada","Premium"),
(13,"Eric","Castillo",26-35,"Male","Georgia","Budget"),
(14,"Kevin","Washington",36-50,"Female","Lithuania","Budget"),
(15,"Audrey","Robinson",36-50,"Other","Burundi","Premium"),
(16,"Allison","Gonzalez",18-25,"Other","Netherlands Antilles","Premium"),
(17,"Mary","Torres",26-35,"Other","Montenegro","Premium"),
(18,"Joseph","Kent",36-50,"Male","Argentina","Standard"),
(19,"Timothy","Cross",26-35,"Male","Hungary","Premium"),
(20,"Ronald","Bell",50-75,"Female","Burkina Faso","Standard"),
(21,"Darrell","Hood",18-25,"Female","Ethiopia","Budget"),
(22,"Evan","Martin",26-35,"Female","Lithuania","Standard"),
(23,"Cynthia","Gill",26-35,"Female","Taiwan","Budget"),
(24,"Jeremy","Sexton",36-50,"Female","Belarus","Standard"),
(25,"Cassandra","Morris",18-25,"Female","Guinea-Bissau","Budget"),
(26,"Justin","Anderson",50-75,"Male","Comoros","Standard"),
(27,"Leah","Adams",36-50,"Male","Haiti","Budget"),
(28,"Michelle","Baldwin",50-75,"Male","Mali","Budget"),
(29,"Antonio","Golden",36-50,"Male","Japan","Premium"),
(30,"Jordan","Stewart",36-50,"Other","South Africa","Budget");



-- Insert the value into the table Dim_Date
INSERT INTO Dim_Date VALUES
(0,"2020-01-01",1,1,1,2020,"Wednesday",FALSE),
(1,"2020-01-02",2,1,1,2020,"Thursday",FALSE),
(2,"2020-01-03",3,1,1,2020,"Friday",FALSE),
(3,"2020-01-04",4,1,1,2020,"Saturday",TRUE),
(4,"2020-01-05",5,1,1,2020,"Sunday",TRUE),
(5,"2020-01-06",6,1,1,2020,"Monday",FALSE),
(6,"2020-01-07",7,1,1,2020,"Tuesday",FALSE),
(7,"2020-01-08",8,1,1,2020,"Wednesday",FALSE),
(8,"2020-01-09",9,1,1,2020,"Thursday",FALSE),
(9,"2020-01-10",10,1,1,2020,"Friday",FALSE),
(10,"2020-01-11",11,1,1,2020,"Saturday",TRUE),
(11,"2020-01-12",12,1,1,2020,"Sunday",TRUE),
(12,"2020-01-13",13,1,1,2020,"Monday",FALSE),
(13,"2020-01-14",14,1,1,2020,"Tuesday",FALSE),
(14,"2020-01-15",15,1,1,2020,"Wednesday",FALSE),
(15,"2020-01-16",16,1,1,2020,"Thursday",FALSE),
(16,"2020-01-17",17,1,1,2020,"Friday",FALSE),
(17,"2020-01-18",18,1,1,2020,"Saturday",TRUE),
(18,"2020-01-19",19,1,1,2020,"Sunday",TRUE),
(19,"2020-01-20",20,1,1,2020,"Monday",FALSE),
(20,"2020-01-21",21,1,1,2020,"Tuesday",FALSE),
(21,"2020-01-22",22,1,1,2020,"Wednesday",FALSE),
(22,"2020-01-23",23,1,1,2020,"Thursday",FALSE),
(23,"2020-01-24",24,1,1,2020,"Friday",FALSE),
(24,"2020-01-25",25,1,1,2020,"Saturday",TRUE),
(25,"2020-01-26",26,1,1,2020,"Sunday",TRUE),
(26,"2020-01-27",27,1,1,2020,"Monday",FALSE),
(27,"2020-01-28",28,1,1,2020,"Tuesday",FALSE),
(28,"2020-01-29",29,1,1,2020,"Wednesday",FALSE),
(29,"2020-01-30",30,1,1,2020,"Thursday",FALSE),
(30,"2020-01-31",31,1,1,2020,"Friday",FALSE);


-- Insert the value into the table Dim_Host
INSERT INTO Dim_Host VALUES
(0,"Taylor Anderson",TRUE,12,2021,"within a day"),
(1,"Linda Burke",TRUE,12,2014,"within a few hours"),
(2,"Allison Buck",TRUE,13,2023,"within a day"), 
(3,"Krystal Miles",FALSE,3,2019,"within a day"),
(4,"Faith Miller",FALSE,16,2021,"within a day"),
(5,"Michael Duran",TRUE,8,2020,"within an hour"),
(6,"Alexandra Mathis",TRUE,7,2013,"within an hour"),
(7,"Brandi Escobar",TRUE,8,2021,"within an hour"),
(8,"Stacy Randall",TRUE,7,2024,"within a day"),
(9,"Melanie Miller",TRUE,9,2010,"within a few hours"),
(10,"Ralph Allen",FALSE,2,2024,"within an hour"),
(11,"Frank Hickman",TRUE,13,2019,"within a few hours"),
(12,"Mark Ross",TRUE,6,2018,"within a day"),
(13,"William Howard",TRUE,5,2014,"within an hour"),
(14,"Jesse Garner PhD",FALSE,18,2010,"within an hour"),
(15,"Michelle Torres",TRUE,11,2014,"within a day"),
(16,"Kim Campbell",FALSE,18,2020,"within a day"),
(17,"Noah Henry",FALSE,3,2023,"within a few hours"),
(18,"Katie Hill",FALSE,13,2017,"within a few hours"),
(19,"Michelle Allen",TRUE,8,2013,"within a few hours"),
(20,"Kristina Phillips",FALSE,13,2017,"within a few hours"),
(21,"Bobby Adams",TRUE,16,2024,"within a few hours"),
(22,"Steven Evans",TRUE,10,2022,"within a few hours"),
(23,"Angel Woods",TRUE,14,2013,"within an hour"),
(24,"Jacqueline Anderson",TRUE,11,2012,"within an hour"),
(25,"Brian Reynolds",TRUE,20,2020,"within an hour"),
(26,"Frank Johnston",FALSE,11,2020,"within an hour"),
(27,"Brian Sims",TRUE,2,2012,"within a day"),
(28,"Richard Brennan",FALSE,7,2021,"within an hour"),
(29,"Danny Graves",TRUE,10,2015,"within a day"),
(30,"Kevin Jordan",TRUE,19,2011,"within an hour");


-- Insert the value into the table Dim_Property
INSERT INTO Dim_Property VALUES
(0,81,"House","Private room","Belindahaven","Greece",3,2,"why, good, tonight, realize, beautiful",880.36),
(1,243,"Villa","Shared room","East Travis","Portugal",2,3,"though, while, certainly, it, letter",109.95),
(2,167,"Studio","Entire place","Osbornechester","Papua New Guinea",3,3,"buy, name, subject, rock, old",404.32),
(3,87,"Villa","Private room","Sandersmouth","Algeria",5,3,"meeting, attack, our, apply, different",702.78),
(4,176,"Apartment","Shared room","East Steven","Sudan",5,2,"anything, example, edge, final, how",60.32),
(5,264,"House","Entire place","West Anitaberg","Guam",5,2,"general, important, thank, minute, until",542.71),
(6,95,"House","Shared room","Jasonville","Timor-Leste",5,2,"light, each, can, evidence, later",934.34),
(7,61,"Studio","Entire place","Lorichester","Cyprus",5,3,"memory, page, pattern, political, stay",773.03),
(8,100,"Studio","Entire place","Andrefurt","Cape Verde",4,3,"cover, truth, hit, purpose, deal",291.28),
(9,299,"Studio","Private room","North Kylestad","Panama",5,2,"news, phone, at, treat, special",311.62),
(10,189,"Studio","Private room","Tammychester","Oman",5,1,"popular, prove, degree, do, rest",273.26),
(11,165,"House","Private room","South Benjamin","Cyprus",3,1,"argue, by, protect, impact, government",591.04),
(12,81,"House","Entire place","New Paulhaven","Rwanda",4,1,"brother, of, wait, while, use",183.19),
(13,185,"Villa","Entire place","Julieview","Niue",3,1,"open, institution, artist, there, baby",536.8),
(14,142,"Apartment","Private room","Port Albert","Yemen",3,2,"computer, enough, role, begin, war",277.8),
(15,151,"Villa","Entire place","New Williamberg","Malaysia",4,3,"anything, wait, realize, each, hotel",253.01),
(16,15,"Studio","Entire place","South Abigailmouth","Jamaica",5,3,"each, art, small, pick, laugh",51.57),
(17,300,"House","Entire place","Robertsberg","Vanuatu",1,2,"reach, foot, religious, mission, free",254.36),
(18,86,"Studio","Private room","Jonesport","Nigeria",3,1,"catch, station, interesting, suffer, PM",448.75),
(19,33,"Studio","Shared room","West Kaitlyn","Azerbaijan",3,2,"process, own, move, window, town",727.66),
(20,117,"House","Shared room","North Michaelmouth","Ukraine",1,3,"notice, wish, network, professional, cold",371.71),
(21,48,"House","Private room","New Michaelchester","Nauru",4,1,"manage, window, director, boy, develop",751.45),
(22,52,"Apartment","Entire place","West Samanthafurt","Latvia",4,2,"behavior, member, gun, increase, guy",807.98),
(23,112,"Studio","Private room","Port Timothy","Kuwait",1,2,"travel, involve, main, kitchen, every",999.83),
(24,159,"Studio","Shared room","Lake Amymouth","Saint Barthelemy",4,2,"poor, age, difficult, reflect, attorney",325.82),
(25,75,"Studio","Shared room","Delgadotown","Mongolia",5,2,"people, available, impact, deep, describe",252.32),
(26,277,"House","Private room","Mckinneyfort","Croatia",3,2,"conference, food, director, director, first",920.27),
(27,95,"Studio","Private room","Lake Carlymouth","Cayman Islands",5,1,"project, Democrat, pass, official, indeed",606.73),
(28,245,"House","Private room","Kimberlymouth","Uruguay",4,1,"condition, effort, shake, follow, happy",169.95),
(29,75,"Studio","Entire place","Brandontown","Armenia",5,2,"player, focus, current, view, future",63.28),
(30,132,"House","Private room","Port Meagan","Nepal",4,3,"cost, order, a, open, people",723.55);


-- Insert the value into the table Fact_Bookings
INSERT INTO Fact_Bookings VALUES
(0,789,1159,3090,135,3213.39,18,5,190.09,121.4),
(1,341,762,2579,75,205.34,19,6,56.29,21.99),
(2,350,799,1165,43,2130.46,13,7,139.33,120.65),
(3,742,90,539,283,2581.05,9,1,60.42,56.15),
(4,674,70,2500,175,3609.21,21,6,119.42,50.01),
(5,533,283,3405,260,128.34,4,6,101.92,49.87),
(6,106,624,1679,20,1635.26,4,4,37.03,31.43),
(7,901,934,2833,33,3642.36,14,2,82.67,29.36),
(8,400,1174,3738,41,4831.59,17,8,184.08,108.9),
(9,1431,1185,3226,263,1484.07,13,5,53.4,82.04),
(10,1293,1443,1345,114,3284.05,18,2,169.34,84.52),
(11,1202,681,2391,278,986.14,13,1,95.03,37.67),
(12,463,213,3392,274,2068.72,19,4,91.58,63.34),
(13,1094,1646,2186,42,1057.33,6,8,188.38,16.13),
(14,1073,1793,1040,26,2753.23,15,1,26.77,64.68),
(15,1322,1212,4090,251,4462.52,4,2,169.11,24.59),
(16,1375,1417,467,106,3979.75,4,2,60.43,24.05),
(17,1478,282,3367,255,2677.48,5,7,64.67,125.04),
(18,51,740,1167,226,744.03,5,4,113.11,63.71),   
(19,794,1560,3164,80,664.97,18,6,60.3,14.88),
(20,679,133,2332,35,2611.12,6,5,22.64,71.6),
(21,137,1298,4450,194,4600.4,19,1,187.61,135.72),
(22,627,212,529,209,342.86,11,8,78.77,37.92),
(23,441,11,3046,69,4826.96,21,6,170.91,48.43),
(24,443,1069,4930,40,3008.18,10,6,126.48,78.15),
(25,981,928,4778,158,214.3,9,1,35.77,100.19),
(26,310,1037,12,32,2491.48,12,8,119.14,51.29),
(27,457,1573,2751,64,1264.15,6,6,27.45,51.2),
(28,376,56,2503,104,4776.14,5,6,41.53,70.43),
(29,1432,357,366,60,2349.06,6,4,87.28,129.64),
(30,317,1699,816,64,3062.98,7,8,68.92,42.54);


-- to check the values from the table Dim_Customer
SELECT * FROM Dim_Customer;


-- to check the values from the table Dim_Date
SELECT * FROM Dim_Date;

-- to check the values from the table Dim_Host
SELECT * FROM Dim_Host;


-- to check the values from the table Dim_Property
SELECT * FROM Dim_Property;


-- to check the values from the table Fact_Bookings
SELECT * FROM Fact_Bookings;



-- Key SQL Tasks: 

-- 1. Host Success – Superhosts and total bookings received. 
SELECT 
h.Superhost_Flag,h.Total_Listings
FROM Dim_Host AS h;



-- 2. Property Revenue – Revenue by property type.
SELECT  
    p.Property_Type,  
    SUM(f.Revenue * f.Cleaning_Fee * f.Service_Fee ) AS Total_Revenue 
FROM Dim_Property AS P
JOIN Fact_Bookings AS f ON p.property_id = f.property_id
GROUP BY p.Property_Type 
ORDER BY Total_Revenue DESC;
 
   
 
-- 4. Booking Origins – Total bookings by nationality. 
SELECT 
c.Nationality,
COUNT(f.Booking_Id) AS Total_Booking
FROM Dim_Customer AS c
JOIN Fact_Bookings AS F ON c.Customer_id = f.Customer_id
GROUP BY c.Nationality
ORDER BY Total_Booking DESC;



-- 5. Rating Analysis – Properties with average rating above 4.5.
SELECT 
COUNT(p.Property_Type) AS Total_Rating,
h.Response_Time
FROM Dim_Host AS h
JOIN Dim_Property AS p ON h.Host_id = p.Host_id
GROUP BY h.Response_Time
ORDER BY Total_Rating DESC;












						





