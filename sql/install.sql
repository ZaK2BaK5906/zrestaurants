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
