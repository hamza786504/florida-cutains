-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 20, 2023 at 08:35 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myprivac_podtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `lead_id` int(11) NOT NULL,
  `google` varchar(3) NOT NULL DEFAULT 'No',
  `video1` varchar(3) NOT NULL DEFAULT 'No',
  `curtainWarranty` varchar(3) NOT NULL DEFAULT 'No',
  `sailWarranty` varchar(3) NOT NULL,
  `customerID` varchar(3) NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_companies`
--

CREATE TABLE `distributor_companies` (
  `company_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `marketing_email` varchar(80) NOT NULL,
  `owner_first` varchar(30) NOT NULL,
  `owner_last` varchar(30) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `google_review_link` varchar(500) DEFAULT NULL,
  `read_reviews` varchar(400) DEFAULT NULL,
  `facebook_link` varchar(300) DEFAULT NULL,
  `twitter_link` varchar(300) DEFAULT NULL,
  `instagram_link` varchar(300) DEFAULT NULL,
  `youtube_link` varchar(300) DEFAULT NULL,
  `testimonials` varchar(400) DEFAULT NULL,
  `pinterest_link` varchar(300) NOT NULL DEFAULT 'https://pinterest.com',
  `logo_file_path` varchar(200) DEFAULT NULL,
  `ups_acct` varchar(10) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 is open, 1 is closed',
  `tax_exempt` varchar(3) NOT NULL DEFAULT 'Yes',
  `open_days` varchar(20) NOT NULL DEFAULT 'Mon - Fri',
  `open_hours` varchar(20) NOT NULL DEFAULT '9am to 5pm',
  `status_emails` varchar(3) NOT NULL DEFAULT 'Yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `distributor_companies`
--

INSERT INTO `distributor_companies` (`company_id`, `name`, `address`, `city`, `state`, `zipcode`, `phone`, `marketing_email`, `owner_first`, `owner_last`, `website`, `google_review_link`, `read_reviews`, `facebook_link`, `twitter_link`, `instagram_link`, `youtube_link`, `testimonials`, `pinterest_link`, `logo_file_path`, `ups_acct`, `status`, `tax_exempt`, `open_days`, `open_hours`, `status_emails`) VALUES
(9, 'Florida Lanai Curtains', '971 Aurora Rd', 'Melbourne', 'FL', '32935', '813-686-0010', 'Info@lanaicurtains.com', 'Merrill', 'Burrows', 'www.lanaicurtains.com', 'https://g.page/r/CTabUCLluV-lEB0/review', 'https://www.google.com/search?q=florida+lanai+curtains&sxsrf=APwXEddYGJVk4DxzEG_g6f4IE5FMyLATwg%3A1687650815957&iflsig=AOEireoAAAAAZJeQD959jJ1IOXKKpPR28iy9YjwKPMvI&ved=0ahUKEwjmno2bjd3_AhVKfzABHX2FAGEQ4dUDCAs&uact=5&sclient=gws-wiz#ip=1&lrd=0x88e800b8573b18d5:0xa55fb9e522509b36,1,,,,', 'https://www.facebook.com/lanaicurtains', 'https://twitter.com', 'https://www.instagram.com/fl_lanai_curtains/', 'https://www.youtube.com/@floridalanaicurtains', 'https://www.youtube.com/playlist?list=PL7CTVEHgfjH3aai2hSTq9Pw3Xuherjqxn', 'https://www.pinterest.com/lanaicurtains/', 'assets/logos/FLC_LOGO_2022_C.jpg', '7W174V', 0, 'Yes', 'Mon - Fri', '9am to 5pm', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `lead_id` int(11) NOT NULL,
  `lead_type` int(1) NOT NULL DEFAULT 0 COMMENT '0 is curtain, 1 is sails',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zipcode` varchar(5) DEFAULT NULL,
  `gatecode` varchar(8) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `phone2` varchar(16) DEFAULT NULL,
  `lead_date` date NOT NULL,
  `contacted` varchar(3) NOT NULL DEFAULT 'No' COMMENT '0=no, 1=yes',
  `source` varchar(50) DEFAULT NULL,
  `optin` varchar(3) DEFAULT 'Yes',
  `mailchimp` int(1) NOT NULL DEFAULT 0 COMMENT '0 is no, 1 is yes',
  `sold` varchar(3) NOT NULL DEFAULT 'No' COMMENT 'contacted (0=no, 1=yes)',
  `curtain_length` int(3) NOT NULL DEFAULT 0,
  `sail_sqft_est` int(4) NOT NULL DEFAULT 0,
  `curtain_type` varchar(9) DEFAULT NULL,
  `lights` varchar(3) DEFAULT NULL,
  `area` varchar(11) DEFAULT NULL,
  `goal` varchar(15) DEFAULT NULL,
  `est_amount` decimal(13,2) DEFAULT NULL,
  `solid_est` decimal(13,2) DEFAULT NULL,
  `texture_est` decimal(13,2) DEFAULT NULL,
  `stripe_est` decimal(13,2) DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `county` varchar(40) DEFAULT 'UNKNOWN',
  `tax_rate` decimal(5,3) NOT NULL DEFAULT 0.070,
  `subtotal` decimal(13,2) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `install_date` date DEFAULT NULL,
  `alum_cost` decimal(13,2) NOT NULL DEFAULT 0.00,
  `followup_date` date DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `customer_msg` varchar(500) DEFAULT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 2.50,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 is for open and 1 is for closed',
  `stage` varchar(16) NOT NULL DEFAULT 'SALE',
  `installer_id` int(11) DEFAULT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `marketer_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `order_submitted` varchar(3) NOT NULL DEFAULT 'No',
  `promo_code` varchar(20) DEFAULT NULL,
  `lead_transfer` varchar(3) DEFAULT 'No',
  `google_review` varchar(3) DEFAULT 'No',
  `text_allowed` varchar(3) NOT NULL DEFAULT 'Yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `company_id` int(11) NOT NULL,
  `vinyl_ppf` decimal(13,2) NOT NULL,
  `solid_ppf` decimal(13,2) NOT NULL,
  `solamesh_ppf` decimal(13,2) NOT NULL,
  `solamesh_nine_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `solid9_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `texture_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `texture9_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `textureplus_ppf` decimal(13,2) NOT NULL,
  `textureplus9_ppf` decimal(13,2) NOT NULL,
  `stripes_ppf` decimal(13,2) NOT NULL DEFAULT 45.00,
  `stripes9_ppf` decimal(13,2) NOT NULL DEFAULT 50.00,
  `special_ppf` decimal(13,2) NOT NULL,
  `special9_ppf` decimal(13,2) NOT NULL,
  `vinyl_nine_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `val_solid_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `val_texture_ppf` decimal(13,2) NOT NULL,
  `val_textureplus_ppf` decimal(13,2) NOT NULL,
  `val_stripe_ppf` decimal(13,2) NOT NULL,
  `two_inch_straps` decimal(13,2) NOT NULL DEFAULT 0.00,
  `lights_ppf` decimal(13,2) NOT NULL DEFAULT 0.00,
  `eyebolt_cost` decimal(13,2) NOT NULL DEFAULT 3.50,
  `eyenut_cost` decimal(13,2) NOT NULL DEFAULT 1.75,
  `sail_sqft_price` decimal(13,2) NOT NULL DEFAULT 7.00,
  `special` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`company_id`, `vinyl_ppf`, `solid_ppf`, `solamesh_ppf`, `solamesh_nine_ppf`, `solid9_ppf`, `texture_ppf`, `texture9_ppf`, `textureplus_ppf`, `textureplus9_ppf`, `stripes_ppf`, `stripes9_ppf`, `special_ppf`, `special9_ppf`, `vinyl_nine_ppf`, `val_solid_ppf`, `val_texture_ppf`, `val_textureplus_ppf`, `val_stripe_ppf`, `two_inch_straps`, `lights_ppf`, `eyebolt_cost`, `eyenut_cost`, `sail_sqft_price`, `special`) VALUES
(9, 0.00, 49.00, 32.50, 35.50, 54.00, 52.00, 57.00, 54.00, 59.00, 63.00, 68.00, 75.00, 80.00, 8.50, 5.00, 6.00, 7.00, 8.50, 12.00, 4.00, 3.00, 2.75, 8.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `user_name` varchar(64) NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) NOT NULL COMMENT 'user''s email, unique',
  `user_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'user''s activation status',
  `user_expired` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =no, 1=yes',
  `user_activation_hash` varchar(40) DEFAULT NULL COMMENT 'user''s email verification hash string',
  `user_password_reset_hash` char(40) DEFAULT NULL COMMENT 'user''s password reset code',
  `user_password_reset_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of the password reset request',
  `user_rememberme_token` varchar(64) DEFAULT NULL COMMENT 'user''s remember-me cookie token',
  `user_failed_logins` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'user''s failed login attemps',
  `user_last_failed_login` int(10) DEFAULT NULL COMMENT 'unix timestamp of last failed login attempt',
  `user_registration_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_registration_ip` varchar(39) NOT NULL DEFAULT '0.0.0.0',
  `user_type` int(1) NOT NULL DEFAULT 0 COMMENT '0 is installer, 1 is distributor, 2 is POD employee, 3 is sales rep',
  `company_id` int(11) NOT NULL DEFAULT 0,
  `company_loc` int(2) DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `bizname` varchar(100) NOT NULL DEFAULT 'Business',
  `street` varchar(60) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `user_cell` varchar(15) DEFAULT NULL,
  `pay_rate` decimal(13,2) DEFAULT 15.00,
  `employee_type` varchar(1) DEFAULT NULL,
  `user_agreement` int(1) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes',
  `logo_file_path` varchar(80) NOT NULL DEFAULT 'assets/logos/pod_logo.png',
  `google_review` varchar(200) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `location` int(1) NOT NULL DEFAULT 0 COMMENT '0-distributor, 1=POD Melbourne, 2=Clermont',
  `calendar` text DEFAULT NULL,
  `forecast` varchar(3) NOT NULL DEFAULT 'Yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password_hash`, `user_email`, `user_active`, `user_expired`, `user_activation_hash`, `user_password_reset_hash`, `user_password_reset_timestamp`, `user_rememberme_token`, `user_failed_logins`, `user_last_failed_login`, `user_registration_datetime`, `user_registration_ip`, `user_type`, `company_id`, `company_loc`, `firstname`, `lastname`, `bizname`, `street`, `city`, `state`, `zipcode`, `user_phone`, `user_cell`, `pay_rate`, `employee_type`, `user_agreement`, `logo_file_path`, `google_review`, `website`, `location`, `calendar`, `forecast`) VALUES
(27, 'lanaicurtains', '$2y$10$75wd.XLDsqh7/BNORuf6buDo08k1sOQ1A/8EqEtI7YiJbsCTvd2nS', 'fllanaicurtains@gmail.com', 1, 0, NULL, NULL, NULL, NULL, 0, NULL, '2018-03-25 18:41:08', '65.35.0.224', 1, 9, 2, 'Merrill', 'Burrows', 'Florida Lanai Curtains', '971 Aurora Rd', 'Melbourne', 'FL', '32935', '813-686-0010', '321-522-8989', 15.00, NULL, 1, 'assets/logos/FLC_LOGO_2022_C.jpg', 'https://www.google.com/maps/place/Florida+Lanai+Curtains+LLC/@28.1340822,-80.636897,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0xa55fb9e522509b36!8m2!3d28.1340822!4d-80.6347083?hl=en', 'www.lanaicurtains.com', 0, '<iframe src=\"https://calendar.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23ffffff&ctz=America%2FNew_York&showTz=0&showCalendars=0&showTabs=1&showDate=1&showNav=1&src=ZmxsYW5haWN1cnRhaW5zQGdtYWlsLmNvbQ&src=YWRkcmVzc2Jvb2sjY29udGFjdHNAZ3JvdXAudi5jYWxlbmRhci5nb29nbGUuY29t&src=ZW4udXNhI2hvbGlkYXlAZ3JvdXAudi5jYWxlbmRhci5nb29nbGUuY29t&color=%23039BE5&color=%2333B679&color=%230B8043\" style=\"border:solid 1px #777\" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_details`
--

CREATE TABLE `visitor_details` (
  `visit_id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `referrer` varchar(400) NOT NULL,
  `time` datetime NOT NULL,
  `user_agent` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `est_count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `website_visitors`
--

CREATE TABLE `website_visitors` (
  `visitor_id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `referrer` varchar(400) DEFAULT NULL,
  `time` datetime NOT NULL,
  `user_agent` varchar(300) NOT NULL,
  `visit_count` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`lead_id`);

--
-- Indexes for table `distributor_companies`
--
ALTER TABLE `distributor_companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`lead_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `visitor_details`
--
ALTER TABLE `visitor_details`
  ADD PRIMARY KEY (`visit_id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `website_visitors`
--
ALTER TABLE `website_visitors`
  ADD PRIMARY KEY (`visitor_id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distributor_companies`
--
ALTER TABLE `distributor_companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `lead_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3432;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `visitor_details`
--
ALTER TABLE `visitor_details`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1765;

--
-- AUTO_INCREMENT for table `website_visitors`
--
ALTER TABLE `website_visitors`
  MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
