CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(orders.Quantity)
FROM orders;

CALL GetMaxQuantity();