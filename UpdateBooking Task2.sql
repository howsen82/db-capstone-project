DELIMITER //
CREATE PROCEDURE UpdateBooking (
    IN bookingID INT,
    IN newBookingDate DATE
)
BEGIN
    UPDATE Booking
    SET BookingDate = newBookingDate
    WHERE BookingID = bookingID;

    SELECT 'Booking ' + bookingID + 'updated' AS Status;
END //

DELIMITER ;

CALL UpdateBooking(9, "2022-12-27");