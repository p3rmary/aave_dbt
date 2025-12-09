{% macro decode_repay_event(alias) %}

    lower('0x' || substring({{ alias }}.topic_1, 27, 40)) as reserve_asset,
    lower('0x' || substring({{ alias }}.topic_2, 27, 40)) as user,
    lower('0x' || substring({{ alias }}.topic_3, 27, 40)) as repayer,

    {{ hex_to_int('substring(' ~ alias ~ '.data, 3, 64)', 128) }} as amount,
    ({{ hex_to_int('substring(' ~ alias ~ '.data, 127, 2)', 32) }} = 1) as use_a_tokens

{% endmacro %}
