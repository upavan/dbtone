select 
tx.HASH_KEY,
tx.block_number,
tx.BLOCK_TIMESTAMP,
tx.IS_COINBASE,
f.value:address::string as output_address,
f.value:value::float as output_value

from {{ ref("stg_btc") }} tx,

lateral flatten(input => OUTPUTS) f