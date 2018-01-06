Declare @reference_id bigint
EXEC [SSISDB].[catalog].[create_environment_reference] @environment_name=N'Production', @reference_id=@reference_id OUTPUT, @project_name=N'DigitalXProductListUpdates', @folder_name=N'DigitalXProductIncrementalUpdates', @reference_type=R
Select @reference_id

GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'DatabaseName', @object_name=N'DigitalXProductListUpdates', @folder_name=N'DigitalXProductIncrementalUpdates', @project_name=N'DigitalXProductListUpdates', @value_type=R, @parameter_value=N'DBName'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'FlatFileLocationSupplier1', @object_name=N'DigitalXProductListUpdates', @folder_name=N'DigitalXProductIncrementalUpdates', @project_name=N'DigitalXProductListUpdates', @value_type=R, @parameter_value=N'Supplier1Path'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'FlatFileLocationSupplier2', @object_name=N'DigitalXProductListUpdates', @folder_name=N'DigitalXProductIncrementalUpdates', @project_name=N'DigitalXProductListUpdates', @value_type=R, @parameter_value=N'Supplier2Path'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'FlatFileLocationSupplier3', @object_name=N'DigitalXProductListUpdates', @folder_name=N'DigitalXProductIncrementalUpdates', @project_name=N'DigitalXProductListUpdates', @value_type=R, @parameter_value=N'Supplier3Path'
GO
EXEC [SSISDB].[catalog].[set_object_parameter_value] @object_type=20, @parameter_name=N'ServerName', @object_name=N'DigitalXProductListUpdates', @folder_name=N'DigitalXProductIncrementalUpdates', @project_name=N'DigitalXProductListUpdates', @value_type=R, @parameter_value=N'ServerName'
GO

GO





GO

EXEC [SSISDB].[catalog].[set_environment_variable_property] @variable_name=N'DBNam', @environment_name=N'Production', @folder_name=N'DigitalXProductIncrementalUpdates', @property_name=N'Name', @property_value=N'DBName'

EXEC [SSISDB].[catalog].[set_environment_variable_property] @variable_name=N'ServerNam', @environment_name=N'Production', @folder_name=N'DigitalXProductIncrementalUpdates', @property_name=N'Name', @property_value=N'ServerName'

EXEC [SSISDB].[catalog].[set_environment_variable_property] @variable_name=N'Supplier1Pat', @environment_name=N'Production', @folder_name=N'DigitalXProductIncrementalUpdates', @property_name=N'Name', @property_value=N'Supplier1Path'

EXEC [SSISDB].[catalog].[set_environment_variable_property] @variable_name=N'Supplier2Pat', @environment_name=N'Production', @folder_name=N'DigitalXProductIncrementalUpdates', @property_name=N'Name', @property_value=N'Supplier2Path'

EXEC [SSISDB].[catalog].[set_environment_variable_property] @variable_name=N'Supplier3Pat', @environment_name=N'Production', @folder_name=N'DigitalXProductIncrementalUpdates', @property_name=N'Name', @property_value=N'Supplier3Path'


GO


