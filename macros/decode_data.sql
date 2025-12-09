{% macro decode_lending_event() %}
    {% set ev = decode_event_name('topic0') %}

    {{ ev }} as event_name,

    {% if ev == 'Borrow' %}
        {{ decode_borrow_event() }}

    {% elif ev == 'Supply' %}
        {{ decode_supply_event() }}

    {% elif ev == 'Repay' %}
        {{ decode_repay_event() }}

    {% elif ev == 'Withdraw' %}
        {{ decode_withdraw_event() }}

    {% elif ev == 'LiquidationCall' %}
        {{ decode_liquidation_event() }}

    {% else %}
        null as unsupported_event_type
    {% endif %}
{% endmacro %}
