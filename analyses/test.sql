{# {{ codegen.generate_source(schema_name = target.schema, database_name=target.database, generate_columns=True, include_data_types=False) }}  #}

{# {{codegen.generate_model_yaml(['stg_transactions', 'stg_token_transfers'])}} #}
{# Select 
{{ dbt_utils.star(from=ref('stg_transactions_enriched'), except=["input"], quote_identifiers = False, prefix = 'STG_' )}}
from {{ ref('stg_transactions_enriched') }} #}

{# {{ audit_helper.compare_relations
) }} #}