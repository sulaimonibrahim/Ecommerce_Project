with orders_by_state as (
    select
        c.customer_state,
        count(o.order_id) as order_count
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_customers') }} c
        on o.customer_id = c.customer_id
    group by 1
)

select
    customer_state,
    order_count
from orders_by_state
order by order_count desc
