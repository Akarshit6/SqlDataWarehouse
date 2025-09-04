/*
===============================================================================
Quality Checks - Gold Layer
===============================================================================
Script Purpose:
    This script validates the integrity, consistency, and accuracy of the 
    Gold Layer. The checks ensure:
        - Uniqueness of surrogate keys in dimension tables.
        - Referential integrity between fact and dimension tables.
        - Correctness of relationships in the data model for analytics.

Usage:
    - Run these checks after building or refreshing the Gold Layer.
    - Investigate and resolve any discrepancies returned by the queries.
===============================================================================
*/

-- ====================================================================
-- Quality Check: gold.dim_customers
-- ====================================================================
-- Check 1: Uniqueness of Customer Key
-- Expectation: Query should return 0 rows
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.product_key'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_sales'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL
