select
    category_id,
	category_name
from {{ source('local_bikes', 'categories') }}