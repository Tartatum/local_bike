with total_order_by_store_id as(
    SELECT 
        o.store_id,
        round(sum((oi.quantity * oi.list_price) * (1 - oi.discount)),2) as total_revenue
    FROM
        {{ref("local_bike_order_items")}} oi
        left join {{ref("local_bike_orders")}} o on o.order_id = oi.order_id
    group by o.store_id
)
SELECT 
    s.store_id,
    s.store_name,
    tos.total_revenue
FROM 
    {{ref("local_bike_stores")}} s 
    left join total_order_by_store_id tos on s.store_id = tos.store_id
order by total_revenue desc