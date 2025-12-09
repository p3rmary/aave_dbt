# Aave DBT Analytics
This project decodes Aave V3 lending events from Ethereum blocks *21688329 to 22188329* using DBT and PostgreSQL. The models parse on-chain event logs into structured, queryable tables ready for analysis.
## Overview
The project transforms raw Ethereum event logs from the Aave lending protocol into clean, decoded data tables. Each event type (Borrow, Supply, Repay, Withdraw, LiquidationCall) is parsed and enriched with token metadata for easy querying and analysis.
## What the Project Does
Loads raw Ethereum logs from Aave
Extracts and decodes key events from the Aave lending pool:
- Borrow - User borrows assets
- Supply - User supplies/deposits assets
- Repay - User repays borrowed assets
- Withdraw - User withdraws supplied assets
- LiquidationCall - Liquidation of undercollateralized positions

Decodes event data into human-readable values:

- Token amounts (converted from wei using token decimals)
- Interest rates
- Borrow rates
- Referral codes

Joins each event with token metadata:
- Token symbol
- Token decimals
- Contract addresses

Prerequisites
Before you begin, ensure you have:

dbt Core installed (version 1.0.0 or higher)
 
  ```
pip install dbt-postgres
```

PostgreSQL database (version 12 or higher)
Raw Aave event logs loaded into your PostgreSQL database
Python 3.10 or higher

## Project Structure

Project Structure
- aave_dbt/

  - dbt_project.yml
  - models/
    - stg_borrow.sql
    - stg_supply.sql
    - stg_repay.sql
    - stg_withdraw.sql
    - stg_liquidation.sql
  - macros/
    - decode_borrow_event.sql
    - decode_supply_event.sql
    - decode_repay_event.sql
    - decode_withdraw_event.sql
    - decode_liquidation_event.sql
    - event_name.sql
  - seeds/
    - timestamp.csv
    - aave_assets_metadata.csv
    - aave_logs28.csv
- README.md

Setup Instructions

1. Clone the Repository
```
git clone https://github.com/p3rmary/aave_dbt.git
cd aave_dbt
```
2. Configure Database Connection
Create a profiles.yml file in your ~/.dbt/ directory (or in the project root):

```
aave_dbt:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: your_username
      password: your_password
      port: 5432
      dbname: your_database
      schema: aave_analytics
      threads: 4
```
3. Load Seed Data
Load the token metadata and timestamp mappings:

```
dbt seed
```
4. Run the Models
Execute all transformation models:

```
dbt run
```
To run a specific model:
```
dbt run --select stg_borrow
```


## Data Sources

This project expects raw Ethereum event logs to be available in your PostgreSQL database. The logs should contain:

- Block number
- Transaction hash
- Log index
- Event topics
- Event data (hex encoded)
- Contract address
