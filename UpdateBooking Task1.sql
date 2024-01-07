DELIMITER //
CREATE PROCEDURE AddBooking (
    IN bookingID INT, 
    IN customerID INT,
    IN tableNum INT,
    IN bookingDate DATE
)
BEGIN
    INSERT INTO Booking (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (bookingID, customerID, bookingDate, tableNum);
    
    SELECT 'New booking added' AS 'Confirmation';
END //

DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");