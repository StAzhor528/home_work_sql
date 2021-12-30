USE fun_tan; 

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'Audio', '2015-10-31 23:14:28', '1992-09-18 21:53:32');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'Video', '1984-02-14 07:29:10', '1984-12-01 13:31:34');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'Text', '2006-04-29 06:02:07', '1984-10-07 01:50:03');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'Photo', '2011-02-09 14:01:52', '2001-01-20 01:50:17');

INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('1', '1', 'Quia ut est dolores eveniet. Repellat est fugiat sit soluta mollitia. Nihil qui et eius velit.', 'quod', '239', NULL, '1998-03-09 06:56:27', '2019-09-08 01:19:18');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('2', '2', 'Tempore quos eligendi consequatur qui tempore eos enim suscipit. Iure odit in quas fuga nobis facilis. Delectus aut non debitis. Ab earum corporis quibusdam tempore sequi recusandae.', 'cum', '500820', NULL, '2015-07-08 00:28:27', '1974-08-24 00:02:25');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('3', '3', 'Officia dicta quis et distinctio perferendis est nostrum. Ut aspernatur molestias magni sit qui. Odit ea fugit corrupti est.', 'dolores', '733136634', NULL, '2016-12-26 15:53:24', '2004-11-15 23:33:09');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('4', '4', 'Incidunt numquam consectetur labore quia ut placeat qui. Ipsam voluptatum et ipsa quisquam laboriosam sint. Cumque ex veniam temporibus quia. Dolor rerum corrupti sit.', 'culpa', '24773', NULL, '1996-02-15 07:56:06', '1973-07-07 15:31:42');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('5', '1', 'Omnis quia temporibus aut laboriosam. Consequuntur iure omnis id minus est. Exercitationem perferendis corporis voluptatem deleniti dicta quod. Omnis eaque consequatur maiores culpa.', 'nostrum', '50108787', NULL, '1977-01-12 13:45:04', '1986-06-21 23:47:26');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('6', '2', 'Aut sit esse tenetur quisquam eligendi nam ullam. Eaque suscipit dolorem rem et unde voluptate. Ipsam cum reiciendis fuga facilis neque exercitationem. Minima nemo occaecati neque libero.', 'at', '0', NULL, '1983-02-23 18:47:10', '2016-10-24 09:53:29');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('7', '3', 'Ut totam officiis et rerum ratione. Officia repudiandae ducimus optio. Rerum sed qui veritatis natus quae debitis. Aliquam et veniam illum sapiente. Ipsam sit quae ipsum consequatur aut dolores.', 'temporibus', '9', NULL, '1976-04-23 14:24:26', '1986-08-27 14:21:57');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('8', '4', 'Veritatis voluptas vel suscipit rem et eius dicta. Non iure voluptas iste commodi consequatur. Est doloremque quia eum est et nesciunt molestias id. Nostrum necessitatibus dolore ea excepturi voluptatibus aperiam.', 'unde', '76769', NULL, '2010-07-04 06:11:33', '2015-11-24 07:19:48');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('9', '1', 'Sunt consequuntur perspiciatis nisi eaque non. Recusandae maxime quos vel accusamus porro autem. Id minima facere tenetur voluptatem voluptatem. Aliquid voluptas consequatur laborum et.', 'quas', '0', NULL, '1980-03-08 05:30:30', '1997-09-02 07:47:11');
INSERT INTO `media` (`id`, `media_type_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('10', '2', 'Pariatur recusandae aut recusandae et. Quidem quaerat ea architecto. Est reprehenderit voluptatem id. Ducimus quibusdam voluptatem esse.', 'beatae', '5182022', NULL, '1989-01-05 13:47:13', '2004-07-16 23:10:06');

INSERT INTO catalogs (name)
VALUES ('‘онтаны'), ('ѕриточна¤ вентил¤ци¤'), ('”правление насосами');

INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('1', 'numquam', '1975-11-24', '1988-02-11 01:17:10', '2008-06-21 05:56:59', '1');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('2', 'repellat', '2015-12-19', '1977-06-30 02:44:26', '1999-11-19 17:37:17', '2');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('3', 'sit', '1983-10-25', '2020-04-28 03:25:58', '2010-04-29 18:01:42', '3');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('4', 'cum', '2018-10-11', '2007-12-01 21:29:10', '1990-10-29 08:27:09', '4');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('5', 'illum', '1998-03-19', '1982-12-12 22:49:06', '1991-02-26 01:28:13', '5');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('6', 'alias', '1989-10-20', '2002-02-10 10:47:59', '1986-03-30 04:53:05', '6');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('7', 'autem', '2009-09-09', '1998-12-29 04:49:03', '1975-06-14 23:18:44', '7');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('8', 'non', '1973-03-01', '2002-04-11 00:50:05', '1979-09-17 01:17:55', '8');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('9', 'in', '2009-08-29', '2004-06-15 11:17:38', '1997-11-05 14:16:29', '9');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`, `media_id`) VALUES ('10', 'eius', '2009-04-22', '2000-03-27 03:41:51', '2004-06-04 01:10:33', '10');

INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('1', 'amet', 'Qui inventore porro pariatur est ut. Consequuntur expedita pariatur quidem officiis. Id vero tenetur at perspiciatis. Hic corporis animi sed non voluptates omnis repellat.', '7.95', '1', '2019-01-01 07:33:52', '2011-03-16 13:15:35', '1');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('2', 'qui', 'Voluptatum dolore neque non excepturi. Rem corrupti quas repudiandae aspernatur distinctio dolorem molestiae. Quo assumenda eveniet molestias minus soluta tempore.', '21600035.34', '2', '2013-09-09 10:11:21', '2006-12-02 16:22:59', '2');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('3', 'alias', 'Nulla magnam ut eum quia. Fugit consequuntur sint dicta explicabo ipsam officia. Asperiores a laudantium possimus a cum dolorem. Totam asperiores sunt aut ex.', '12.99', '3', '1976-06-01 23:28:31', '1988-11-19 17:54:28', '3');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('4', 'omnis', 'Nemo corrupti veniam ut. Iste deserunt tempore impedit vitae itaque animi. Placeat cum ipsa sint et accusantium et tempore.', '795.43', '1', '1988-11-16 12:01:06', '1993-06-05 15:11:52', '4');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('5', 'aut', 'Necessitatibus iste tenetur et animi nesciunt est non. Voluptatem dolorem quia voluptas nisi et voluptas. Iste ipsa neque facilis in vel facilis eos vitae. Enim reiciendis totam officia architecto saepe voluptatibus error.', '38.00', '2', '2014-05-05 22:45:43', '1977-12-23 09:23:32', '5');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('6', 'rerum', 'Excepturi cupiditate est harum. Et voluptatem vero voluptatem adipisci.', '65687.71', '3', '1999-11-11 14:48:12', '1991-02-23 21:40:32', '6');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('7', 'odit', 'Eius rem adipisci et asperiores dolore est ullam. Vitae enim repudiandae in tempora sit. Magnam sapiente hic quo dolorem hic autem. Iure laborum ab qui quo rerum aut earum.', '35.81', '1', '2000-09-29 22:01:55', '1997-06-09 02:27:18', '7');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('8', 'eos', 'Sit error cum ullam quibusdam. Dolores sunt ipsam rerum rerum soluta consequatur qui. Aut autem iusto laborum soluta. Eum quidem doloremque ut perspiciatis aliquam.', '118029372.82', '2', '1989-05-29 07:20:20', '2004-02-03 15:43:09', '8');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('9', 'totam', 'Dolorem enim maxime omnis aliquid. Reiciendis voluptate officia qui libero aut numquam eligendi excepturi. Possimus et id et a.', '0.40', '3', '2021-02-04 12:45:07', '1990-02-14 06:26:02', '9');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `catalog_id`, `created_at`, `updated_at`, `media_id`) VALUES ('10', 'necessitatibus', 'Nesciunt saepe et maxime quae. Eos voluptatum libero animi facilis iste eligendi et. At eum inventore expedita quibusdam. Vitae et hic blanditiis. Inventore saepe voluptate cumque cumque ad.', '11.41', '1', '1970-03-31 06:12:29', '1989-12-31 23:21:35', '10');

INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('1', '1', '1998-08-18 07:06:25', '2020-03-28 09:33:55');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('2', '2', '2006-10-18 04:06:13', '1988-12-22 02:01:18');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('3', '3', '2012-12-30 13:35:14', '1981-02-11 03:42:38');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('4', '4', '2001-07-03 01:35:30', '2014-05-22 15:14:19');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('5', '5', '1984-08-31 12:37:32', '2009-03-28 04:56:08');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('6', '6', '1993-02-05 07:59:12', '1971-09-27 03:10:13');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('7', '7', '1990-10-17 05:32:40', '1988-11-14 20:32:06');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('8', '8', '1991-07-23 04:47:57', '1994-04-17 04:59:29');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('9', '9', '1980-08-09 09:16:32', '1978-12-03 01:53:36');
INSERT INTO `orders_for_filldb` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('10', '10', '1991-02-05 22:25:03', '2012-01-24 08:57:26');

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('1', '1', '1', '1', '1990-09-21 12:32:43', '1984-10-01 23:58:46');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('2', '2', '2', '1', '2004-06-29 11:59:25', '2000-11-16 23:09:12');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('3', '3', '3', '1', '2015-11-25 11:43:09', '1972-07-24 10:56:44');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('4', '4', '4', '1', '1984-02-21 15:19:25', '1992-03-25 23:48:47');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('5', '5', '5', '1', '1995-07-28 08:52:58', '2010-07-28 02:05:05');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('6', '6', '6', '1', '2015-03-30 06:39:53', '2008-09-29 19:35:08');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('7', '7', '7', '1', '2018-05-21 02:12:50', '1982-11-28 20:14:18');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('8', '8', '8', '1', '1999-03-21 02:01:47', '1982-06-24 01:38:13');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('9', '9', '9', '1', '1993-06-02 16:54:23', '1988-10-04 18:42:50');
INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `total`, `created_at`, `updated_at`) VALUES ('10', '10', '10', '1', '1976-05-22 18:09:36', '1984-10-06 01:24:53');

INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('1', '1', '1', '353228', '1999-02-05 07:53:24', '2006-12-14 17:30:20', '1978-10-23 19:27:59', '2003-06-16 08:21:14');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('2', '2', '2', '0', '2006-03-10 02:32:18', '1991-09-06 02:41:59', '1994-06-16 09:05:24', '2010-11-09 11:57:52');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('3', '3', '3', '6146490', '2015-04-05 03:50:55', '1991-02-17 04:17:13', '1972-09-23 08:39:28', '1975-10-12 02:20:18');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('4', '4', '4', '77', '1985-07-12 22:08:46', '2010-07-18 16:57:46', '2019-01-18 05:54:44', '1973-09-06 23:35:51');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('5', '5', '5', '41189', '2004-05-08 05:45:09', '1990-06-17 13:47:55', '1980-09-27 01:30:17', '2012-01-17 04:37:54');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('6', '6', '6', '0', '1979-11-01 08:13:08', '1987-11-07 04:12:47', '1970-01-31 14:28:10', '1975-04-08 13:30:34');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('7', '7', '7', '261', '1977-02-27 23:07:22', '2001-09-14 00:16:57', '2011-03-29 23:38:20', '2004-09-25 12:55:17');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('8', '8', '8', '81', '2001-09-26 19:22:03', '1980-12-25 16:34:57', '2015-07-08 20:49:06', '1979-12-21 09:23:47');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('9', '9', '9', '140', '1997-12-30 12:04:38', '2014-03-25 16:12:26', '2001-04-23 12:22:52', '2000-03-01 01:40:36');
INSERT INTO `discounts` (`id`, `user_id`, `product_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('10', '10', '10', '27309700', '1988-12-24 15:02:27', '1975-02-28 16:38:03', '2010-08-25 13:46:19', '2013-09-13 17:02:14');

INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('1', 'aperiam', '2008-09-07 20:38:57', '2020-03-15 10:49:12', '1');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('2', 'odit', '2021-05-07 15:42:58', '2017-08-12 16:52:06', '2');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('3', 'quibusdam', '2010-03-30 21:53:50', '1990-02-07 21:12:40', '3');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('4', 'voluptas', '2020-05-17 17:16:17', '1991-02-13 04:43:10', '4');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('5', 'officiis', '1986-08-19 04:27:14', '1979-05-23 18:14:04', '5');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('6', 'distinctio', '2002-11-02 18:36:46', '1970-09-28 10:33:40', '6');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('7', 'deleniti', '2009-05-06 18:48:02', '1979-07-11 21:52:31', '7');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('8', 'vel', '1998-03-01 20:22:22', '2013-09-03 07:54:20', '8');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('9', 'blanditiis', '1995-08-20 13:42:24', '1989-05-28 04:02:24', '9');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`, `media_id`) VALUES ('10', 'delectus', '1986-08-30 08:31:45', '1982-01-28 14:34:56', '10');

INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('1', '1', '1', NULL, '2000-12-16 09:36:46', '1975-08-02 00:01:57');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('2', '2', '2', NULL, '2002-11-16 11:44:24', '1999-04-27 21:16:22');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('3', '3', '3', NULL, '2009-04-16 08:21:00', '1974-01-19 08:55:35');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('4', '4', '4', NULL, '2003-12-16 04:00:17', '1990-01-07 03:12:46');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('5', '5', '5', NULL, '2021-05-29 13:02:41', '1992-11-15 01:06:55');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('6', '6', '6', NULL, '1975-04-24 07:34:58', '1997-08-19 14:23:05');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('7', '7', '7', NULL, '2008-10-30 23:59:58', '2004-02-05 16:06:54');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('8', '8', '8', NULL, '1990-10-19 20:19:21', '1991-07-16 00:36:15');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('9', '9', '9', NULL, '1991-01-04 15:38:51', '2007-04-27 18:13:37');
INSERT INTO `storehouses_products` (`id`, `storehouses_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('10', '10', '10', NULL, '2021-03-30 07:58:06', '1970-12-04 09:20:41');
