-- Total Revenue by Membership Type
SELECT
 	memberships.membership_type, 
	SUM(payments.payment_amount) AS total_revenue
FROM payments
JOIN memberships ON payments.membership_id = memberships.membership_id
GROUP BY
 memberships.membership_type;



-- Customer Participation in Classes
SELECT 	
	customers.customer_firstName,
 	customers.customer_lastName,
	classes.class_name, 
	trainer.trainer_firstName
FROM class_registration
JOIN customers ON class_registration.customer_id = customers.customer_id
JOIN classes ON class_registration.class_id = classes.class_id
JOIN trainer ON classes.trainer_id = trainer.trainer_id;


-- Customer Progress Over Time
SELECT
	customer_id, 
	MIN(body_fat) AS min_body_fat, 
	MAX(body_fat) AS max_body_fat
FROM customer_progress
GROUP BY customer_id
HAVING
 max_body_fat > min_body_fat;


-- Inventory Below Reorder Level
SELECT
	product_name, 
	available_quantity
FROM inventory
WHERE
 available_quantity < 10;


-- Most Popular Payment Methods
SELECT
	payment_method,
	COUNT(*) AS count
FROM payments
GROUP BY 
	payment_method
ORDER BY count DESC;
