-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: shopper
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_positions`
--

DROP TABLE IF EXISTS `cart_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_positions_cart_id_IDX` (`cart_id`,`product_id`) USING BTREE,
  KEY `cart_positions_FK` (`product_id`),
  CONSTRAINT `cart_positions_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `cart_positions_FK_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_positions`
--

LOCK TABLES `cart_positions` WRITE;
/*!40000 ALTER TABLE `cart_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_FK` (`user_id`),
  CONSTRAINT `carts_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_title_IDX` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Asphalt Paving'),(14,'Drilled Shafts'),(11,'Drywall & Acoustical (MOB)'),(4,'Electrical'),(6,'Electrical and Fire Alarm'),(3,'Epoxy Flooring'),(9,'Exterior Signage'),(5,'Fire Protection'),(12,'Glass & Glazing'),(13,'Granite Surfaces'),(7,'Masonry'),(10,'Roofing (Asphalt)'),(1,'Structural and Misc Steel (Fabrication)'),(15,'Temp Fencing, Decorative Fencing and Gates'),(8,'Waterproofing & Caulking');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_products` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `categories_products_FK_1` (`product_id`),
  CONSTRAINT `categories_products_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categories_products_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,1),(2,1),(6,1),(8,2),(2,4),(4,4),(2,5),(7,5),(2,6),(5,6),(6,6),(11,6),(14,6),(7,7),(10,7),(11,7),(13,8),(14,8),(1,9),(3,9),(5,9),(9,9),(15,9),(3,10),(5,10),(7,10),(9,10),(12,10),(2,11),(2,12),(4,12),(5,12),(7,13),(6,14),(11,14),(2,15),(8,15),(15,15),(2,16),(6,16),(11,16),(7,17),(14,17),(10,18),(14,18),(1,19),(9,19),(10,19),(1,20),(4,20),(10,20),(3,21),(4,21),(11,21),(4,22),(13,22),(14,22),(1,24),(6,24),(13,24),(14,24),(3,25),(9,25),(1,26),(2,26),(4,26),(1,27),(10,27),(11,27),(15,28),(4,29),(5,29),(8,29),(13,29),(2,30),(4,30),(6,30),(8,30),(9,30),(10,30),(12,30),(6,31),(13,31),(14,31),(15,32),(3,33),(6,33),(9,33),(1,35),(8,35),(2,36),(6,36),(11,36),(15,36),(15,37),(7,38),(8,38),(1,39),(2,39),(5,39),(6,39),(7,39),(13,39),(4,40),(10,40),(2,41),(6,41),(12,41),(15,41),(1,42),(3,42),(6,42),(10,42),(11,42),(8,43),(1,44),(4,44),(8,44),(15,44),(3,45),(4,45),(6,45),(13,45),(14,45),(15,45),(1,46),(5,46),(8,46),(9,46),(6,47),(13,47),(4,48),(11,49),(14,49),(1,50),(7,50),(4,51),(13,51),(2,52),(4,52),(5,52),(7,52),(13,52),(15,52),(10,53),(1,54),(2,54),(8,54),(11,55),(1,56),(12,56),(5,57),(9,57),(13,57),(3,58),(12,58),(13,58),(2,59),(13,59),(1,60),(4,60),(8,60),(1,61),(2,61),(4,61),(7,61),(9,62),(11,62),(2,63),(12,63),(15,63),(3,64),(11,64),(13,64),(7,65),(15,65),(5,66),(14,66),(7,67),(8,67),(2,68),(5,68),(6,68),(11,68),(14,68),(11,69),(12,69),(13,69),(1,70),(2,70),(3,70),(12,70),(13,70),(7,71),(14,72),(3,73),(11,73),(15,73),(1,74),(2,74),(7,74),(10,74),(15,74),(8,75),(4,76),(14,76),(1,77),(6,77),(10,77),(12,77),(2,78),(6,78),(11,78),(11,79),(13,79),(5,80),(10,80),(12,80),(13,80),(11,81),(15,81),(2,82),(5,82),(7,82),(4,83),(5,83),(12,83),(2,84),(5,84),(9,84),(11,84),(5,85),(12,85),(1,86),(3,86),(10,86),(11,86),(15,86),(2,87),(5,87),(11,87),(15,87),(7,88),(8,88),(9,90),(11,90),(15,90),(9,91),(5,92),(10,92),(13,93),(3,94),(11,94),(2,95),(3,95),(5,95),(1,96),(4,96),(4,97),(13,97),(15,97),(1,98),(2,98),(10,98),(14,98),(2,99),(5,99),(10,99),(13,99),(8,100);
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `products_title_IDX` (`title`) USING BTREE,
  KEY `products_price_IDX` (`price`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Garlic - Primerba, Paste','synthesize scalable technologies',1521.64,0),(2,'Cranberries - Fresh','exploit strategic markets',8991.82,0),(3,'Tea - Apple Green Tea','generate real-time action-items',976.74,0),(4,'Beer - Blue Light','matrix e-business paradigms',1165.69,0),(5,'Kippers - Smoked','revolutionize dynamic e-services',2205.54,0),(6,'Wine - Manischewitz Concord','harness out-of-the-box partnerships',7599.58,0),(7,'Dikon','exploit interactive channels',8527.04,0),(8,'Garlic - Peeled','engineer B2C initiatives',9824.20,0),(9,'Chick Peas - Canned','deliver efficient users',1612.33,0),(10,'Jam - Blackberry, 20 Ml Jar','syndicate leading-edge interfaces',2081.24,0),(11,'Squash - Pepper','unleash seamless web-readiness',5819.92,0),(12,'Beef - Prime Rib Aaa','expedite collaborative communities',9193.41,0),(13,'Wine - White, French Cross','visualize frictionless supply-chains',8683.95,0),(14,'Nantucket Orange Juice','enable front-end niches',265.29,0),(15,'Beans - Black Bean, Preserved','empower strategic synergies',397.83,0),(16,'Pasta - Linguini, Dry','facilitate scalable portals',474.90,0),(17,'Calaloo','architect visionary solutions',4009.86,0),(18,'Wine - Rosso Del Veronese Igt','enable strategic niches',3706.21,0),(19,'Wine - Chablis J Moreau Et Fils','brand e-business e-services',6186.17,0),(20,'Cheese - Shred Cheddar / Mozza','target 24/7 deliverables',3170.24,0),(21,'Flour - Corn, Fine','monetize viral infrastructures',8942.96,0),(22,'Puree - Blackcurrant','mesh interactive vortals',5480.23,0),(23,'Lamb - Loin Chops','orchestrate clicks-and-mortar interfaces',4917.26,0),(24,'Lamb - Leg, Bone In','evolve synergistic ROI',5160.79,0),(25,'Trueblue - Blueberry Cranberry','matrix enterprise e-tailers',2730.80,0),(26,'Icecream Cone - Areo Chocolate','repurpose bricks-and-clicks supply-chains',2403.44,0),(27,'Cookies - Fortune','e-enable web-enabled infrastructures',1152.13,0),(28,'Wine - Vovray Sec Domaine Huet','target clicks-and-mortar applications',1771.21,0),(29,'Wine - White, Cooking','engage killer deliverables',9720.74,0),(30,'Juice - Apple, 341 Ml','incubate 24/7 supply-chains',1334.75,0),(31,'Salt And Pepper Mix - White','whiteboard holistic e-business',4292.82,0),(32,'Cheese - Taleggio D.o.p.','reintermediate world-class e-markets',5357.32,0),(33,'Loquat','brand granular web-readiness',6403.23,0),(34,'Cheese - Cheddar, Mild','envisioneer extensible partnerships',7548.27,0),(35,'Compound - Pear','engage compelling deliverables',2798.31,0),(36,'Shopper Bag - S - 4','facilitate user-centric users',7824.30,0),(37,'Chips - Doritos','monetize cross-media mindshare',2433.38,0),(38,'Wine - Cotes Du Rhone Parallele','incubate value-added e-tailers',5714.36,0),(39,'Curry Paste - Green Masala','enhance cutting-edge vortals',4672.10,0),(40,'Water - Tonic','scale web-enabled supply-chains',5741.29,0),(41,'Veal - Insides Provini','implement proactive platforms',3804.14,0),(42,'Pork - Back, Short Cut, Boneless','engage interactive experiences',701.49,0),(43,'Bread - Assorted Rolls','transition impactful initiatives',1853.12,0),(44,'Garbage Bags - Black','empower bricks-and-clicks experiences',2168.36,0),(45,'Appetizer - Asian Shrimp Roll','implement innovative methodologies',155.76,0),(46,'Wine - Zinfandel California 2002','visualize real-time technologies',4432.01,0),(47,'Oil - Grapeseed Oil','revolutionize synergistic paradigms',5570.54,0),(48,'Veal - Kidney','envisioneer B2C eyeballs',8831.14,0),(49,'Capers - Ox Eye Daisy','visualize compelling paradigms',4592.97,0),(50,'Muffin Mix - Oatmeal','unleash scalable functionalities',2421.68,0),(51,'Fennel - Seeds','empower visionary ROI',4567.22,0),(52,'Sauce - Ranch Dressing','disintermediate ubiquitous channels',4395.08,0),(53,'Truffle Cups - Red','expedite rich e-services',5840.36,0),(54,'Jerusalem Artichoke','unleash robust mindshare',9197.49,0),(55,'Lotus Leaves','brand revolutionary relationships',180.04,0),(56,'Cabbage - Nappa','brand innovative e-services',8603.27,0),(57,'Crush - Grape, 355 Ml','e-enable frictionless interfaces',8296.37,0),(58,'Contreau','benchmark strategic synergies',3931.48,0),(59,'Walkers Special Old Whiskey','whiteboard best-of-breed initiatives',6743.75,0),(60,'Lamb Shoulder Boneless Nz','innovate extensible partnerships',369.12,0),(61,'Lamb - Whole Head Off','empower virtual channels',6113.81,0),(62,'Garlic','productize sexy infomediaries',3339.06,0),(63,'Snapple - Mango Maddness','engineer sticky partnerships',9027.70,0),(64,'Syrup - Chocolate','envisioneer mission-critical supply-chains',9586.08,0),(65,'Coffee Cup 16oz Foam','maximize killer channels',3043.71,0),(66,'Lamb Rack - Ontario','e-enable innovative portals',5461.06,0),(67,'Beef - Striploin Aa','harness strategic interfaces',9754.86,0),(68,'Syrup - Monin - Granny Smith','revolutionize viral experiences',7531.47,0),(69,'Veal - Insides Provini','embrace innovative infrastructures',868.95,0),(70,'Bread - Dark Rye, Loaf','unleash efficient mindshare',9526.78,0),(71,'Beef - Bones, Cut - Up','extend frictionless metrics',2882.31,0),(72,'Sauce - Plum','incentivize back-end synergies',4308.87,0),(73,'Lamb - Racks, Frenched','grow end-to-end infomediaries',6139.07,0),(74,'Wine - Prem Select Charddonany','envisioneer frictionless web-readiness',9931.96,0),(75,'Pork - Hock And Feet Attached','facilitate robust e-business',1499.36,0),(76,'Table Cloth 120 Round White','innovate clicks-and-mortar communities',4260.03,0),(77,'Sauce - Bernaise, Mix','seize cutting-edge deliverables',3483.78,0),(78,'Pork - Tenderloin, Frozen','utilize synergistic platforms',1302.61,0),(79,'Soup Campbells Turkey Veg.','integrate granular e-markets',1604.87,0),(80,'Bagel - 12 Grain Preslice','extend collaborative relationships',4570.89,0),(81,'Glove - Cutting','morph out-of-the-box portals',1036.53,0),(82,'Pecan Raisin - Tarts','transform scalable functionalities',5752.69,0),(83,'Pastry - Cheese Baked Scones','transition killer applications',7071.62,0),(84,'Cheese - Brie Roitelet','grow open-source supply-chains',2776.60,0),(85,'Beef - Salted','harness revolutionary infomediaries',7948.53,0),(86,'Alize Red Passion','architect clicks-and-mortar e-markets',3543.38,0),(87,'Irish Cream - Butterscotch','architect e-business ROI',4935.22,0),(88,'Beer - Molson Excel','utilize revolutionary communities',6552.81,0),(89,'Soup - Campbells, Minestrone','leverage web-enabled interfaces',4814.98,0),(90,'Ocean Spray - Kiwi Strawberry','deliver extensible action-items',9707.19,0),(91,'Coffee Guatemala Dark','exploit best-of-breed networks',8376.55,0),(92,'Rice - Brown','orchestrate robust platforms',7805.34,0),(93,'Beef - Eye Of Round','cultivate bricks-and-clicks action-items',990.98,0),(94,'Island Oasis - Mango Daiquiri','harness cutting-edge users',5683.36,0),(95,'Urban Zen Drinks','reinvent synergistic mindshare',3814.39,0),(96,'Pail - 4l White, With Handle','seize real-time ROI',3110.96,0),(97,'Bread - Bagels, Plain','exploit extensible relationships',5807.90,0),(98,'Turkey - Ground. Lean','orchestrate seamless initiatives',9276.14,0),(99,'Sour Puss Sour Apple','embrace leading-edge networks',9779.52,0),(100,'Beef - Diced','harness front-end architectures',690.25,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MANAGER'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_IDX` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dkinneir0@uol.com.br','Debor','Kinneir','$2a$10$aZinW78QOdXYw5uwnRW0b.bvTeRqDxBPz6/Ww5k6IsRiTiowRFciO',1),(2,'lbourthoumieux1@hud.gov','Lucita','Bourthoumieux','$2a$10$euh3ik6TtqlWORRfr6CejOOGYzGNIL6HniAdQlvgM81cQ130MDIXi',1),(3,'vexall2@ucoz.com','Seward','Exall','$2a$10$.v6MZ.WLmVqUIq7sUA8cg.I01GAezjXSzRdnEEH.DeExbiJtVeK.m',1),(4,'lrawood3@ebay.co.uk','Lori','Rawood','$2a$10$dsC4XKlolxEUd6iqS0WaVOrpex51c7aCL0Xc0acN/Jl8byaXG2ZPu',1),(5,'astothert4@slideshare.net','Aldus','Stothert','$2a$10$HI.U/axDXZrbsSyKk1bSYOgGnkX/1hDQL8kNHICMCcls1IbCnkBzu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `users_roles_FK_1` (`role_id`),
  CONSTRAINT `users_roles_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_roles_FK_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(4,2),(5,2),(5,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shopper'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-05 16:07:01
