-- Создание продуктов
INSERT INTO product (id, name, picture_url, price)
VALUES
    (1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00),
    (2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00),
    (3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00),
    (4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315.00),
    (5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 330.00),
    (6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);

-- Создание заказов с случайным статусом и датой
INSERT INTO orders (id, status, date_created)
SELECT
    i,
    (ARRAY['pending', 'shipped', 'cancelled'])[FLOOR(RANDOM() * 3 + 1)],
    (CURRENT_DATE - (RANDOM() * INTERVAL '1000 days'))::DATE
FROM GENERATE_SERIES(1, 10000000) s(i);

-- Наполнение заказов товарами (Связывание заказов с продуктами)
INSERT INTO order_product (quantity, order_id, product_id)
SELECT
    FLOOR(1 + RANDOM() * 50)::INT,
    i,
    1 + FLOOR(RANDOM() * 6) ::INT
FROM GENERATE_SERIES(1, 10000000) s(i);
