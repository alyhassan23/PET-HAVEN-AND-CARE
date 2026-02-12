CREATE TABLE Pets (
    PetID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Species VARCHAR(20),
    Breed VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Size VARCHAR(10),
    Color VARCHAR(20),
    HealthStatus VARCHAR(100),
    ArrivalDate DATE,
    Status VARCHAR(20)
);

CREATE TABLE Adopters (
    AdopterID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    ZipCode VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    AdoptionHistory INT
);

CREATE TABLE Adoptions (
    AdoptionID INT PRIMARY KEY AUTO_INCREMENT,
    PetID INT,
    AdopterID INT,
    AdoptionDate DATE,
    Status VARCHAR(20),
    AdoptionFee DECIMAL(10, 2),
    Notes TEXT,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID),
    FOREIGN KEY (AdopterID) REFERENCES Adopters(AdopterID)
);

CREATE TABLE CareInformation (
    CareID INT PRIMARY KEY AUTO_INCREMENT,
    PetID INT,
    CareDate DATE,
    TypeOfCare VARCHAR(50),
    Description TEXT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (PetID) REFERENCES Pets(PetID)
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50)
);
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY AUTO_INCREMENT,
    DonorName VARCHAR(100),
    DonationDate DATE,
    Amount DECIMAL(10, 2),
    Notes TEXT
);
CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    EventDate DATE,
    Location VARCHAR(100),
    Description TEXT
);
CREATE TABLE PetVisits (
    VisitID INT PRIMARY KEY AUTO_INCREMENT,
    PetID INT,
    VisitDate DATE,
    VisitType VARCHAR(50),
    Notes TEXT,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID)
);
CREATE TABLE PetSupplies (
    SupplyID INT PRIMARY KEY AUTO_INCREMENT,
    SupplyName VARCHAR(100),
    Quantity INT,
    Cost DECIMAL(10, 2),
    Description TEXT
);
CREATE TABLE VolunteerHours (
    VolunteerID INT PRIMARY KEY AUTO_INCREMENT,
    VolunteerName VARCHAR(100),
    HoursWorked INT,
    DateWorked DATE,
    Notes TEXT
);




INSERT INTO Pets (Name, Species, Breed, Age, Gender, Size, Color, HealthStatus, ArrivalDate, Status)
VALUES 
('Buddy', 'Dog', 'Golden Retriever', 3, 'Male', 'Large', 'Golden', 'Vaccinated, Neutered', '2024-01-15', 'Available'),
('Mittens', 'Cat', 'Tabby', 2, 'Female', 'Medium', 'Brown', 'Vaccinated', '2024-02-01', 'Available'),
('Charlie', 'Dog', 'Poodle', 1, 'Male', 'Small', 'White', 'Vaccinated', '2024-03-10', 'Adopted'),
('Bella', 'Cat', 'Siamese', 4, 'Female', 'Small', 'Cream', 'Vaccinated, Spayed', '2024-04-05', 'Available'),
('Max', 'Dog', 'German Shepherd', 5, 'Male', 'Large', 'Black and Tan', 'Vaccinated, Neutered', '2024-05-20', 'Available'),
('Lucy', 'Dog', 'Beagle', 2, 'Female', 'Medium', 'Tricolor', 'Vaccinated', '2024-01-10', 'Available'),
('Smokey', 'Cat', 'Persian', 3, 'Male', 'Large', 'Gray', 'Vaccinated', '2024-02-15', 'Available'),
('Oscar', 'Dog', 'Bulldog', 4, 'Male', 'Medium', 'Brindle', 'Vaccinated, Neutered', '2024-03-20', 'Available'),
('Luna', 'Cat', 'Maine Coon', 1, 'Female', 'Large', 'Black', 'Vaccinated', '2024-04-25', 'Adopted'),
('Rocky', 'Dog', 'Boxer', 3, 'Male', 'Large', 'Fawn', 'Vaccinated', '2024-05-30', 'Available'),
('Molly', 'Cat', 'British Shorthair', 2, 'Female', 'Medium', 'Blue', 'Vaccinated', '2024-06-05', 'Available'),
('Rex', 'Dog', 'Dachshund', 2, 'Male', 'Small', 'Brown', 'Vaccinated', '2024-06-10', 'Available'),
('Daisy', 'Dog', 'Dalmatian', 3, 'Female', 'Large', 'White with black spots', 'Vaccinated', '2024-06-15', 'Available'),
('Coco', 'Cat', 'Sphynx', 4, 'Female', 'Medium', 'Cream', 'Vaccinated, Spayed', '2024-06-20', 'Available'),
('Buster', 'Dog', 'Rottweiler', 5, 'Male', 'Large', 'Black and Tan', 'Vaccinated, Neutered', '2024-06-25', 'Available');


INSERT INTO Adopters (FirstName, LastName, Address, City, State, ZipCode, PhoneNumber, Email, AdoptionHistory)
VALUES 
('John', 'Doe', '123 Maple St', 'Springfield', 'IL', '62704', '555-1234', 'john.doe@example.com', 2),
('Jane', 'Smith', '456 Oak St', 'Riverton', 'NJ', '08077', '555-5678', 'jane.smith@example.com', 1),
('Alice', 'Johnson', '789 Pine St', 'Fairfield', 'CA', '94533', '555-9101', 'alice.johnson@example.com', 0),
('Bob', 'Brown', '321 Birch St', 'Dover', 'DE', '19901', '555-1122', 'bob.brown@example.com', 3),
('Mary', 'Davis', '654 Elm St', 'Columbus', 'OH', '43215', '555-3344', 'mary.davis@example.com', 1),
('Peter', 'Parker', '12 Broadway', 'New York', 'NY', '10007', '555-5555', 'peter.parker@example.com', 0),
('Susan', 'Taylor', '34 Vine St', 'Hartford', 'CT', '06103', '555-6666', 'susan.taylor@example.com', 2),
('Robert', 'Wilson', '78 Cedar St', 'Albany', 'NY', '12207', '555-7777', 'robert.wilson@example.com', 1),
('Nancy', 'White', '90 Pine St', 'Trenton', 'NJ', '08608', '555-8888', 'nancy.white@example.com', 0),
('Michael', 'Lewis', '45 Walnut St', 'Boston', 'MA', '02108', '555-9999', 'michael.lewis@example.com', 1),
('Jessica', 'Lee', '67 Willow St', 'Providence', 'RI', '02903', '555-1111', 'jessica.lee@example.com', 2),
('Daniel', 'Martinez', '23 Spruce St', 'Richmond', 'VA', '23219', '555-2222', 'daniel.martinez@example.com', 0),
('Emma', 'Clark', '89 Chestnut St', 'Charleston', 'WV', '25301', '555-3333', 'emma.clark@example.com', 1),
('James', 'Harris', '56 Hickory St', 'Nashville', 'TN', '37219', '555-4444', 'james.harris@example.com', 3),
('Olivia', 'Walker', '77 Maple St', 'Atlanta', 'GA', '30303', '555-5555', 'olivia.walker@example.com', 1);


INSERT INTO Adoptions (PetID, AdopterID, AdoptionDate, Status, AdoptionFee, Notes)
VALUES 
(3, 1, '2024-03-15', 'Completed', 150.00, 'Adopted during spring event'),
(1, 2, '2024-05-05', 'Pending', 200.00, 'Awaiting home check'),
(2, 3, '2024-05-22', 'Completed', 100.00, 'Adopter has other pets'),
(4, 4, '2024-06-01', 'Pending', 120.00, 'Pending vaccination verification'),
(5, 5, '2024-06-20', 'Completed', 175.00, 'Adoption completed during summer event'),
(6, 6, '2024-02-10', 'Completed', 150.00, 'Adopted by first-time pet owner'),
(7, 7, '2024-02-25', 'Completed', 130.00, 'Adopter looking for a companion'),
(8, 8, '2024-03-10', 'Pending', 120.00, 'Home visit scheduled'),
(9, 9, '2024-03-20', 'Completed', 140.00, 'Adopted with special needs care'),
(10, 10, '2024-04-01', 'Completed', 180.00, 'Adoption through charity event'),
(11, 11, '2024-04-10', 'Pending', 160.00, 'Pending background check'),
(12, 12, '2024-04-25', 'Completed', 150.00, 'Adopted by a family with kids'),
(13, 13, '2024-05-01', 'Completed', 170.00, 'Senior citizen adoption'),
(14, 14, '2024-05-15', 'Pending', 125.00, 'Adoption pending home adjustment period'),
(15, 15, '2024-05-25', 'Completed', 160.00, 'Adoption with follow-up visits');


INSERT INTO CareInformation (PetID, CareDate, TypeOfCare, Description, Cost)
VALUES 
(1, '2024-02-10', 'Medical', 'Vaccination and general check-up', 75.00),
(2, '2024-02-15', 'Grooming', 'Full grooming session', 50.00),
(3, '2024-03-01', 'Training', 'Basic obedience training', 100.00),
(4, '2024-04-15', 'Medical', 'Spaying surgery', 150.00),
(5, '2024-05-25', 'Medical', 'Neutering surgery', 150.00),
(6, '2024-01-20', 'Medical', 'Vaccination and general check-up', 75.00),
(7, '2024-02-10', 'Grooming', 'Full grooming session', 50.00),
(8, '2024-03-15', 'Training', 'Advanced obedience training', 120.00),
(9, '2024-03-20', 'Medical', 'Dental cleaning', 85.00),
(10, '2024-04-01', 'Medical', 'Vaccination and check-up', 60.00),
(11, '2024-04-05', 'Grooming', 'Nail trimming and grooming', 45.00),
(12, '2024-04-20', 'Training', 'Behavioral training', 110.00),
(13, '2024-05-05', 'Medical', 'Vaccination and check-up', 70.00),
(14, '2024-05-10', 'Medical', 'Ear infection treatment', 95.00),
(15, '2024-05-20', 'Grooming', 'Full grooming session', 55.00);


INSERT INTO Employees (FirstName, LastName, Position, HireDate, Salary, PhoneNumber, Email)
VALUES 
('Alice', 'Smith', 'Manager', '2020-01-15', 50000.00, '555-1000', 'alice.smith@example.com'),
('Bob', 'Johnson', 'Veterinarian', '2021-03-22', 70000.00, '555-2000', 'bob.johnson@example.com'),
('Carol', 'Williams', 'Trainer', '2021-05-30', 40000.00, '555-3000', 'carol.williams@example.com'),
('David', 'Jones', 'Caretaker', '2022-07-12', 35000.00, '555-4000', 'david.jones@example.com'),
('Eve', 'Brown', 'Groomer', '2023-09-18', 32000.00, '555-5000', 'eve.brown@example.com');


INSERT INTO Donations (DonorName, DonationDate, Amount, Notes)
VALUES 
('John Doe', '2024-01-10', 100.00, 'General donation'),
('Jane Smith', '2024-01-15', 200.00, 'For veterinary care'),
('Acme Corp', '2024-02-05', 500.00, 'Corporate donation'),
('Anonymous', '2024-02-20', 50.00, 'Anonymous donation'),
('Community Group', '2024-03-15', 300.00, 'Fundraising event');


INSERT INTO Events (EventName, EventDate, Location, Description)
VALUES 
('Adoption Fair', '2024-01-20', 'City Park', 'Annual pet adoption fair'),
('Fundraising Gala', '2024-02-25', 'Downtown Hotel', 'Gala to raise funds for the shelter'),
('Volunteer Training', '2024-03-10', 'Shelter', 'Training for new volunteers'),
('Pet Health Workshop', '2024-04-05', 'Community Center', 'Workshop on pet health and care'),
('Spring Adoption Event', '2024-05-15', 'Shelter', 'Special event for spring adoptions');



INSERT INTO PetVisits (PetID, VisitDate, VisitType, Notes)
VALUES 
(1, '2024-01-10', 'Check-up', 'Routine check-up'),
(2, '2024-01-15', 'Vaccination', 'Annual vaccinations'),
(3, '2024-02-05', 'Grooming', 'Full grooming session'),
(4, '2024-02-20', 'Training', 'Obedience training'),
(5, '2024-03-15', 'Medical', 'Spaying surgery'),
(6, '2024-03-20', 'Check-up', 'Routine check-up'),
(7, '2024-04-05', 'Vaccination', 'Annual vaccinations'),
(8, '2024-04-20', 'Grooming', 'Full grooming session'),
(9, '2024-05-05', 'Training', 'Behavioral training'),
(10, '2024-05-20', 'Medical', 'Neutering surgery');


INSERT INTO PetSupplies (SupplyName, Quantity, Cost, Description)
VALUES 
('Dog Food', 50, 20.00, 'Dry dog food, 20 lb bag'),
('Cat Food', 30, 15.00, 'Dry cat food, 10 lb bag'),
('Dog Leash', 100, 5.00, 'Standard dog leash, 6 ft'),
('Cat Litter', 40, 10.00, 'Clumping cat litter, 20 lb bag'),
('Pet Bed', 20, 25.00, 'Comfortable pet bed, medium size');


INSERT INTO VolunteerHours (VolunteerName, HoursWorked, DateWorked, Notes)
VALUES 
('John Doe', 5, '2024-01-10', 'Assisted with dog walking'),
('Jane Smith', 8, '2024-01-15', 'Helped with adoption event'),
('Alice Johnson', 3, '2024-02-05', 'Cleaned cat enclosures'),
('Bob Brown', 4, '2024-02-20', 'Organized donation supplies'),
('Mary Davis', 6, '2024-03-15', 'Assisted with pet training');


SELECT * FROM pets;


SELECT Name, species, HealthStatus FROM pets;


SELECT * FROM employees WHERE Salary > 40000;

SELECT DISTINCT State, FirstName, City  FROM `adopters`;

SELECT * FROM employees WHERE Position = 'manager' AND Salary = 50000;

SELECT * FROM employees WHERE Position = 'manager' OR Salary > 30000;


SELECT * FROM `pets` WHERE NOT Gender = 'Female';

SELECT * FROM `adopters` WHERE City = 'New York' and state = 'NY' OR state = 'nj';

SELECT * FROM `pets` WHERE size = 'small' AND NOT Gender = 'male'

SELECT * FROM `pets` WHERE size = 'Large' OR NOT Gender = 'Female'


SELECT * FROM `adopters` ORDER BY FirstName DESC

SELECT * FROM `adopters` WHERE State IN ('ny', 'nj','ma')

SELECT * FROM `adopters` WHERE State NOT IN ('ny', 'nj','ma')

SELECT * FROM `volunteerhours` WHERE (HoursWorked BETWEEN 5 AND 8)


SELECT * FROM `volunteerhours` WHERE (HoursWorked BETWEEN 5 AND 8) AND VolunteerID NOT IN (1)

SELECT * FROM `adopters` WHERE FirstName LIKE 'A%'

SELECT * FROM `adopters` WHERE FirstName LIKE '%s'



ALTER TABLE adopters
ADD country varchar(255);

ALTER TABLE adopters
DROP COLUMN country;

DELETE FROM employees

Truncate Table petsupplies;

DELETE FROM employees
WHERE Salary = 50000 and Position = 'manager';

