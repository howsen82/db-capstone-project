USE LittleLemonDB;

CREATE VIEW OrdersView AS
SELECT orders.OrderID, orders.Quantity, orders.TotalCost
FROM orders
WHERE orders.Quantity > 2;
commit;

SELECT * FROM OrdersView;