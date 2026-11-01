/*
==========================================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=========================================================================================================
Script Purpose:
  This stored Procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following functions;
  -Truncates the bronze tables before loading data.
  -Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
   None.
This stored procedure does not accept any parameters or return any values.

Usage Example:
EXEC bronze.load_bronze;
=========================================================================================================
*/
--------------------------LOADING TABLES -----------------------------
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
	    SET @batch_start_time = GETDATE();
		--------------------------01 -----------------------------
		PRINT '===================================================='
		PRINT 'Loading Bronze Layer'
		PRINT '===================================================='

		PRINT '===================================================='
		PRINT 'Loading CRM Tables'
		PRINT '===================================================='
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\amubeen\Documents\sql\cust_info.csv'
		WITH (
		   FIRSTROW=2,
		   FIELDTERMINATOR= ',', 
		   TABLOCK
		   );
		   SET @end_time = GETDATE();
		   PRINT '>> Load Duration: '+ CAST(DATEIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		---SELECT COUNT (*) FROM bronze.crm_cust_info;


		--------------------------02 -----------------------------
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table:bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\amubeen\Documents\sql\prd_info.csv'
		WITH (
		   FIRSTROW=2,
		   FIELDTERMINATOR= ',', 
		   TABLOCK
		   );
        SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		--SELECT COUNT (*) FROM bronze.crm_prd_info

		--------------------------03 -----------------------------
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table:bronze.crm_sls_info'
		TRUNCATE TABLE bronze.crm_sls_info ;

		BULK INSERT bronze.crm_sls_info
		FROM 'C:\Users\amubeen\Documents\sql\sales_details.csv'
		WITH (
		   FIRSTROW=2,
		   FIELDTERMINATOR= ',', 
		   TABLOCK
		   );

		SELECT COUNT (*) FROM bronze.crm_sls_info

		--------------------------04 -----------------------------
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table:bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2 ;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\amubeen\Documents\sql\PX_CAT_G1V2.csv'
		WITH (
		   FIRSTROW=2,
		   FIELDTERMINATOR= ',', 
		   TABLOCK
		   );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

		--SELECT COUNT (*) FROM bronze.erp_px_cat_g1v2;

		--------------------------05 -----------------------------
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table:bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12 ;

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\amubeen\Documents\sql\CUST_AZ12.csv'
		WITH (
		   FIRSTROW=2,
		   FIELDTERMINATOR= ',', 
		   TABLOCK
		   );
        SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

		---SELECT COUNT (*) FROM bronze.erp_cust_az12

		--------------------------06 -----------------------------
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table:bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101 ;

		BULK INSERT  bronze.erp_loc_a101
		FROM 'C:\Users\amubeen\Documents\sql\LOC_A101.csv'
		WITH (
		   FIRSTROW=2,
		   FIELDTERMINATOR= ',', 
		   TABLOCK
		   );
        SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';

		---SELECT COUNT (*) FROM bronze.erp_loc_a101
		SET @batch_end_time = GETDATE();
		PRINT '================================'
		PRINT 'Loading Bronze Layer is Completes';
		PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR)+ 'seconds';
		PRINT '================================'
	END TRY 
	BEGIN CATCH
	   PRINT '============================================'
	   PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
	   PRINT 'Error Message' + ERROR_MESSAGE();
	   PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
	   PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR) ;
	   PRINT '============================================'
	END CATCH
END
