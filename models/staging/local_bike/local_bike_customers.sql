select
	customer_id,
	first_name,
	last_name,
	phone,
	email,
	street,
	city,
	state,
from {{ source('local_bikes', 'customers') }}
