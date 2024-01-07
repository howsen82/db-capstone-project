-- Create the AddValidBooking stored procedure
DELIMITER //

CREATE PROCEDURE AddValidBooking (
    IN bookingDate DATE, 
    IN tableNum INT
)
BEGIN
    DECLARE isBooked INT;
    DECLARE nextBookingID INT;

    -- Start the transaction
    START TRANSACTION;
    
    SELECT COALESCE(MAX(BookingID), 0) + 1 INTO nextBookingID FROM Bookings;

    -- Check if the table is already booked on the provided date
    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE BookingDate = bookingDate AND TableNumber = tableNum;

    -- If the table is already booked, rollback the transaction
    IF isBooked > 0 THEN
        ROLLBACK;
        SELECT 'Table ' + tableNum + 'is already booked - booking cancelled' AS Status;
    ELSE        
        -- If the table is available, add the new booking and commit the transaction
        INSERT INTO Booking (BookingID, BookingDate, TableNumber, CustomerID)
        VALUES (nextBookingID, bookingDate, tableNum, 1); -- Replace '1' with the actual CustomerID

        COMMIT;
        SELECT 'Booking successful on ' + bookingDate + ' at table ' + tableNum + '.' AS Status;
    END IF;
END //
DELIMITER ;

CALL AddValidBooking('2022-12-17', 6);