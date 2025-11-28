-- ZRestaurants Database Schema
-- Make sure to execute this SQL file before using the script

-- Recipes table
CREATE TABLE IF NOT EXISTS `zrestaurants_recipes` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `restaurant` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    `image` VARCHAR(255) DEFAULT 'default.png',
    `price` INT(11) NOT NULL DEFAULT 0,
    `ingredients` LONGTEXT NOT NULL, -- JSON
    `station` VARCHAR(50) NOT NULL,
    `time` INT(11) NOT NULL DEFAULT 5000,
    `hunger` INT(11) NOT NULL DEFAULT 0,
    `thirst` INT(11) NOT NULL DEFAULT 0,
    `calories` INT(11) NOT NULL DEFAULT 0,
    `buffs` LONGTEXT DEFAULT NULL, -- JSON
    `enabled` TINYINT(1) NOT NULL DEFAULT 1,
    `created_by` VARCHAR(50) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_recipe` (`restaurant`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Menu items table (for offline shop)
CREATE TABLE IF NOT EXISTS `zrestaurants_menu` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `restaurant` VARCHAR(50) NOT NULL,
    `item` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    `image` VARCHAR(255) DEFAULT 'default.png',
    `price` INT(11) NOT NULL DEFAULT 0,
    `stock` INT(11) NOT NULL DEFAULT 0,
    `enabled` TINYINT(1) NOT NULL DEFAULT 1,
    `category` VARCHAR(50) DEFAULT 'food',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_menu_item` (`restaurant`, `item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Deliveries table
CREATE TABLE IF NOT EXISTS `zrestaurants_deliveries` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `restaurant` VARCHAR(50) NOT NULL,
    `player_identifier` VARCHAR(50) NOT NULL,
    `location` LONGTEXT NOT NULL, -- JSON
    `reward` INT(11) NOT NULL DEFAULT 0,
    `status` ENUM('pending', 'in_progress', 'completed', 'failed') NOT NULL DEFAULT 'pending',
    `started_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `completed_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_player` (`player_identifier`),
    KEY `idx_restaurant` (`restaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Delivery cooldowns table
CREATE TABLE IF NOT EXISTS `zrestaurants_delivery_cooldowns` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `player_identifier` VARCHAR(50) NOT NULL,
    `restaurant` VARCHAR(50) NOT NULL,
    `cooldown_until` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_cooldown` (`player_identifier`, `restaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sales history table
CREATE TABLE IF NOT EXISTS `zrestaurants_sales` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `restaurant` VARCHAR(50) NOT NULL,
    `item` VARCHAR(50) NOT NULL,
    `quantity` INT(11) NOT NULL DEFAULT 1,
    `price` INT(11) NOT NULL DEFAULT 0,
    `total` INT(11) NOT NULL DEFAULT 0,
    `seller_identifier` VARCHAR(50) DEFAULT NULL,
    `buyer_identifier` VARCHAR(50) DEFAULT NULL,
    `sale_type` ENUM('register', 'offline') NOT NULL DEFAULT 'register',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_restaurant` (`restaurant`),
    KEY `idx_seller` (`seller_identifier`),
    KEY `idx_buyer` (`buyer_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Music zones table
CREATE TABLE IF NOT EXISTS `zrestaurants_music` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `restaurant` VARCHAR(50) NOT NULL,
    `zone_id` INT(11) NOT NULL,
    `url` VARCHAR(255) DEFAULT NULL,
    `volume` FLOAT NOT NULL DEFAULT 0.3,
    `is_playing` TINYINT(1) NOT NULL DEFAULT 0,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_music_zone` (`restaurant`, `zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert default data for example restaurants
-- You can modify or remove this as needed

-- Insert some menu items for Burger Shot (these will be available in offline shop)
INSERT INTO `zrestaurants_menu` (`restaurant`, `item`, `label`, `image`, `price`, `stock`, `enabled`, `category`) VALUES
('burgershot', 'bs_burger', 'Burger Shot Burger', 'bs_burger.png', 15, 0, 1, 'food'),
('burgershot', 'bs_fries', 'Burger Shot Fries', 'bs_fries.png', 5, 0, 1, 'food'),
('burgershot', 'bs_soda', 'Burger Shot Soda', 'bs_soda.png', 3, 0, 1, 'drink')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `price`=VALUES(`price`);

-- Insert some menu items for Pizza This
INSERT INTO `zrestaurants_menu` (`restaurant`, `item`, `label`, `image`, `price`, `stock`, `enabled`, `category`) VALUES
('pizzathis', 'pizza_margherita', 'Margherita Pizza', 'pizza_margherita.png', 20, 0, 1, 'food'),
('pizzathis', 'pizza_pepperoni', 'Pepperoni Pizza', 'pizza_pepperoni.png', 25, 0, 1, 'food')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `price`=VALUES(`price`);

-- Insert menu items for Vanilla Unicorn (Bar)
INSERT INTO `zrestaurants_menu` (`restaurant`, `item`, `label`, `image`, `price`, `stock`, `enabled`, `category`) VALUES
('unicorn', 'unicorn_vodka', 'Vodka Glass', 'vodka.png', 12, 0, 1, 'drink'),
('unicorn', 'unicorn_whiskey', 'Whiskey Glass', 'whiskey.png', 15, 0, 1, 'drink'),
('unicorn', 'unicorn_beer', 'Cold Beer', 'beer.png', 8, 0, 1, 'drink'),
('unicorn', 'unicorn_cocktail', 'Unicorn Cocktail', 'cocktail.png', 18, 0, 1, 'drink'),
('unicorn', 'unicorn_tequila', 'Tequila Shot', 'tequila.png', 10, 0, 1, 'drink')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `price`=VALUES(`price`);

-- Insert menu items for Up'N Atom
INSERT INTO `zrestaurants_menu` (`restaurant`, `item`, `label`, `image`, `price`, `stock`, `enabled`, `category`) VALUES
('upnatom', 'atom_burger', 'Atom Burger', 'atom_burger.png', 18, 0, 1, 'food'),
('upnatom', 'atom_fries', 'Atom Fries', 'atom_fries.png', 6, 0, 1, 'food'),
('upnatom', 'atom_wings', 'Chicken Wings', 'wings.png', 14, 0, 1, 'food'),
('upnatom', 'atom_onion_rings', 'Onion Rings', 'onion_rings.png', 7, 0, 1, 'food'),
('upnatom', 'atom_milkshake', 'Milkshake', 'milkshake.png', 8, 0, 1, 'drink')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `price`=VALUES(`price`);

-- Insert menu items for Pop's Diner
INSERT INTO `zrestaurants_menu` (`restaurant`, `item`, `label`, `image`, `price`, `stock`, `enabled`, `category`) VALUES
('popsdiner', 'diner_breakfast', 'Classic Breakfast', 'breakfast.png', 22, 0, 1, 'food'),
('popsdiner', 'diner_pancakes', 'Pancakes Stack', 'pancakes.png', 16, 0, 1, 'food'),
('popsdiner', 'diner_club_sandwich', 'Club Sandwich', 'club_sandwich.png', 18, 0, 1, 'food'),
('popsdiner', 'diner_apple_pie', 'Apple Pie Slice', 'apple_pie.png', 12, 0, 1, 'food'),
('popsdiner', 'diner_hotdog', 'Hot Dog', 'hotdog.png', 10, 0, 1, 'food')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `price`=VALUES(`price`);

-- Insert menu items for Bean Machine Coffee
INSERT INTO `zrestaurants_menu` (`restaurant`, `item`, `label`, `image`, `price`, `stock`, `enabled`, `category`) VALUES
('beanmachine', 'bean_espresso', 'Espresso', 'espresso.png', 5, 0, 1, 'drink'),
('beanmachine', 'bean_cappuccino', 'Cappuccino', 'cappuccino.png', 8, 0, 1, 'drink'),
('beanmachine', 'bean_latte', 'Caffe Latte', 'latte.png', 9, 0, 1, 'drink'),
('beanmachine', 'bean_mocha', 'Mocha', 'mocha.png', 10, 0, 1, 'drink'),
('beanmachine', 'bean_iced_coffee', 'Iced Coffee', 'iced_coffee.png', 7, 0, 1, 'drink')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `price`=VALUES(`price`);

-- =====================================
-- JOBS & SOCIETIES SETUP INSTRUCTIONS
-- =====================================
-- Add these jobs to your database:
--
-- INSERT INTO `jobs` (`name`, `label`) VALUES
-- ('burgershot', 'Burger Shot'),
-- ('pizzathis', 'Pizza This'),
-- ('unicorn', 'Vanilla Unicorn'),
-- ('upnatom', 'Up\'N Atom'),
-- ('popsdiner', 'Pop\'s Diner'),
-- ('beanmachine', 'Bean Machine');
--
-- Add these societies to your database:
--
-- INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
-- ('society_burgershot', 'Burger Shot', 1),
-- ('society_pizzathis', 'Pizza This', 1),
-- ('society_unicorn', 'Vanilla Unicorn', 1),
-- ('society_upnatom', 'Up\'N Atom', 1),
-- ('society_popsdiner', 'Pop\'s Diner', 1),
-- ('society_beanmachine', 'Bean Machine', 1);
--
-- Add job grades (example for all restaurants):
--
-- INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
-- ('burgershot', 0, 'recruit', 'Recruit', 300, '{}', '{}'),
-- ('burgershot', 1, 'employee', 'Employee', 400, '{}', '{}'),
-- ('burgershot', 2, 'manager', 'Manager', 600, '{}', '{}'),
-- ('burgershot', 3, 'boss', 'Boss', 800, '{}', '{}');
--
-- Repeat the above for: pizzathis, unicorn, upnatom, popsdiner, beanmachine
