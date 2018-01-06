USE DigitalXJackySql
GO

EXEC sys.sp_cdc_enable_db
GO

EXEC sys.sp_cdc_enable_table
	@source_schema = N'src',
	@source_name   = N'ProductList',
	@role_name     = NULL,
	@supports_net_changes = 1
GO
