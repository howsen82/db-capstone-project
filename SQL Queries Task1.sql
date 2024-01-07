USE LittleLemonDB;

-- Inserting records into the Customers table
INSERT INTO Customer(CustomerID, FullName, ContactNumber, Email) VALUES
(1, 'Customer 1', '111', 'cust1@email.com'),
(2, 'Customer 2', '222', 'cust2@email.com'),
(3, 'Customer 3', '333', 'cust3@email.com');

-- Inserting records into the Bookings table
INSERT INTO Booking (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);
COMMIT;

SELECT * FROM Booking;