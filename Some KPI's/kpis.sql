select product_id from order_details join returns_and_refunds on order_details.order_id = returns_and_refunds.order_id;
select payment_statues,sum(total_price) from transaction_details group by payment_statues;
select transaction_type,count(transaction_type) from transaction_details group by transaction_type;
select user_id,count(order_id) number_of_orders from order_details group by user_id order by number_of_orders desc;
select product_id,count(product_id) number_of_orders from order_details group by product_id order by number_of_orders desc;
select count(rating),product_id from ratings_reviews join order_details on ratings_reviews.order_id=order_details.order_id group by product_id order by count(rating);
select product_id,sum(quantity) from order_details group by product_id order by sum(quantity) desc;
select count(rating),product_id,sum(quantity) from ratings_reviews join order_details on ratings_reviews.order_id=order_details.order_id group by product_id order by count(rating) desc,sum(quantity);
select shipping_pincode,count(order_id),city from user_details join order_details using(user_id) join warehouse_details on user_details.shipping_pincode=warehouse_details.pincode group by shipping_pincode,city order by count(order_id) desc;
select year(transaction_date_time),sum(total_price) from transaction_details group by year(transaction_date_time) order by sum(total_price) desc;
WITH UserOrderCounts AS (
    SELECT user_id, COUNT(order_id) AS order_count,
           RANK() OVER (ORDER BY COUNT(order_id) DESC) AS rnk
    FROM order_details
    GROUP BY user_id
)
SELECT user_id, order_count
FROM UserOrderCounts
WHERE rnk = 1;

select transaction_type,sum(total_price) from transaction_details group by transaction_type order by sum(total_price) desc;
select category_id,sum(quantity) from product_category join product_details on product_category.category_id=product_details.product_category join order_details using(product_id) group by product_category.category_id;