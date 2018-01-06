USE DigitalXJackySql
GO


--Create a database Master Key

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'DigitalXPa$$w0rd'



--Create Asymmetric Key 

CREATE ASYMMETRIC KEY digitalXAsymKey 
    WITH ALGORITHM = RSA_2048 
    ENCRYPTION BY PASSWORD = 'AsymPa$$w0rd'; 
GO




--Use SP to insert customer information and encrypt the password:

CREATE PROCEDURE dbo.usp_EncryptByAsymKeyCustomerPassword
@email nvarchar(100),
@password nvarchar(50),
@firstName nvarchar(50),
@lastName nvarchar(50),
@dob date,
@telephone nvarchar(40),
@mobile nvarchar(40),
@addressType nvarchar(50),
@street nvarchar(100),
@suburb nvarchar(50),
@city nvarchar(50),
@country nvarchar(50),
@postalCode nvarchar(30)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @newCustomerID int, @newAddressID int;

	INSERT Customer.CustomerDetails (Email, Password, FirstName, LastName, DOB, Telephone, Mobile)
	VALUES(@email, ENCRYPTBYASYMKEY(ASYMKEY_ID('digitalXAsymKey'), @password), @firstName, @lastName, @dob, @telephone, @mobile)
	
	SET @newCustomerID = SCOPE_IDENTITY();

	INSERT Address.AddressDetails (AddressType, Street, Suburb, City, Country, PostalCode)
	VALUES(@addressType, @street, @suburb, @city, @country, @postalCode)

	SET @newAddressID = SCOPE_IDENTITY();

	INSERT Address.CustomerAddress (CustomerID, AddressID)
	VALUES(@newCustomerID, @newAddressID)

END
GO




--Use SP to retrive customer information and decrypt password:

CREATE PROCEDURE dbo.usp_DecryptByAsymKeyCustomerPassword
AS
BEGIN
	SET NOCOUNT ON;
	SELECT cd.CustomerID, cd.Email, CAST(DECRYPTBYASYMKEY(ASYMKEY_ID('digitalXAsymKey'), cd.Password, N'AsymPa$$w0rd') as nvarchar) AS 'Password', cd.FirstName, 
	cd.LastName, cd.DOB, cd.Telephone, cd.Mobile, ad.AddressType, ad.Street, ad.Suburb, ad.City, ad.Country, ad.PostalCode
	FROM Customer.CustomerDetails AS cd
	JOIN Address.CustomerAddress AS ca
	ON cd.CustomerID = ca.CustomerID
	JOIN Address.AddressDetails AS ad
	ON ca.AddressID = ad.AddressID
END
GO





--Use SP to insert credit card informaiton and encrypt card number and CVV number:

CREATE PROCEDURE dbo.usp_EncryptByAsymKeyCreditCard
@customerID int,
@nameOnCard nvarchar(100),
@cardNumber nvarchar(50),
@expiryDate date,
@cVV nvarchar(10)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT Customer.CreditCard (CustomerID, NameOnCard, CardNumber, ExpiryDate, CVV)
	VALUES(@customerID, @nameOnCard, ENCRYPTBYASYMKEY(ASYMKEY_ID('digitalXAsymKey'), @cardNumber), @expiryDate, ENCRYPTBYASYMKEY(ASYMKEY_ID('digitalXAsymKey'), @cVV))
END
GO





--Use SP to retrive the credit card information and decrypt the card number and CVV number:

CREATE PROCEDURE dbo.usp_DecryptByAsymKeyCreditCard
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CustomerID, NameOnCard, CAST(DECRYPTBYASYMKEY(ASYMKEY_ID('digitalXAsymKey'), CardNumber, N'AsymPa$$w0rd') as nvarchar) AS 'Card Number', ExpiryDate, CAST(DECRYPTBYASYMKEY(ASYMKEY_ID('digitalXAsymKey'), CVV, N'AsymPa$$w0rd') as nvarchar) AS 'CVV'
	FROM Customer.CreditCard
END
GO





