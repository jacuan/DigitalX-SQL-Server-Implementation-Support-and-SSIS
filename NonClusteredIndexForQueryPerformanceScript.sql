USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-MainCategoryID-124933]    Script Date: 22/03/2016 13:47:00 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-MainCategoryID-124933] ON [Category].[SubCategory]
(
	[MainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO





USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-CustomerID-125334]    Script Date: 22/03/2016 13:48:52 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-CustomerID-125334] ON [Customer].[CreditCard]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-FullName-133111]    Script Date: 22/03/2016 13:49:14 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-FullName-133111] ON [Customer].[CustomerDetails]
(
	[FirstName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-OrderID-125223]    Script Date: 22/03/2016 13:49:49 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-OrderID-125223] ON [Order].[OrderDetail]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-ProductID-125302]    Script Date: 22/03/2016 13:49:55 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-ProductID-125302] ON [Order].[OrderDetail]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-CreditCardID-125500]    Script Date: 22/03/2016 13:50:21 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-CreditCardID-125500] ON [Order].[OrderHeader]
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-CustomerID-125416]    Script Date: 22/03/2016 13:50:27 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-CustomerID-125416] ON [Order].[OrderHeader]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-GSTTypeID-125518]    Script Date: 22/03/2016 13:50:33 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-GSTTypeID-125518] ON [Order].[OrderHeader]
(
	[GSTTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-OrderStatusID-125539]    Script Date: 22/03/2016 13:50:39 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-OrderStatusID-125539] ON [Order].[OrderHeader]
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-Status-131138]    Script Date: 22/03/2016 13:51:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-Status-131138] ON [Order].[OrderStatus]
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO




USE [DigitalXJackySql]
GO

/****** Object:  Index [NonClusteredIndex-SubCategoryID-125128]    Script Date: 22/03/2016 13:52:21 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-SubCategoryID-125128] ON [Product].[ProductDetails]
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

