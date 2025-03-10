select 
	order_id,
	customer_id,
	order_status,
	SAFE_CAST(order_date AS DATETIME) as order_date,
	SAFE_CAST(required_date AS DATETIME) as required_date,
	SAFE_CAST(shipped_date AS DATETIME) as shipped_date, 
	store_id,
	staff_id
from {{ source('local_bikes', 'orders') }}