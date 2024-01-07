DELIMITER //
CREATE PROCEDURE CancelBooking (
    IN bookingID INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = bookingID;

    SELECT 'Booking ' + bookingID + ' canceled' AS 'Confirmation';
END //
DELIMITER ;

CALL CancelBooking(9);