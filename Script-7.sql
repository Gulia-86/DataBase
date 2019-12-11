
-- 1.	��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.
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

-- 2.	�������� ������ ������� products � �������� catalogs, ������� ������������� ������.
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

 -- 3.	(�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). ���� from, to � label �������� ���������� �������� �������, ���� name � �������. �������� ������ ������ flights � �������� ���������� �������.
 
SELECT
  id,
  (SELECT name FROM cities WHERE label = `from`) AS 'from',
  (SELECT name FROM cities WHERE label = `to`) AS 'to'
FROM
  flights;
