SELECT external_ref FROM {{ ref('transactions')}}
WHERE NOT(transaction_accepted) AND ocurred_chargeback