SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categories USING(category_id)
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT (SELECT MIN(product_id) + 4 FROM products)

SELECT AVG(units_in_stock) 
FROM products

SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock > (SELECT AVG(units_in_stock) FROM products)
ORDER BY units_in_stock

SELECT product_name
FROM products
WHERE NOT EXISTS (SELECT orders.order_id FROM orders
				 JOIN order_details USING(order_id)
				 WHERE order_details.product_id=product_id
				 AND order_date BETWEEN '1995-02-01' AND '1995-02-15')
				 
SELECT DISTINCT product_name, quantity
FROM products 
JOIN order_details USING(product_id)
WHERE quantity > ALL (SELECT AVG(quantity)
					  FROM order_details
					  GROUP by product_id)
ORDER BY quantity

SELECT customer_id SUM(freight) AS freight_sum
FROM orders
INNER JOIN (SELECT customer_id, AVG(freight) AS freight_avg
	    FROM orders
	    GROUP BY customer_id)
USING(customer_id)
WHERE freight > freight_avg AND shipped_date BETWEEN 'XXX' AND 'YYY'
GROUP BY customer_id
ORDER BY freight_sum;
