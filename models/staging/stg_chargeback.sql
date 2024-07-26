WITH raw_chargeback AS (
    SELECT * FROM {{source('globepay', 'chargeback')}}
)
SELECT 
    external_ref,
    status,
    source AS payment_platform,
    chargeback AS ocurred_chargeback
FROM raw_chargeback