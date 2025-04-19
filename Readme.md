# Создание нового пользователя

Цель: Создать базу данных store, а также пользователя store_user с правами для работы с этой базой. Этот пользователь будет использоваться для выполнения миграций.

- Подключаемся к контейнеру PostgreSQL:
```
docker exec -it postgres bash
```

- Подключаемся к базе данных store
```
psql -U user -d store
```

- Создаём пользователя store_user с паролем password:
```sql
CREATE ROLE store_user WITH LOGIN PASSWORD 'password';
```

- Предоставляем все привилегии на схему и таблицы базы данных: Чтобы пользователь мог работать с базой данных, предоставим ему нужные права.
```sql
GRANT ALL PRIVILEGES ON SCHEMA public TO store_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO store_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO store_user;
```

# Запрос на получение количества проданных сосисок за последние 7 дней с группировкой по дням

```sql
SELECT o.date_created, SUM(op.quantity)
FROM orders AS o
         JOIN order_product AS op ON o.id = op.order_id
WHERE status = 'shipped'
  AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created
;
```