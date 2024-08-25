with delivery_times as (
    select
        order_id,
        timestamp_diff(
            order_delivered_customer_date,
            order_purchase_timestamp,
            day
        ) as delivery_days
    from {{ ref('stg_orders') }}
    where order_delivered_customer_date is not null
)

select
    avg(delivery_days) as avg_delivery_days
from delivery_times
