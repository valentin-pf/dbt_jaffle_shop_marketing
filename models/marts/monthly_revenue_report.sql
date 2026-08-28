select
  revenue_month,
  net_revenue,
  order_count
from {{ ref('spielwiese_finance', 'monthly_revenue') }}
