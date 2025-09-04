# Data Catalog for Gold Layer

## Overview
The **Gold Layer** represents the curated, business-ready data model designed for **analytics and reporting**.  
It is structured into **dimension tables** (descriptive context) and **fact tables** (quantitative measures) to enable efficient BI, dashboards, and advanced analytics.  

---

### 1. **gold.dim_customers**
- **Purpose:** Holds customer-related information enriched with demographic and geographic details, used for customer analysis and segmentation.  
- **Columns:**

| Column Name     | Data Type     | Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key    | INT           | Surrogate key uniquely identifying each customer record.                                      |
| customer_id     | INT           | Business identifier assigned to each customer in source systems.                              |
| customer_number | NVARCHAR(50)  | Alphanumeric reference code for tracking customers across business processes.                 |
| first_name      | NVARCHAR(50)  | Customer’s first name.                                                                        |
| last_name       | NVARCHAR(50)  | Customer’s last (family) name.                                                                |
| country         | NVARCHAR(50)  | Country of residence of the customer (e.g., 'Australia').                                     |
| marital_status  | NVARCHAR(50)  | Marital status (e.g., 'Married', 'Single').                                                   |
| gender          | NVARCHAR(50)  | Gender of the customer (e.g., 'Male', 'Female', 'n/a').                                       |
| birthdate       | DATE          | Date of birth in `YYYY-MM-DD` format (e.g., 1971-10-06).                                      |
| create_date     | DATE          | Date when the customer record was created in the system.                                      |

---

### 2. **gold.dim_products**
- **Purpose:** Contains detailed product information and attributes, used for product classification, inventory tracking, and sales analysis.  
- **Columns:**

| Column Name          | Data Type     | Description                                                                                   |
|----------------------|---------------|-----------------------------------------------------------------------------------------------|
| product_key          | INT           | Surrogate key uniquely identifying each product record.                                        |
| product_id           | INT           | Business identifier assigned to the product in source systems.                                |
| product_number       | NVARCHAR(50)  | Alphanumeric code representing the product, often used for categorization or inventory.       |
| product_name         | NVARCHAR(50)  | Descriptive product name including details such as type, color, or size.                      |
| category_id          | NVARCHAR(50)  | Identifier linking the product to its high-level category.                                    |
| category             | NVARCHAR(50)  | Broad classification of the product (e.g., Bikes, Components).                               |
| subcategory          | NVARCHAR(50)  | Detailed classification of the product within the category (e.g., Helmets, Jerseys).          |
| maintenance_required | NVARCHAR(50)  | Indicates if the product requires maintenance (e.g., 'Yes', 'No').                           |
| cost                 | INT           | Base cost of the product in monetary units.                                                   |
| product_line         | NVARCHAR(50)  | The product line or series the product belongs to (e.g., Road, Mountain).                     |
| start_date           | DATE          | The date when the product became available for sale.                                          |

---

### 3. **gold.fact_sales**
- **Purpose:** Stores transactional sales data, providing a central fact table for sales analytics and performance measurement.  
- **Columns:**

| Column Name     | Data Type     | Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Unique alphanumeric identifier for each sales order (e.g., 'SO54496').                        |
| product_key     | INT           | Surrogate key linking the sales record to the product dimension table.                        |
| customer_key    | INT           | Surrogate key linking the sales record to the customer dimension table.                       |
| order_date      | DATE          | The date when the order was placed.                                                           |
| shipping_date   | DATE          | The date when the order was shipped to the customer.                                          |
| due_date        | DATE          | The due date for order payment.                                                               |
| sales_amount    | INT           | Total monetary value of the sale for the line item (e.g., 25).                                |
| quantity        | INT           | Number of product units ordered for the line item (e.g., 1).                                  |
| price           | INT           | Price per unit of the product for the line item, in whole currency units.                     |
