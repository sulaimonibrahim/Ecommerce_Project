select
    customer_state,
    sum(order_count) as total_orders
from {{ ref('int_orders_by_state') }}
group by customer_state