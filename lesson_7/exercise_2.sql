USE shop;
SELECT products.id, products.name, catalogs.name 
FROM products, catalogs 
WHERE catalogs.id = products.catalog_id AND catalogs.id = 1;

