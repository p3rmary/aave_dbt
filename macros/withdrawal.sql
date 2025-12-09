{% macro decode_withdraw_event(alias) %}

    lower('0x' || substring({{ alias }}.topic_1, 27, 40)) as reserve_asset,
    lower('0x' || substring({{ alias }}.topic_2, 27, 40)) as user,
    lower('0x' || substring({{ alias }}.topic_3, 27, 40)) as to_address,

    {{ hex_to_int('substring(' ~ alias ~ '.data, 3, 64)', 128) }} as amount

{% endmacro %}