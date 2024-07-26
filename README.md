# Assignment

## Part 1  
### 1. Preliminary data exploration

### 2. Summary of the model architecture

**Overview**

The data model architecture is designed to efficiently process and transform raw data into an analytics-ready format using dbt. The underlying database platform is Snowflake.

**Architecture Components**

The architecture consists of three main layers:
- Raw Data Layer
- Staging Layer
- Core Layer 

**Raw Data Layer**

Source Tables
- GLOBEPAY.RAW.ACCEPTANCE
- GLOBEPAY.RAW.CHARGEBACK

These tables contain the raw data ingested from Globepay API. No transformations are applied at this stage, preserving the original format and structure of the incoming data.

**Staging Layer**

Staging Views
- GLOBEPAY.DEV.STG_ACCEPTANCE
- GLOBEPAY.DEV.STG_CHARGEBACK

In the staging layer, the first set of transformations is applied to clean and prepare the data for further processing. Key transformations include:

- Renaming Columns: New, more descriptive column names are assigned to improve readability.
- Standardization: Data values are standardized. For example, fields expected to hold boolean values are converted to a boolean format.
- New Calculations: A new column currency_rate is introduced to provide better insight into currency conversions and facilitate downstream calculations.

**Core Layer**

Final Model
- GLOBEPAY.DEV.TRANSACTIONS

At this stage, data from the two staging views (stg_accepetance and stg_chargeback) are combined into a single table suitable for analytics. Additional transformations include:

- Data Integration: Combining relevant fields from the acceptance and chargeback datasets to create a comprehensive view.
- New Calculations: Introducing a usd_amount column, which standardizes transaction amounts to USD, enabling consistent metrics and comparisons across different currencies.



### 3. Lineage graphs

![alt text](image-1.png)

### 4. Tips around macros, data validation, and documentation




### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
