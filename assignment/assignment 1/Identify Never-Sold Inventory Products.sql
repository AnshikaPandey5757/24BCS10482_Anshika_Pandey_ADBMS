SELECT i.product_id,
       i.product_name
FROM inventory_current_stock i
WHERE NOT EXISTS (
    SELECT 1
    FROM sales_transactions s
    WHERE s.product_id = i.product_id
);
