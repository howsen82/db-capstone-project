PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders where OrderID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;