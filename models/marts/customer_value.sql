with customers as (
  select * from {{ ref('spielwiese', 'dim_customers') }}
),
revenue as (
  -- Intentionally pinned to v1 so you can practice a controlled migration to v2.
  select * from {{ ref('spielwiese_finance', 'customer_revenue', v=1) }}
)
select
  c.customer_id,
  c.customer_name,
  coalesce(r.total_revenue, 0) as total_revenue,
  coalesce(r.order_count, 0) as order_count,
  case
    when coalesce(r.total_revenue, 0) >= 100 then 'high_value'
    when coalesce(r.total_revenue, 0) >= 30 then 'mid_value'
    else 'low_value'
  end as customer_segment
from customers c
left join revenue r using (customer_id)
