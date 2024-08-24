with sales as (
    select
        o.order_id,
        p.product_category_name,
        count(o.order_id) as order_count
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_products') }} p
        on o.product_id = p.product_id
    group by 1, 2
)
select
    product_category_name,
    sum(order_count) as total_sales
from sales
group by 1