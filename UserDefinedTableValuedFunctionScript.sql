
USE [DigitalXJackySql]
GO

CREATE FUNCTION dbo.ufn_GetOrderHistoy(@customerID int)
RETURNS TABLE
AS
RETURN
(
	SELECT oh.OrderDate AS 'Date', oh.OrderID AS 'Order Number',
	os.[Status], SUM(pd.RRP * od.Quantity) AS 'Total Price'
	FROM Product.ProductDetails AS pd
	JOIN [Order].OrderDetail AS od
	ON pd.ProductID = od.ProductID
	JOIN [Order].OrderHeader AS oh
	ON od.OrderID = oh.OrderID
	JOIN [Order].OrderStatus AS os
	ON oh.OrderStatusID = os.OrderStatusID
	WHERE oh.CustomerID = @customerID
	GROUP BY oh.OrderDate, oh.orderid, os.[Status]
);

GO