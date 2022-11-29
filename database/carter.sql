-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2022 at 08:14 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carter`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 4, 'Fruits', 'Fruits', 1, 0, '2022-11-15 15:48:01', NULL),
(11, 4, 'Vegetables', 'Vegetables', 1, 0, '2022-11-15 15:48:18', NULL),
(12, 5, 'Cakes', 'Soft and Sweet hand baken cakes', 1, 0, '2022-11-29 11:19:46', NULL),
(13, 5, 'Bread', 'Fluffy Fluffy breads', 1, 0, '2022-11-29 11:20:37', NULL),
(14, 6, 'Cool Drinks', 'Cool ', 1, 0, '2022-11-29 11:29:20', NULL),
(15, 6, 'Packaged Water', 'Water bottles Drinkable and Poratble', 1, 0, '2022-11-29 11:30:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(3, '202211-00001', 'Mahesh', '', 'Bishnoi', 'Male', '9699999999', 'Ganga Hostel, MNIT Jaipur', 'mahesh@test.com', '1a1dc91c907325c69271ddf0c944bc72', NULL, 1, 0, '2022-11-15 16:10:35', NULL),
(4, '202211-00002', 'Vishnu', '', 'Mali', 'Male', '9699999999', 'Aurobindo Hostel, MNIT Jaipur', 'vishnu@test.com', '1a1dc91c907325c69271ddf0c944bc72', NULL, 1, 0, '2022-11-15 16:27:08', NULL),
(5, '202211-00003', 'Rohit', '', '.', 'Male', '9699999999', 'Ganga Hostel, Jaipur 302017', 'rohit@test.com', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/clients/5.png?v=1668510304', 1, 0, '2022-11-15 16:35:03', '2022-11-15 16:35:04'),
(6, '202211-00004', 'anvesh', '', 'p', 'Male', '8341347323', 'ganga hostel', '2020ucp1815@mnit.ac.in', '81dc9bdb52d04dc20036dbd8313ed055', 'uploads/clients/6.png?v=1669700734', 1, 0, '2022-11-29 11:15:34', '2022-11-29 11:15:34');

--
-- Triggers `client_list`
--
DELIMITER $$
CREATE TRIGGER `newclient` AFTER INSERT ON `client_list` FOR EACH ROW INSERT INTO logs
 SET action = CONCAT('New Client id=', NEW.id),
     date = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `action` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`action`, `date`) VALUES
('1', '2022-11-29 12:05:54'),
('New Order 13', '2022-11-29 12:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(5, 13, 1, 95, '2022-11-15 16:11:14'),
(6, 11, 1, 45, '2022-11-15 16:11:28'),
(7, 13, 1, 95, '2022-11-29 11:03:45'),
(7, 12, 1, 30, '2022-11-29 11:03:45'),
(8, 12, 1, 30, '2022-11-29 11:25:01'),
(9, 14, 1, 25, '2022-11-29 11:25:01'),
(9, 15, 1, 50, '2022-11-29 11:25:01'),
(10, 17, 1, 20, '2022-11-29 11:36:27'),
(10, 18, 1, 40, '2022-11-29 11:36:27'),
(10, 16, 1, 40, '2022-11-29 11:36:27'),
(11, 15, 1, 50, '2022-11-29 11:36:27'),
(12, 14, 1, 25, '2022-11-29 12:05:54'),
(13, 19, 1, 119, '2022-11-29 12:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(5, '202211-00001', 3, 4, 95, 'Ganga Hostel, MNIT Jaipur', 1, '2022-11-15 16:11:14', '2022-11-15 16:12:35'),
(6, '202211-00002', 3, 4, 45, 'Ganga Hostel, MNIT Jaipur', 2, '2022-11-15 16:11:28', '2022-11-15 16:12:22'),
(7, '202211-00003', 5, 4, 125, 'Ganga Hostel, Jaipur 302017', 3, '2022-11-29 11:03:45', '2022-11-29 11:06:13'),
(8, '202211-00004', 6, 4, 30, 'ganga hostel,MNIT Jaipur', 3, '2022-11-29 11:25:01', '2022-11-29 11:40:33'),
(9, '202211-00005', 6, 5, 75, 'ganga hostel,MNIT Jaipur', 5, '2022-11-29 11:25:01', '2022-11-29 11:38:42'),
(10, '202211-00006', 6, 6, 100, 'Aurobindo Hostel , MNIT Jaipur ', 4, '2022-11-29 11:36:27', '2022-11-29 11:37:41'),
(11, '202211-00007', 6, 5, 50, 'Aurobindo Hostel , MNIT Jaipur ', 4, '2022-11-29 11:36:27', '2022-11-29 11:38:25'),
(12, '202211-00008', 6, 5, 25, 'ganga hostel', 0, '2022-11-29 12:05:54', '2022-11-29 12:05:54'),
(13, '202211-00009', 6, 6, 119, 'ganga hostel', 0, '2022-11-29 12:08:28', '2022-11-29 12:08:28');

--
-- Triggers `order_list`
--
DELIMITER $$
CREATE TRIGGER `neworder` AFTER INSERT ON `order_list` FOR EACH ROW INSERT INTO logs
 SET action = CONCAT('New Order ', NEW.id),
     date = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 4, 10, 'Tomato', '&lt;p&gt;Fresh Tomato&lt;/p&gt;', 40, 'uploads\\products\\tomato.jpg', 1, 0, '2022-11-15 15:48:51', '2022-11-15 16:05:23'),
(10, 4, 11, 'Potato', '&lt;p&gt;Fresh Potato&lt;/p&gt;', 30, 'uploads\\products\\potato.jpg', 1, 0, '2022-11-15 15:50:54', '2022-11-15 16:06:14'),
(11, 4, 11, 'Onion', '&lt;p&gt;Fresh onion&lt;/p&gt;', 45, 'uploads\\products\\onion.jpg', 1, 0, '2022-11-15 15:51:42', '2022-11-15 16:07:06'),
(12, 4, 10, 'Banana', '&lt;p&gt;Banana&lt;/p&gt;', 30, 'uploads\\products\\banana.jpg', 1, 0, '2022-11-15 15:57:10', '2022-11-15 16:03:03'),
(13, 4, 10, 'Apple', 'Apples', 95, 'uploads\\products\\apple.jpg', 1, 0, '2022-11-15 16:00:47', '2022-11-15 16:08:00'),
(14, 5, 12, 'Cup Cakes', '&lt;p&gt;Sweety&lt;/p&gt;', 25, 'uploads/products/14.png?v=1669701145', 1, 0, '2022-11-29 11:22:25', '2022-11-29 11:22:25'),
(15, 5, 13, 'Wheat Bread', '&lt;p&gt;Brown&amp;nbsp;&lt;/p&gt;', 50, 'uploads/products/15.png?v=1669701241', 1, 0, '2022-11-29 11:24:01', '2022-11-29 11:24:01'),
(16, 6, 14, 'Sprite', '&lt;p&gt;Sprite&lt;/p&gt;', 40, 'uploads/products/16.png?v=1669701637', 1, 0, '2022-11-29 11:30:37', '2022-11-29 11:30:37'),
(17, 6, 15, 'Bisleri', 'pure and Cure', 20, 'uploads/products/17.png?v=1669701693', 1, 0, '2022-11-29 11:31:33', '2022-11-29 11:31:33'),
(18, 6, 14, 'Fanta', '&lt;p&gt;fanTastic&lt;/p&gt;', 40, 'uploads/products/18.png?v=1669701759', 1, 0, '2022-11-29 11:32:38', '2022-11-29 11:32:39'),
(19, 6, 14, 'CranBerry', '&lt;p&gt;Non Alcoholic Fruit Juice&amp;nbsp;&lt;/p&gt;', 119, 'uploads/products/19.png?v=1669701869', 1, 0, '2022-11-29 11:34:29', '2022-11-29 11:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, 'Fruits & Vegetables', 1, 0, '2022-11-15 15:41:26', NULL),
(7, 'Dairy, Bread And Eggs', 1, 0, '2022-11-15 15:42:00', NULL),
(8, 'Snacks', 1, 0, '2022-11-15 15:42:24', NULL),
(9, 'Bakery', 1, 0, '2022-11-15 15:42:32', NULL),
(10, 'Drinks', 1, 0, '2022-11-29 11:26:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `totalorders` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`, `totalorders`) VALUES
(1, 'name', 'Grocery Management System', NULL),
(6, 'short_name', 'CARTER', NULL),
(11, 'logo', 'uploads/logo.png', NULL),
(13, 'user_avatar', 'uploads/user_avatar.jpg', NULL),
(14, 'cover', 'uploads/cover-1644367404.png', NULL),
(100, 'totalvalue', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Harsh', 'Yadav', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-11-15 15:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '202211-00001', 6, 'Fresh Fruits', 'Bharat', '9699999999', 'bharat', '1a1dc91c907325c69271ddf0c944bc72', NULL, 1, 0, '2022-11-15 15:44:33', NULL),
(5, '202211-00002', 9, 'Mukku Bakers', 'Mukesh  B', '9493119891', 'Mukesh', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/vendors/5.png?v=1669700905', 1, 0, '2022-11-29 11:18:25', '2022-11-29 11:18:25'),
(6, '202211-00003', 10, 'Beverages', 'Yaswanth kishor', '8500074854', 'yash', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/vendors/6.png?v=1669701491', 1, 0, '2022-11-29 11:28:11', '2022-11-29 11:28:11');

--
-- Triggers `vendor_list`
--
DELIMITER $$
CREATE TRIGGER `newvendor` AFTER INSERT ON `vendor_list` FOR EACH ROW INSERT INTO logs
 SET action = CONCAT('New Vendor id=', NEW.id, ' Shop Name = ',NEW.shop_name),
     date = NOW()
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
