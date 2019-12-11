
-- 1.	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT
  p.name,
  p.id,
  c.id
FROM
 users AS p
RIGHT JOIN
  orders_products AS c
ON
  c.id = p.id;

-- 2.	Выведите список товаров products и разделов catalogs, который соответствует товару.
 SELECT
  p.id,
  p.name,
  c.name
FROM
  products AS p
LEFT JOIN
  catalogs AS c
ON
  c.id = p.catalog_id;

 -- 3.	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
 
SELECT
  id,
  (SELECT name FROM cities WHERE label = `from`) AS 'from',
  (SELECT name FROM cities WHERE label = `to`) AS 'to'
FROM
  flights;
