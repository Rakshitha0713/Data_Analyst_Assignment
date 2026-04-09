-- Drop tables if already exist
DROP TABLE IF EXISTS booking_commercials;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS users;

-- Create Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

-- Create Bookings table
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    booking_date DATE,
    room_no INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create Items table
CREATE TABLE items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate INT
);

-- Create Booking Commercials table
CREATE TABLE booking_commercials (
    id INT PRIMARY KEY,
    booking_id INT,
    bill_id INT,
    bill_date DATE,
    item_id INT,
    item_quantity INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

-- Insert data users
INSERT INTO users VALUES
(1, 'Rishi', '9898989898', 'rishi@mail.com', 'Hyderabad'),
(2, 'Arjun', '8989898989', 'arjun@mail.com', 'Delhi');

--Insert data into bookings
INSERT INTO bookings VALUES
(101, '2021-11-09', 201, 1),
(102, '2021-11-16', 202, 2);

--Insert data into items
INSERT INTO items VALUES
(1, 'Food', 200),
(2, 'Laundry', 100);

--Insert data into booking_commercials
INSERT INTO booking_commercials VALUES
(1, 101, 5001, '2021-11-09', 1, 3),
(2, 101, 5002, '2021-11-09', 2, 2),
(3, 102, 5003, '2021-11-16', 1, 5);