/*
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Cleans out deleted FFC Job entries from the DB.
::
:: When FFC deletes jobs according to the retention policy,
:: the record in the DB is kept, it just flags the
:: [DocumentDescriptionAttributes].[PlatformJob_Id] as NULL.
:: This script deletes those entries flagged as NULL.
::
:: Steps:
:: 1) A backup of the DB is made
:: 2) Gathers some data for stats reporting
:: 3) Perform the delete (can take several minutes for large DB's)
:: 4) Reports the stats
::
:: Note:
:: Configure the backup directory
::
:: @copyright     Copyright FujiXeroxAustralia Professional Services
:: @link          https://github.com/fxaps/FreeFlowCoreScripts
:: @date          2020-12-16
:: @version       1.0.2
:: @author        Andrew.Rajcany@aus.fujixerox.com
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*/

USE OapPlatformDatabase
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


--BACKUP DATABASE [OapMasterDatabase]
SET @dbName = '[OapMasterDatabase]'
SET @dbBackupName = @dbFolderName + @dbDate + '_' + @dbName + @dbNameSuffix + @dbNameExtension
BACKUP DATABASE [OapMasterDatabase]
    TO DISK = @dbBackupName
    WITH NOFORMAT, NOINIT, NAME = N'OapMasterDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--This section gets the sizes of the DB for your reference
SELECT t.NAME                                                                             AS TableName,
       s.Name                                                                             AS SchemaName,
       p.rows                                                                             AS RowCounts,
       CONVERT(NUMERIC(36, 2),
               SUM(a.total_pages) * 8.00)                                                 AS TotalSpaceKB,
       CONVERT(NUMERIC(36, 2),
               ROUND(((SUM(a.total_pages) * 8.00) / 1024), 2))                            AS TotalSpaceMB,
       CONVERT(NUMERIC(36, 2),
               ROUND(((SUM(a.total_pages) * 8.00) / 1024 / 1024), 2))                     AS TotalSpaceGB,
       CONVERT(NUMERIC(36, 2),
               SUM(a.used_pages) * 8.00)                                                  AS UsedSpaceKB,
       CONVERT(NUMERIC(36, 2),
               ROUND(((SUM(a.used_pages) * 8.00) / 1024), 2))                             AS UsedSpaceMB,
       CONVERT(NUMERIC(36, 2),
               ROUND(((SUM(a.used_pages) * 8.00) / 1024 / 1024), 2))                      AS UsedSpaceGB,
       CONVERT(NUMERIC(36, 2),
               (SUM(a.total_pages) - SUM(a.used_pages)) * 8.00)                           AS UnusedSpaceKB,
       CONVERT(NUMERIC(36, 2),
               ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8.00) / 1024, 2))        AS UnusedSpaceMB,
       CONVERT(NUMERIC(36, 2),
               ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8.00) / 1024 / 1024, 2)) AS UnusedSpaceGB
FROM sys.tables t
         INNER JOIN
     sys.indexes i ON t.OBJECT_ID = i.object_id
         INNER JOIN
     sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
         INNER JOIN
     sys.allocation_units a ON p.partition_id = a.container_id
         LEFT OUTER JOIN
     sys.schemas s ON t.schema_id = s.schema_id
WHERE t.NAME NOT LIKE 'dt%'
  AND t.is_ms_shipped = 0
  AND i.OBJECT_ID > 255
GROUP BY t.Name, s.Name, p.Rows


--This displays how many records there are pre-deletion
SELECT count([Id])
FROM [OapPlatformDatabase].[dbo].[DocumentDescriptionAttributes]
WHERE PlatformJob_Id IS NULL

--Uncomment this section to delete the records, or just select and run this portion of code
/*
DELETE FROM [OapPlatformDatabase].[dbo].[DocumentDescriptionAttributes]
WHERE PlatformJob_Id IS NULL
*/

--This displays how many records there are post-deletion
SELECT count([Id])
FROM [OapPlatformDatabase].[dbo].[DocumentDescriptionAttributes]

