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
    where {{ event_name('r.topic_0') }} = 'Borrow'
),

t as (
    select *
    from {{ ref('aave_assets_metadata') }}
),

decoded as (
    select
        ts.block_time_utc,
        f.block_number::bigint as block_number,
        f.tx_hash::text as tx_hash,
        f.log_index::bigint as log_index,

        {{ event_name('f.topic_0') }} as event_name,
        {{ decode_borrow_event('f') }},

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
    d.reserve_asset,
    d.on_behalf_of,
    d.user,
    d.amount / power(10, meta.decimals) as amount,
    d.interest_rate_mode,
    d.borrow_rate,
    meta.symbol,
    d.ingested_at
from decoded d
join {{ ref('aave_assets_metadata') }} meta
      on meta.token = d.reserve_asset
order by block_number, log_index
