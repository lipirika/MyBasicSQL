CREATE VIEW `vw_goods` AS
SELECT id_goods, id_categories, goods
FROM goods;


CREATE VIEW `vw_goods_categories` AS
SELECT id_categories, categories_name
FROM goods_categories;


SELECT vwc.categories_name, sub.id_categories, sub.cnt
FROM vw_goods_categories AS vwc
    INNER JOIN
        (SELECT id_categories, COUNT(goods) AS cnt
        FROM vw_goods
        GROUP BY id_categories) AS sub
    ON vwc.id_categories = sub.id_categories;
    
    
SELECT vwc.categories_name, sub.id_categories, sub.cnt
FROM vw_goods_categories AS vwc
    RIGHT JOIN
        (SELECT id_categories, COUNT(goods) AS cnt
        FROM vw_goods
        GROUP BY id_categories) AS sub
    ON vwc.id_categories = sub.id_categories;
    