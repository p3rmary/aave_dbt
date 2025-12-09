
{% macro decode_liquidation_event(alias) %}

    lower('0x' || substring({{ alias }}.topic_1, 27, 40)) as collateral_asset,
    lower('0x' || substring({{ alias }}.topic_2, 27, 40)) as debt_asset,
    lower('0x' || substring({{ alias }}.topic_3, 27, 40)) as user,

    {{ hex_to_int('substring(' ~ alias ~ '.data, 3, 64)', 128) }} as debt_repaid,
    {{ hex_to_int('substring(' ~ alias ~ '.data, 67, 64)', 128) }} as liquidated_collateral_amount,

    lower('0x' || substring({{ alias }}.data, 155, 40)) as liquidator,
    ({{ hex_to_int('substring(' ~ alias ~ '.data, 255, 2)', 32) }} = 1) as receive_a_token

{% endmacro %}