CREATE TABLE sales_data (
    sale_id SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price NUMERIC(10, 2),
    discount NUMERIC(5, 2),
    sale_date DATE,
    customer_id INT,
    store_id INT
);

INSERT INTO sales_data (product_id, product_name, category, quantity, price, discount, sale_date, customer_id, store_id) VALUES
(1, 'Laptop', 'Electronics', 5, 1200.00, 10.00, '2023-01-15', 101, 1),
(2, 'Smartphone', 'Electronics', 15, 800.00, 5.00, '2023-02-20', 102, 2),
(3, 'Desk', 'Furniture', 10, 150.00, 0.00, '2023-03-05', 103, 1),
(4, 'Chair', 'Furniture', 25, 85.00, 2.00, '2023-03-10', 104, 3),
(5, 'Headphones', 'Accessories', 50, 50.00, 1.00, '2023-04-01', 105, 2),
(6, 'Mouse', 'Accessories', 40, 25.00, 0.50, '2023-04-15', 106, 1),
(7, 'Keyboard', 'Accessories', 30, 45.00, 1.00, '2023-05-05', 107, 3),
(8, 'Monitor', 'Electronics', 20, 300.00, 5.00, '2023-06-01', 108, 2),
(9, 'Tablet', 'Electronics', 15, 600.00, 7.50, '2023-06-10', 109, 3),
(10, 'Printer', 'Electronics', 10, 200.00, 3.00, '2023-07-01', 110, 1);



-- Insert more data to ensure significant amount of rows
DO
$$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO sales_data (product_id, product_name, category, quantity, price, discount, sale_date, customer_id, store_id)
        VALUES (
            (i % 10) + 1,
            'Product ' || (i % 10) + 1,
            CASE
                WHEN (i % 4) = 0 THEN 'Electronics'
                WHEN (i % 4) = 1 THEN 'Furniture'
                WHEN (i % 4) = 2 THEN 'Accessories'
                ELSE 'Miscellaneous'
            END,
            (i % 50) + 1,
            ROUND(CAST(RANDOM() * 1000 + 50 AS numeric), 2),
            ROUND(CAST(RANDOM() * 20 AS numeric), 2),
            '2023-01-01'::DATE + (i % 200),
            (i % 100) + 101,
            (i % 10) + 1
        );
    END LOOP;
END;
$$;