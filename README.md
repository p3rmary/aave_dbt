# Aave DBT Analytics

This project decodes Aave lending events  from Blocks 21688329 to 21708329 using DBT. The models parse on-chain event logs into structured, queryable tables ready for analysis

## What the project does:
 Loads raw Ethereum logs from Aave.
  
- Extracts key events from the Aave lending pool:
  - Borrow
  - Supply
  - Repay
  - Withdraw
  - LiquidationCall
    
- Decodes event data into real numbers:
  -Token amounts
  - Interest rates
  - Borrow rate
  - Referral codes

- Joins each event with token metadata:
  - Symbol
  - Decimals
     
## Project Structure
aave_dbt/

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
  -  decode_liquidation_event.sql
  -  event_name.sql
- seeds/
  - timestamp.csv       
  - aave_assets_metadata.csv  
- README.md
        

