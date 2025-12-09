{% macro decode_borrow_event(alias) %}

    lower('0x' || substring({{ alias }}.topic_1, 27, 40)) as reserve_asset,
    lower('0x' || substring({{ alias }}.topic_2, 27, 40)) as on_behalf_of,
    lower('0x' || substring({{ alias }}.data, 27, 40)) as user,

    {{ hex_to_int('substring(' ~ alias ~ '.data, 67, 64)', 128) }} as amount,
    {{ hex_to_int('substring(' ~ alias ~ '.data, 131, 64)', 32) }} as interest_rate_mode,
    {{ hex_to_int('substring(' ~ alias ~ '.data, 195, 64)', 128) }} as borrow_rate,

    {{ hex_to_int('substring(' ~ alias ~ '.topic_3, 59, 6)', 24) }} as referral_code

{% endmacro %}