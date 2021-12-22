
DROP VIEW IF EXISTS shop.prd;
CREATE VIEW shop.prd_cat AS SELECT shop.products.name pr_name, shop.catalogs.name cat_name
FROM shop.products JOIN shop.catalogs WHERE shop.products.catalog_id = shop.catalogs.id;


