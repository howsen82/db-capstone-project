DELIMITER //
CREATE PROCEDURE CancelOrder (IN orderId INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = orderId;
    SELECT 'Order' + orderId + 'is cancelled' AS Result;
END //
DELIMITER ;
