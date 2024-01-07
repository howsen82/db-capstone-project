USE LittleLemonDB;

CREATE VIEW OrdersView2 AS
SELECT customer.CustomerID, customer.FullName, orders.OrderID, orders.TotalCost, menu.MenuName, menuitem.CourseName
FROM customer INNER JOIN orders
INNER JOIN menu INNER JOIN MenuItem
WHERE orders.TotalCost > 150
ORDER BY orders.TotalCost DESC;
COMMIT;

SELECT * FROM OrdersView2;