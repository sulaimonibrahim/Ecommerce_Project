select
    avg_delivery_days as avg_delivery_time_days
from {{ ref('int_avg_delivery_time') }}