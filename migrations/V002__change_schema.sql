ALTER TABLE product
    ADD PRIMARY KEY (id);

ALTER TABLE orders
    ADD PRIMARY KEY (id);

ALTER TABLE product
    ADD COLUMN price DOUBLE PRECISION;

ALTER TABLE orders
    ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;

DROP TABLE IF EXISTS product_info;
DROP TABLE IF EXISTS orders_date;

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_product_id
        FOREIGN KEY (product_id) REFERENCES product (id)
        ON DELETE CASCADE;

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_orders_id
        FOREIGN KEY (order_id) REFERENCES orders (id)
        ON DELETE CASCADE;
