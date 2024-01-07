USE LittleLemonDB;

CREATE VIEW OrdersView3 AS
SELECT MenuName from menu where MenuID=any (select MenuID from orders where Quantity > 2);
COMMIT;

SELECT * FROM OrdersView3