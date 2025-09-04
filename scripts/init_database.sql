/*
===============================================================================
DDL Script: Create Database and Schemas
===============================================================================
Purpose:
    - Creates a new database named 'DataWarehouse'.
    - Drops the database first if it already exists (fresh setup).
    - Defines three schemas within the database: 'bronze', 'silver', and 'gold'.

Details:
    - 'bronze' schema: Raw ingested data from source systems.
    - 'silver' schema: Cleaned, standardized, and conformed data.
    - 'gold' schema: Business-ready star schema (facts and dimensions).

WARNING:
    ⚠ Running this script will DROP the existing 'DataWarehouse' database.
    - All objects and data in the database will be permanently deleted.
    - Ensure you have taken proper backups before executing.

Usage:
    Run this script as the first step when setting up the Data Warehouse environment.
===============================================================================
*/
USE master;
GO
IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;

GO
  
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
