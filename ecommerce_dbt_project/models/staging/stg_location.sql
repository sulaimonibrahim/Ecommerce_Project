WITH raw_location AS (
    SELECT
        zip_code_prefix AS zip_code,
        geolocation_lat AS latitude,
        geolocation_lng AS longitude,
        geolocation_city AS city,
        geolocation_state AS state
    FROM {{ source('ecomm', 'location') }}
)

SELECT
    zip_code,
    latitude,
    longitude,
    city,
    state
FROM raw_location