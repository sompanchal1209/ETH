Select 
sum(value) as total_value
from {{ ref('stg_transactions_enriched') }}
having total_value < 0