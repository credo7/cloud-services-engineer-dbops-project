-- Создаём индекс на таблице 'order_product', чтобы ускорить JOIN с таблицей заказов по 'order_id'
CREATE INDEX idx_order_product_order_id ON order_product (order_id);

-- Создаём композитный индекс на таблице 'orders' для эффективного поиска заказов по статусу и дате создания
CREATE INDEX idx_orders_status_date ON orders (status, date_created);

-- Если же фильтрация часто начинается с 'date_created', то лучше поменять порядок колонок в индексе
CREATE INDEX idx_orders_date_status ON orders (date_created, status);
