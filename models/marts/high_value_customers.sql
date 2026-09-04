-- Add this as models/marts/high_value_customers.sql in marketing DEV.
-- Goal: build only this model while its upstream customer_value is absent in your DEV dataset.
select *
from {{ ref('customer_value') }}
where customer_segment = 'high_value'
