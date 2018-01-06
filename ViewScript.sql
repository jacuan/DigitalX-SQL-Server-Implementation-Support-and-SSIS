USE [DigitalXJackySql]
GO


--View for orders which are on Backorder:

CREATE VIEW dbo.vOrdersOnBackorder
AS
SELECT	cd.FirstName AS 'First Name', cd.LastName AS 'Last Name', cd.Email,
		cd.Telephone, cd.Mobile, ad.AddressType AS 'Address Type', ad.Street,
		ad.Suburb, ad.City, ad.Country, ad.PostalCode, oh.OrderDate, oh.OrderID AS 'Order Number'
FROM Address.AddressDetails AS ad
JOIN Address.CustomerAddress AS ca
ON ad.AddressID = ca.AddressID
JOIN Customer.CustomerDetails AS cd
ON ca.CustomerID = cd.CustomerID
JOIN [Order].OrderHeader AS oh
ON cd.CustomerID = oh.CustomerID
JOIN [Order].OrderStatus AS os
ON oh.OrderStatusID = os.OrderStatusID
WHERE os.Status = 'BACKORDER'

GO


--View for products which are on backorder:

CREATE VIEW dbo.vProductsOnBackorder
AS
SELECT pd.ProductName AS 'Product Name', SUM(od.Quantity) AS 'Quantity'
FROM Product.ProductDetails AS pd
JOIN [Order].OrderDetail AS od
ON pd.ProductID = od.ProductID
JOIN [Order].OrderHeader AS oh
ON od.OrderID = oh.OrderID
JOIN [Order].OrderStatus AS os
ON oh.OrderStatusID = os.OrderStatusID
WHERE os.Status = 'BACKORDER'
GROUP BY pd.ProductName

GO

