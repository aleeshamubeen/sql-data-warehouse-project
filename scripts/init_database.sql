/* 
--------------------------------------------------------
Create Database and Schemas
------------------------------------------------------
Script purpose:
This script creates a new database names 'DataWarehouse' after checking if it already exists.
if the database exists, it is dropped and recreared. additionally, the script sets up three schemas 
within the database: 'bronze', 'silver', and 'gold'




USE master;
GO 

--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawareouse')
BEGIN
 ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
 DROP DATABASE Datawarehouse;
END;
GO
 
--Create the 'Datawarehouse' database
CREATE DATABASE Datawarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA Gold
GO
