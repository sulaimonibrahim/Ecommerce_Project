with order_items as (
    select
        order_id,
        product_id
    from {{ source('ecomm', 'order_item') }}
),

orders_with_items as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_approved_at,
        o.order_delivered_carrier_date,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,
        oi.product_id
    from {{ source('ecomm', 'orders') }} o
    left join order_items oi
        on o.order_id = oi.order_id
)

select *
from orders_with_items
