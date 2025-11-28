-- ==========================================
-- ZRESTAURANTS - JOBS & SOCIETIES SQL
-- ==========================================
-- Execute this SQL file to create all jobs and societies
-- Make sure to run this BEFORE starting the resource

-- ==========================================
-- JOBS
-- ==========================================

INSERT INTO `jobs` (`name`, `label`) VALUES
('burgershot', 'Burger Shot'),
('pizzathis', 'Pizza This'),
('upnatom', 'Up\'N Atom Burger'),
('pops', 'Pop\'s Diner'),
('beans', 'Beans Coffee'),
('unicorn', 'Unicorn Night Club')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`);

-- ==========================================
-- JOB GRADES (6 grades per job)
-- ==========================================

-- Burger Shot Grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('burgershot', 0, 'trainee', 'Stagiaire', 250, '{}', '{}'),
('burgershot', 1, 'employee', 'Employé', 350, '{}', '{}'),
('burgershot', 2, 'cashier', 'Caissier', 400, '{}', '{}'),
('burgershot', 3, 'cook', 'Cuisinier', 450, '{}', '{}'),
('burgershot', 4, 'manager', 'Manager', 550, '{}', '{}'),
('burgershot', 5, 'boss', 'Patron', 700, '{}', '{}')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `salary`=VALUES(`salary`);

-- Pizza This Grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('pizzathis', 0, 'trainee', 'Stagiaire', 250, '{}', '{}'),
('pizzathis', 1, 'delivery', 'Livreur', 350, '{}', '{}'),
('pizzathis', 2, 'pizzaiolo', 'Pizzaïolo', 400, '{}', '{}'),
('pizzathis', 3, 'chef', 'Chef Cuisinier', 500, '{}', '{}'),
('pizzathis', 4, 'manager', 'Manager', 600, '{}', '{}'),
('pizzathis', 5, 'boss', 'Patron', 750, '{}', '{}')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `salary`=VALUES(`salary`);

-- Up'N Atom Burger Grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('upnatom', 0, 'trainee', 'Stagiaire', 250, '{}', '{}'),
('upnatom', 1, 'employee', 'Employé', 350, '{}', '{}'),
('upnatom', 2, 'cashier', 'Caissier', 400, '{}', '{}'),
('upnatom', 3, 'cook', 'Cuisinier', 450, '{}', '{}'),
('upnatom', 4, 'manager', 'Manager', 550, '{}', '{}'),
('upnatom', 5, 'boss', 'Patron', 700, '{}', '{}')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `salary`=VALUES(`salary`);

-- Pop's Diner Grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('pops', 0, 'trainee', 'Stagiaire', 250, '{}', '{}'),
('pops', 1, 'waiter', 'Serveur', 350, '{}', '{}'),
('pops', 2, 'cook', 'Cuisinier', 450, '{}', '{}'),
('pops', 3, 'chef', 'Chef', 500, '{}', '{}'),
('pops', 4, 'manager', 'Manager', 600, '{}', '{}'),
('pops', 5, 'boss', 'Propriétaire', 750, '{}', '{}')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `salary`=VALUES(`salary`);

-- Beans Coffee Grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('beans', 0, 'trainee', 'Stagiaire', 200, '{}', '{}'),
('beans', 1, 'barista', 'Barista', 300, '{}', '{}'),
('beans', 2, 'senior_barista', 'Barista Senior', 350, '{}', '{}'),
('beans', 3, 'shift_leader', 'Chef d\'Équipe', 400, '{}', '{}'),
('beans', 4, 'manager', 'Manager', 500, '{}', '{}'),
('beans', 5, 'boss', 'Propriétaire', 650, '{}', '{}')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `salary`=VALUES(`salary`);

-- Unicorn Night Club Grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('unicorn', 0, 'trainee', 'Stagiaire', 300, '{}', '{}'),
('unicorn', 1, 'dancer', 'Danseur/Danseuse', 400, '{}', '{}'),
('unicorn', 2, 'bartender', 'Barman', 450, '{}', '{}'),
('unicorn', 3, 'vip_host', 'Hôte VIP', 500, '{}', '{}'),
('unicorn', 4, 'manager', 'Manager', 600, '{}', '{}'),
('unicorn', 5, 'boss', 'Propriétaire', 800, '{}', '{}')
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`), `salary`=VALUES(`salary`);

-- ==========================================
-- SOCIETIES (addon_account)
-- ==========================================

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_burgershot', 'Burger Shot', 1),
('society_pizzathis', 'Pizza This', 1),
('society_upnatom', 'Up\'N Atom Burger', 1),
('society_pops', 'Pop\'s Diner', 1),
('society_beans', 'Beans Coffee', 1),
('society_unicorn', 'Unicorn Night Club', 1)
ON DUPLICATE KEY UPDATE `label`=VALUES(`label`);

-- Initialize society accounts with 0 money
INSERT INTO `addon_account_data` (`account_name`, `money`, `owner`) VALUES
('society_burgershot', 0, NULL),
('society_pizzathis', 0, NULL),
('society_upnatom', 0, NULL),
('society_pops', 0, NULL),
('society_beans', 0, NULL),
('society_unicorn', 0, NULL)
ON DUPLICATE KEY UPDATE `money`=VALUES(`money`);

-- ==========================================
-- SUMMARY
-- ==========================================
--
-- Jobs Created:
-- - burgershot (Burger Shot) - 6 grades
-- - pizzathis (Pizza This) - 6 grades
-- - upnatom (Up'N Atom Burger) - 6 grades
-- - pops (Pop's Diner) - 6 grades
-- - beans (Beans Coffee) - 6 grades
-- - unicorn (Unicorn Night Club) - 6 grades
--
-- Each job has 6 grades (0-5):
-- Grade 0: Stagiaire/Trainee
-- Grade 1: Employee variant
-- Grade 2: Specialized role
-- Grade 3: Senior/Chef role
-- Grade 4: Manager
-- Grade 5: Boss/Propriétaire
--
-- Societies created with prefix 'society_'
-- All societies start with $0
--
