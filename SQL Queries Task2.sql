DELIMITER //
CREATE PROCEDURE CheckBooking (IN bookingDate DATE, IN tableNum INT)
BEGIN
    DECLARE isBooked INT;
    
    -- Check if the table is already booked on the provided date
    SELECT COUNT(*) INTO isBooked
    FROM Booking
    WHERE BookingDate = bookingDate AND TableNumber = tableNum;
    
    -- Output message based on the booking status
    IF isBooked > 0 THEN
        SELECT 'Table ' + tableNum + ' is already booked' AS "Booking Status";
    ELSE
        SELECT 'Table is available for booking on the given date' AS "Booking Status";
    END IF;
END //
DELIMITER ;

call CheckBooking("2022-11-12", 3);