# ZRestaurants - Advanced Restaurant System for FiveM

A comprehensive restaurant management system for FiveM with ESX and OX dependencies.

## Features

### Core Features
- ✅ **Multiple Restaurants** - Create unlimited restaurants via config files
- ✅ **Secure Functions** - Server-side callbacks and secure exports
- ✅ **Calories System** - Realistic hunger/thirst system (100 calories = 10%)
- ✅ **Custom Recipes** - Restaurant owners can create recipes via management menu
- ✅ **Configurable Limits** - Set max ingredients, recipes, and prices per restaurant

### Management
- ✅ **Management Menu** - Full boss menu for restaurant owners
- ✅ **Recipe Management** - Create, edit, and delete recipes
- ✅ **Menu Items** - Manage items and stock for offline shop
- ✅ **Employee Management** - Hire, fire, and manage employees
- ✅ **Society Integration** - Full esx_society integration with money management

### Gameplay
- ✅ **Crafting Stations** - Multiple station types with animations
- ✅ **Storage System** - Stashes and trays with ox_inventory
- ✅ **Cash Register** - Charge customers with invoices
- ✅ **Delivery System** - Delivery missions with cooldown
- ✅ **Offline Shop** - Sell items when no employees are online
- ✅ **Garage System** - Spawn and store restaurant vehicles
- ✅ **Drive Thru** - Order and pickup system for customers
- ✅ **Music System** - Play music in restaurant zones (xsound compatible)
- ✅ **Chairs** - Sitting system for customers
- ✅ **Props & Peds** - Spawn decorative elements

## Dependencies

**Required:**
- [es_extended](https://github.com/esx-framework/esx_core)
- [ox_lib](https://github.com/overextended/ox_lib)
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_target](https://github.com/overextended/ox_target) or interact
- [esx_society](https://github.com/esx-framework/esx_society)
- [oxmysql](https://github.com/overextended/oxmysql)

**Optional:**
- [xsound](https://github.com/Xogy/xsound) - For music system

## Installation

1. **Download** the resource and place it in your `resources` folder

2. **Import SQL** - Execute the SQL file:
   ```bash
   mysql -u your_user -p your_database < sql/install.sql
   ```

3. **Configure** your restaurants in `config/restaurants.lua`

4. **Add items** to your `ox_inventory/data/items.lua`:
   - Add all ingredients from `config/ingredients.lua`
   - Add all recipe items you want to use

5. **Add jobs** to your database:
   ```sql
   INSERT INTO `jobs` (`name`, `label`) VALUES
   ('burgershot', 'Burger Shot'),
   ('pizzathis', 'Pizza This');
   ```

6. **Add societies** to your database:
   ```sql
   INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
   ('society_burgershot', 'Burger Shot', 1),
   ('society_pizzathis', 'Pizza This', 1);
   ```

7. **Start** the resource in your `server.cfg`:
   ```
   ensure zrestaurants
   ```

## Configuration

### Main Config (`config/config.lua`)
- Framework settings
- Target system (ox_target or interact)
- Calories system
- Recipe limits
- Feature toggles
- Permissions per job grade

### Restaurants (`config/restaurants.lua`)
- Restaurant locations and blips
- Feature toggles per restaurant
- Stashes, trays, stations
- Registers, garage, drive-thru
- Chairs, peds, props
- Music zones

### Ingredients (`config/ingredients.lua`)
- Base ingredients with nutritional values
- Pre-configured recipes
- Calories, hunger, thirst values
- Buffs system

### Stations (`config/stations.lua`)
- Station types (prepare, cook, grill, fryer, drink, pack)
- Animations per station
- Allowed recipe types

## Usage

### For Restaurant Owners (Boss)
1. Access the **Management Menu** at the designated location
2. Create custom recipes with ingredients
3. Manage menu items and stock for offline shop
4. Hire/fire employees and manage grades
5. Withdraw/deposit society money

### For Employees
1. Use **Crafting Stations** to prepare food
2. Access **Stashes** for ingredients
3. Place items on **Trays** for customers
4. Use **Cash Register** to charge customers
5. Start **Deliveries** for extra income
6. Take **Vehicles** from garage

### For Customers
1. Order from **Cash Register** (employee required)
2. Buy from **Offline Shop** (when no employees online)
3. Use **Drive Thru** for quick orders
4. Sit on **Chairs** to enjoy your meal

## Permissions

Configure in `config/config.lua`:

```lua
Config.Permissions = {
    managementMenu = {'boss'},
    createRecipes = {'boss', 'manager'},
    editMenu = {'boss', 'manager'},
    accessStash = {'boss', 'manager', 'cook', 'employee'},
    useRegister = {'boss', 'manager', 'cashier', 'employee'},
    delivery = {'employee', 'delivery'},
    garage = {'boss', 'manager', 'employee'}
}
```

## Adding New Restaurants

1. Copy a restaurant template in `config/restaurants.lua`
2. Change coordinates, job name, and features
3. Add the job to your database
4. Add the society account
5. Restart the resource

Example:
```lua
Restaurants['tacoshop'] = {
    label = 'Taco Shop',
    job = 'tacoshop',
    blip = { ... },
    features = { ... },
    -- ... rest of config
}
```

## Exports

### Client
```lua
-- Check if player is in restaurant job
local inJob = exports.zrestaurants:IsPlayerInRestaurant(jobName)

-- Get restaurant data
local restaurant = exports.zrestaurants:GetRestaurant(restaurantKey)
```

### Server
```lua
-- Get recipes for restaurant
local recipes = exports.zrestaurants:GetRecipes(restaurantKey)

-- Add menu stock
exports.zrestaurants:AddStock(restaurantKey, itemName, quantity)
```

## Support

For support, please open an issue on GitHub or contact the author.

## License

This resource is provided as-is. Feel free to modify for your server.

## Credits

- **Author:** ZaK2BaK5906
- **Framework:** ESX
- **Libraries:** ox_lib, ox_inventory, ox_target

---

**Version:** 1.0.0
**Last Updated:** 2025-11-28
