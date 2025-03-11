select
  concat(oi.product_id,"_",s.store_id) as most_sold_id,
  oi.product_id,
  s.store_id,
  s.store_name,
  p.product_name,
  c.category_name,
  count(*) as number_of_order,
  sum(quantity) as quantity_sold
from {{ref("local_bike_order_items")}} oi
left join {{ref("local_bike_products")}} p on oi.product_id = p.product_id
left join {{ref("local_bike_categories")}} c on p.category_id = c.category_id
left join {{ref("local_bike_orders")}} o on oi.order_id = o.order_id
left join {{ref("local_bike_stores")}} s on o.store_id = s.store_id
group by product_id,store_id,product_name,category_name,store_name
order by number_of_order desc,quantity_sold desc