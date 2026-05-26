{{
  config(
        grants = {'select': ['TESTER']}
    )
}}
select
t.date,
s.type,
{# sum(value/1e6) as total_usd_value #}
{# {{ stablecoin_conversion('value') }} as total_usd_value #}
{{ conversion('value','s.decimals')}} as total_usd_value

from {{ ref('stg_token_transfers') }} t
left join {{ ref('stablecoins') }} s
on t.token_address = s.contract_address

where s.contract_address is not null
{# lower(token_address) in ('0xdac17f958d2ee523a2206206994597c13d831ec7', '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48') #}
{# or lower(token_address) in {{ random_macro() }} #}

group by 
t.date,
s.type