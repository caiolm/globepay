
SELECT 
    a.external_ref, 
    transaction_timestamp_utc,
    transaction_accepted, 
    ROUND(amount/currency_rate,2) AS usd_amount,
    amount AS original_currency_amount,
    card_country_code,
    currency_code,
    currency_rate,
    ocurred_chargeback,
    cvv_provided,
    a.status,
    a.payment_platform,
    event_ref
FROM {{ref('stg_acceptance')}} a
INNER JOIN {{ref('stg_chargeback')}} c on a.external_ref = c.external_ref