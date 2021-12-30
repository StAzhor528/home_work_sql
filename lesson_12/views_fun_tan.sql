USE fun_tan;

/*ѕредставлени¤:
 *1. олличество пользователей зарегестрированных в каждом мес¤це.*/
CREATE OR REPLACE VIEW month_registred_uesers (`Month`, `Monthname`, Registred_users)
AS SELECT MONTH(created_at), MONTHNAME(created_at), COUNT(*) 
FROM users 
GROUP BY 1 
ORDER BY 1;


/*2.“оварна¤ позици¤ и соответствующее название каталога.*/
CREATE OR REPLACE VIEW prd_cat 
AS SELECT p.name pr_name, c.name cat_name
FROM products p 
JOIN catalogs c 
WHERE p.catalog_id = c.id;


/*3.Ќомер заказа и товары в нем наход¤щиес¤.*/
CREATE OR REPLACE VIEW order_prd
AS SELECT op.order_id, p.name
FROM orders_products op 
JOIN products p 
ON op.product_id = p.id;