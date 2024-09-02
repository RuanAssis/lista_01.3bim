use ecommerce_22B;

-- 1 Listar todos os pedidos com detalhes do cliente.

SELECT order_id, order_date, CONCAT(first_name, ' ', last_name) as name, email
FROM Orders JOIN Customers
ON Orders.customer_id = Customers.customer_id;

-- 2 Encontrar todos os produtos pedidos por um cliente específico.

SELECT product_name, quantity, customer_id
FROM Products JOIN Order_Items
ON Products.product_id = Order_Items.product_id
JOIN Orders
ON Order_Items.order_id = Orders.order_id
WHERE customer_id = 1;

-- 3 Calcular o total gasto por cada cliente.

SELECT CONCAT(first_name, ' ', last_name) as name, SUM(price*quantity)
FROM Customers JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY name;

-- 4 Encontrar os clientes que nunca fizeram um pedido.

SELECT CONCAT(first_name, ' ', last_name) as name
FROM Customers LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE order_id IS null;

-- 5 Listar os produtos mais vendidos.

SELECT product_name, SUM(quantity) as total
FROM Order_Items JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY product_name
ORDER BY total DESC