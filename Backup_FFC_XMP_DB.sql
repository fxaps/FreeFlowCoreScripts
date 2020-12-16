/*
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: FreeFlow Core and XMPie DB backup script
::
:: Note:
:: Configure the backup directory
::
:: @copyright     Copyright FujiXeroxAustralia Professional Services
:: @link          https://github.com/fxaps/FreeFlowCoreScripts
:: @date          2020-02-25
:: @version       1.0.1
:: @author        Andrew.Rajcany@aus.fujixerox.com
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*/

USE Master
SET NOCOUNT ON

DECLARE @dbFolderName as varchar(50)
DECLARE @dbName as varchar(50)
DECLARE @dbDate as varchar(50)
DECLARE @dbNameSuffix as varchar(50)
DECLARE @dbNameExtension as varchar(50)
DECLARE @dbBackupName as varchar(1024)

/*
Folder to save the DB backups to
-- please ensure the folder exists on the SQL server
-- please include a trailing slash e.g. 'D:\DB_Backups\' if you need to change the directory
 */
SET @dbFolderName = N'D:\DB_Backups\'


/*
Define some variables
-- modify as needed but the default should work fine
 */
SET @dbDate = replace(replace(replace(convert(varchar(20), GETDATE(), 120), ' ', '_'), ':', ''), '-', '')
SET @dbNameSuffix = ''
SET @dbNameExtension = N'.bak'


--BACKUP DATABASE [uStore]
SET @dbName = '[uStore]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [uStore]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'uStore-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDB2]
SET @dbName = '[XMPDB2]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [XMPDB2]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'XMPDB2-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDBASSETS]
SET @dbName = '[XMPDBASSETS]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [XMPDBASSETS]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'XMPDBASSETS-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDBHDS]
SET @dbName = '[XMPDBHDS]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [XMPDBHDS]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'XMPDBHDS-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [XMPDBTRACKING]
SET @dbName = '[XMPDBTRACKING]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [XMPDBTRACKING]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'XMPDBTRACKING-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [OapPlatformDatabase]
SET @dbName = '[OapPlatformDatabase]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [OapPlatformDatabase]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'OapPlatformDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--BACKUP DATABASE [OapMasterDatabase]
SET @dbName = '[OapMasterDatabase]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [OapMasterDatabase]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'OapMasterDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10
