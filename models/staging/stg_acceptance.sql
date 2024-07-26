WITH raw_acceptance AS (
    SELECT * FROM {{source('globepay', 'acceptance')}}
)
SELECT 
    external_ref,
    status,
    source AS payment_platform,
    ref AS event_ref,
    date_time as transaction_timestamp_utc,
    CASE 
        WHEN LOWER(state) = 'accepted' THEN true
        WHEN LOWER(state) = 'declined' THEN false
        ELSE NULL  -- Handle unexpected values if necessary
    END AS transaction_accepted,
    cvv_provided,
    amount,
    country AS card_country_code,
    currency AS currency_code,
    rates::OBJECT[currency]::NUMBER(38,16) AS currency_rate
FROM raw_acceptance