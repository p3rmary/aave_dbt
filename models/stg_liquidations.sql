{{ config(materialized = 'table') }}

with raw as (
    select *
    from {{ ref('aave_logs28') }}
),

ts as (
    select *
    from {{ ref('timestamp') }}
),

filtered as (
    select *
    from raw r
    where {{ event_name('r.topic_0') }} = 'LiquidationCall'
),

decoded as (
    select
        ts.block_time_utc,
        f.block_number::bigint as block_number,
        f.tx_hash::text as tx_hash,
        f.log_index::bigint as log_index,
        {{ event_name('f.topic_0') }} as event_name,
        {{ decode_liquidation_event('f') }},
        now() as ingested_at
    from filtered f
    join ts on ts.block_number = f.block_number
)

select 
d.block_time_utc,
d.block_number,
d.tx_hash,
d.log_index,
d.event_name,
d.collateral_asset,
d.debt_asset,
d.debt_repaid/power(10, p.decimals) as debt_repaid,
d.liquidated_collateral_amount/ power(10, m.decimals) as liquidated_collateral_amount,
d.liquidator,
d.receive_a_token,
m.symbol as collateral_symbol,
p.symbol as debt_symbol,
d.ingested_at
from decoded d 
join {{ref('aave_assets_metadata')}} m 
on m.token= d.collateral_asset
 join {{ref('aave_assets_metadata')}} p on p.token = d.debt_asset
order by block_number, log_index