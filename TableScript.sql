USE [DigitalXJackySql]
GO

/****** Object:  Table [Address].[AddressDetails]    Script Date: 24/03/2016 00:19:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Address].[AddressDetails](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressType] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[Suburb] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_AddressDetails] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGAddress1]
) ON [FGAddress1]

GO





USE [DigitalXJackySql]
GO

/****** Object:  Table [Address].[CustomerAddress]    Script Date: 24/03/2016 00:19:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Address].[CustomerAddress](
	[CustomerID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGAddress1]
) ON [FGAddress1]

GO

ALTER TABLE [Address].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_AddressDetails] FOREIGN KEY([AddressID])
REFERENCES [Address].[AddressDetails] ([AddressID])
GO

ALTER TABLE [Address].[CustomerAddress] CHECK CONSTRAINT [FK_CustomerAddress_AddressDetails]
GO

ALTER TABLE [Address].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_CustomerDetails] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[CustomerDetails] ([CustomerID])
GO

ALTER TABLE [Address].[CustomerAddress] CHECK CONSTRAINT [FK_CustomerAddress_CustomerDetails]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Address].[OrderAddress]    Script Date: 24/03/2016 00:19:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Address].[OrderAddress](
	[OrderID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_OrderAddress] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGAddress1]
) ON [FGAddress1]

GO

ALTER TABLE [Address].[OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_OrderAddress_AddressDetails] FOREIGN KEY([AddressID])
REFERENCES [Address].[AddressDetails] ([AddressID])
GO

ALTER TABLE [Address].[OrderAddress] CHECK CONSTRAINT [FK_OrderAddress_AddressDetails]
GO

ALTER TABLE [Address].[OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_OrderAddress_OrderHeader] FOREIGN KEY([OrderID])
REFERENCES [Order].[OrderHeader] ([OrderID])
GO

ALTER TABLE [Address].[OrderAddress] CHECK CONSTRAINT [FK_OrderAddress_OrderHeader]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Category].[MainCategory]    Script Date: 24/03/2016 00:19:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Category].[MainCategory](
	[MainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MainCategory] PRIMARY KEY CLUSTERED 
(
	[MainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGCommodity1]
) ON [FGCommodity1]

GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Category].[SubCategory]    Script Date: 24/03/2016 00:20:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Category].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryID] [int] NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGCommodity1]
) ON [FGCommodity1]

GO

ALTER TABLE [Category].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_MainCategory] FOREIGN KEY([MainCategoryID])
REFERENCES [Category].[MainCategory] ([MainCategoryID])
GO

ALTER TABLE [Category].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_MainCategory]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Customer].[CreditCard]    Script Date: 24/03/2016 00:20:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Customer].[CreditCard](
	[CreditCardID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[NameOnCard] [nvarchar](100) NOT NULL,
	[CardNumber] [nvarchar](max) NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[CVV] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGCustomer1]
) ON [FGCustomer1] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [Customer].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_CustomerDetails] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[CustomerDetails] ([CustomerID])
GO

ALTER TABLE [Customer].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_CustomerDetails]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Customer].[CustomerDetails]    Script Date: 24/03/2016 00:20:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Customer].[CustomerDetails](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Telephone] [nvarchar](40) NULL,
	[Mobile] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_CustomerDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGCustomer1],
 CONSTRAINT [IX_CustomerDetails] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGCustomer1]
) ON [FGCustomer1] TEXTIMAGE_ON [PRIMARY]

GO





USE [DigitalXJackySql]
GO

/****** Object:  Table [Order].[GSTType]    Script Date: 24/03/2016 00:20:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Order].[GSTType](
	[GSTTypeID] [int] IDENTITY(1,1) NOT NULL,
	[GSTType] [nvarchar](50) NOT NULL,
	[GSTAmount] [money] NOT NULL,
 CONSTRAINT [PK_GSTType] PRIMARY KEY CLUSTERED 
(
	[GSTTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGOrder1]
) ON [FGOrder1]

GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Order].[OrderDetail]    Script Date: 24/03/2016 00:20:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Order].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGOrder1]
) ON [FGOrder1]

GO

ALTER TABLE [Order].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderHeader] FOREIGN KEY([OrderID])
REFERENCES [Order].[OrderHeader] ([OrderID])
GO

ALTER TABLE [Order].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderHeader]
GO

ALTER TABLE [Order].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductDetails] FOREIGN KEY([ProductID])
REFERENCES [Product].[ProductDetails] ([ProductID])
GO

ALTER TABLE [Order].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductDetails]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Order].[OrderHeader]    Script Date: 24/03/2016 00:20:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Order].[OrderHeader](
	[OrderID] [int] IDENTITY(1000,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CreditCardID] [int] NOT NULL,
	[GSTTypeID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[InvoiceNumber] [int] NULL,
	[InvoicedDate] [datetime] NULL,
	[IsInvoiced] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrderHeader] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGOrder1],
 CONSTRAINT [IX_OrderHeader] UNIQUE NONCLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [FGOrder1]

GO

ALTER TABLE [Order].[OrderHeader] ADD  CONSTRAINT [DF_OrderHeader_InvoiceNumber]  DEFAULT (abs(CONVERT([int],CONVERT([varbinary],newid())))) FOR [InvoiceNumber]
GO

ALTER TABLE [Order].[OrderHeader] ADD  CONSTRAINT [DF_OrderHeader_IsInvoiced]  DEFAULT ((0)) FOR [IsInvoiced]
GO

ALTER TABLE [Order].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_CreditCard] FOREIGN KEY([CreditCardID])
REFERENCES [Customer].[CreditCard] ([CreditCardID])
GO

ALTER TABLE [Order].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_CreditCard]
GO

ALTER TABLE [Order].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_CustomerDetails] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[CustomerDetails] ([CustomerID])
GO

ALTER TABLE [Order].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_CustomerDetails]
GO

ALTER TABLE [Order].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_GSTType] FOREIGN KEY([GSTTypeID])
REFERENCES [Order].[GSTType] ([GSTTypeID])
GO

ALTER TABLE [Order].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_GSTType]
GO

ALTER TABLE [Order].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [Order].[OrderStatus] ([OrderStatusID])
GO

ALTER TABLE [Order].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_OrderStatus]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Order].[OrderStatus]    Script Date: 24/03/2016 00:20:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Order].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGOrder1]
) ON [FGOrder1]

GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [Product].[ProductDetails]    Script Date: 24/03/2016 00:20:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [Product].[ProductDetails](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Cost] [money] NOT NULL,
	[RRP]  AS ([Cost]*(1.2)) PERSISTED,
	[UnitsInStock] [int] NULL,
	[IsDeleted] [tinyint] NOT NULL CONSTRAINT [DF_ProductDetails_IsAvailable]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FGCommodity1]
) ON [FGCommodity1] TEXTIMAGE_ON [FGCommodity1]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [Product].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [Category].[SubCategory] ([SubCategoryID])
GO

ALTER TABLE [Product].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_SubCategory]
GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [src].[ProductList]    Script Date: 24/03/2016 00:20:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [src].[ProductList](
	[ProductListId] [int] IDENTITY(1,1) NOT NULL,
	[MainCategory] [nvarchar](50) NULL,
	[SubCategory] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_ProductList] PRIMARY KEY CLUSTERED 
(
	[ProductListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO





USE [DigitalXJackySql]
GO

/****** Object:  Table [src].[TempProductList]    Script Date: 24/03/2016 00:21:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [src].[TempProductList](
	[ProductListId] [int] IDENTITY(1,1) NOT NULL,
	[MainCategory] [nvarchar](50) NULL,
	[SubCategory] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_TempProductList] PRIMARY KEY CLUSTERED 
(
	[ProductListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [stg].[ProductListDeletes]    Script Date: 24/03/2016 00:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[ProductListDeletes](
	[ProductListId] [int] NOT NULL,
	[MainCategory] [nvarchar](50) NULL,
	[SubCategory] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Cost] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [stg].[ProductListInserts]    Script Date: 24/03/2016 00:21:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[ProductListInserts](
	[ProductListId] [int] NOT NULL,
	[MainCategory] [nvarchar](50) NULL,
	[SubCategory] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Cost] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




USE [DigitalXJackySql]
GO

/****** Object:  Table [stg].[ProductListUpdates]    Script Date: 24/03/2016 00:21:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[ProductListUpdates](
	[ProductListId] [int] NOT NULL,
	[MainCategory] [nvarchar](50) NULL,
	[SubCategory] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Cost] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO







