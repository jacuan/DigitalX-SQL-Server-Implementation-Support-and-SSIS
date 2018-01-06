USE [msdb]
GO

/****** Object:  Job [DigitalXJackySql - Full Database Backup]    Script Date: 21/03/2016 14:13:17 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 21/03/2016 14:13:17 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DigitalXJackySql - Full Database Backup', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Perform a Full Database Backup', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-R7QH4IV\jacky', 
		@notify_email_operator_name=N'Jacky', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [1]    Script Date: 21/03/2016 14:13:18 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP DATABASE [DigitalXJackySql] TO  DISK = N''G:\AMES\SQL\SqlServer\FinalProject\DatabaseBackups\DigitalXBackups.bak'' WITH NOFORMAT, NOINIT,  NAME = N''DigitalXJackySql-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N''DigitalXJackySql'' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N''DigitalXJackySql'' )
if @backupSetId is null begin raiserror(N''Verify failed. Backup information for database ''''DigitalXJackySql'''' not found.'', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N''G:\AMES\SQL\SqlServer\FinalProject\DatabaseBackups\DigitalXBackups.bak'' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
', 
		@database_name=N'DigitalXJackySql', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Full Database Backup Schedule', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=2, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20160315, 
		@active_end_date=99991231, 
		@active_start_time=30000, 
		@active_end_time=235959, 
		@schedule_uid=N'afb5ff6a-ccc6-4c99-944d-67e89788d848'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO





USE [msdb]
GO

/****** Object:  Job [DigitalXJackySql - Differential Backup]    Script Date: 21/03/2016 14:13:29 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 21/03/2016 14:13:29 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DigitalXJackySql - Differential Backup', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Perform a Differential Backup', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-R7QH4IV\jacky', 
		@notify_email_operator_name=N'Jacky', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [1]    Script Date: 21/03/2016 14:13:29 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP DATABASE [DigitalXJackySql] TO  DISK = N''G:\AMES\SQL\SqlServer\FinalProject\DatabaseBackups\DigitalXBackups.bak'' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N''DigitalXJackySql-Differential Database Backup'', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N''DigitalXJackySql'' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N''DigitalXJackySql'' )
if @backupSetId is null begin raiserror(N''Verify failed. Backup information for database ''''DigitalXJackySql'''' not found.'', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N''G:\AMES\SQL\SqlServer\FinalProject\DatabaseBackups\DigitalXBackups.bak'' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
', 
		@database_name=N'DigitalXJackySql', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Differential Backup Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20160315, 
		@active_end_date=99991231, 
		@active_start_time=180000, 
		@active_end_time=235959, 
		@schedule_uid=N'9e58bece-4fdf-4532-af70-ba5c876de577'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO




USE [msdb]
GO

/****** Object:  Job [DigitalXJackySql - Transaction Log Backup]    Script Date: 21/03/2016 14:13:42 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 21/03/2016 14:13:42 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DigitalXJackySql - Transaction Log Backup', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Perform a Transaction Log Backup', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-R7QH4IV\jacky', 
		@notify_email_operator_name=N'Jacky', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [1]    Script Date: 21/03/2016 14:13:42 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP LOG [DigitalXJackySql] TO  DISK = N''G:\AMES\SQL\SqlServer\FinalProject\DatabaseBackups\DigitalXBackups.bak'' WITH NOFORMAT, NOINIT,  NAME = N''DigitalXJackySql-Transaction Log Database Backup'', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N''DigitalXJackySql'' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N''DigitalXJackySql'' )
if @backupSetId is null begin raiserror(N''Verify failed. Backup information for database ''''DigitalXJackySql'''' not found.'', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N''G:\AMES\SQL\SqlServer\FinalProject\DatabaseBackups\DigitalXBackups.bak'' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
', 
		@database_name=N'DigitalXJackySql', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Transaction Log Backup Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20160315, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'a7605939-f330-482c-8b38-6024c5403452'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO

