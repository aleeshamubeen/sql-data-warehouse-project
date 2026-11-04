IF OBJECT_ID ('silver.crm_cust_info', 'U') IS NOT NULL
     DROP TABLE silver.crm_cust_info; 
GO

CREATE TABLE silver.crm_cust_info (
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR (50),
cst_lastname NVARCHAR (50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE() ); ---databse will generate this info automatically  --each record inserted in this recorded can be tracked  

GO
IF OBJECT_ID ('silver.crm_prd_info', 'U') IS NOT NULL
     DROP TABLE silver.crm_prd_info; 
GO
CREATE TABLE silver.crm_prd_info (
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost NVARCHAR(50),
prd_line NVARCHAR(50),
prd_Start NVARCHAR(50),
prd_end_dt NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(), 
);

GO

IF OBJECT_ID ('silver.crm_sls_info', 'U') IS NOT NULL
     DROP TABLE silver.crm_sls_info; 
GO
CREATE TABLE silver.crm_sls_info (
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id NVARCHAR(50),
sls_order_dt NVARCHAR(50),
sls_ship_dt NVARCHAR(50),
sls_due_dt NVARCHAR (50),
sls_quantity NVARCHAR(50),
sls_price NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(), 
);

GO
IF OBJECT_ID ('silver.erp_cust_az12', 'U') IS NOT NULL
     DROP TABLE silver.erp_cust_az12; 
GO
CREATE TABLE silver.erp_cust_az12(
cid NVARCHAR(50),
bdate NVARCHAR(50),
gen NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(), 
);
GO
IF OBJECT_ID ('silver.erp_loc_a101', 'U') IS NOT NULL
     DROP TABLE silver.erp_loc_a101; 
GO
CREATE TABLE silver.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(), 
);
GO

IF OBJECT_ID ('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
     DROP TABLE silver.erp_px_cat_g1v2 ; 
GO
CREATE TABLE silver.erp_px_cat_g1v2(
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE(),
);
GO
