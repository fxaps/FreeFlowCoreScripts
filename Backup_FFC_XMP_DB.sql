SET NOCOUNT ON

DECLARE @dbFolderName as varchar(50)
DECLARE @dbName as varchar(50)
DECLARE @dbDate as varchar(50)
DECLARE @dbNameSuffix as varchar(50)
DECLARE @dbNameExension as varchar(50)
DECLARE @dbBackupName as varchar(1024)


SET @dbFolderName = N'D:\DB_Backups\'
SET @dbDate = replace(replace(replace(convert(varchar(20), GETDATE(), 120), ' ', '_'), ':', ''), '-',
                      '') --data and time stamp
SET @dbNameSuffix = ''
SET @dbNameExension = N'.bak'



--BACKUP DATABASE [uStore]
SET @dbName = '[uStore]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [uStore]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'uStore-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDB2]
SET @dbName = '[XMPDB2]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [XMPDB2]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'XMPDB2-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDBASSETS]
SET @dbName = '[XMPDBASSETS]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [XMPDBASSETS]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'XMPDBASSETS-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDBHDS]
SET @dbName = '[XMPDBHDS]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [XMPDBHDS]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'XMPDBHDS-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDBTRACKING]
SET @dbName = '[XMPDBTRACKING]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [XMPDBTRACKING]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'XMPDBTRACKING-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [OapPlatformDatabase]
SET @dbName = '[OapPlatformDatabase]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [OapPlatformDatabase]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'OapPlatformDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [OapMasterDatabase]
SET @dbName = '[OapMasterDatabase]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExension
BACKUP DATABASE [OapMasterDatabase]
TO DISK = @dbBackupName
WITH NOFORMAT, NOINIT, NAME = N'OapMasterDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10
