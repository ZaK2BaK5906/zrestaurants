Ingredients = {}

-- Base Ingredients
-- These are the items that can be used in recipes
-- Make sure these items exist in your ox_inventory/data/items.lua

Ingredients = {
    -- Meats
    ['raw_meat'] = {
        label = 'Raw Meat',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['cooked_meat'] = {
        label = 'Cooked Meat',
        hunger = 30,
        thirst = 0,
        calories = 300,
        buffs = {},
        category = 'meat'
    },
    ['raw_chicken'] = {
        label = 'Raw Chicken',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['cooked_chicken'] = {
        label = 'Cooked Chicken',
        hunger = 25,
        thirst = 0,
        calories = 250,
        buffs = {},
        category = 'meat'
    },
    ['bacon'] = {
        label = 'Bacon',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'meat'
    },

    -- Vegetables
    ['lettuce'] = {
        label = 'Lettuce',
        hunger = 5,
        thirst = 5,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['tomato'] = {
        label = 'Tomato',
        hunger = 5,
        thirst = 10,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['onion'] = {
        label = 'Onion',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['pickles'] = {
        label = 'Pickles',
        hunger = 5,
        thirst = 5,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['cheese'] = {
        label = 'Cheese',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'dairy'
    },

    -- Bread & Dough
    ['bread'] = {
        label = 'Bread',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'bread'
    },
    ['burger_bun'] = {
        label = 'Burger Bun',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'bread'
    },
    ['pizza_dough'] = {
        label = 'Pizza Dough',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'dough'
    },

    -- Sauces & Condiments
    ['ketchup'] = {
        label = 'Ketchup',
        hunger = 2,
        thirst = 0,
        calories = 20,
        buffs = {},
        category = 'sauce'
    },
    ['mustard'] = {
        label = 'Mustard',
        hunger = 2,
        thirst = 0,
        calories = 20,
        buffs = {},
        category = 'sauce'
    },
    ['mayo'] = {
        label = 'Mayonnaise',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
    },
    ['tomato_sauce'] = {
        label = 'Tomato Sauce',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
    },

    -- Frozen Foods
    ['frozen_fries'] = {
        label = 'Frozen Fries',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },
    ['frozen_nuggets'] = {
        label = 'Frozen Nuggets',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },

    -- Cooked Items (for recipes)
    ['fries'] = {
        label = 'Fries',
        hunger = 20,
        thirst = 0,
        calories = 200,
        buffs = {},
        category = 'sides'
    },
    ['nuggets'] = {
        label = 'Chicken Nuggets',
        hunger = 25,
        thirst = 0,
        calories = 250,
        buffs = {},
        category = 'sides'
    },

    -- Drinks Base
    ['water_bottle'] = {
        label = 'Water Bottle',
        hunger = 0,
        thirst = 50,
        calories = 0,
        buffs = {},
        category = 'drink'
    },
    ['coffee_beans'] = {
        label = 'Coffee Beans',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },
    ['milk'] = {
        label = 'Milk',
        hunger = 5,
        thirst = 20,
        calories = 50,
        buffs = {},
        category = 'dairy'
    },
    ['ice'] = {
        label = 'Ice',
        hunger = 0,
        thirst = 5,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },
    ['soda_syrup'] = {
        label = 'Soda Syrup',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },

    -- Special Ingredients
    ['sugar'] = {
        label = 'Sugar',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'special'
    },
    ['salt'] = {
        label = 'Salt',
        hunger = 0,
        thirst = -5,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['pepper'] = {
        label = 'Pepper',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['oil'] = {
        label = 'Cooking Oil',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    }
}

-- Prepared Recipes (Example recipes that come with the script)
-- Restaurant owners can create their own recipes via the management menu
PreparedRecipes = {
    -- Burger Shot Recipes
    burgershot = {
        ['bs_burger'] = {
            label = 'Burger Shot Burger',
            image = 'bs_burger.png',
            price = 15,
            ingredients = {
                {item = 'burger_bun', amount = 1},
                {item = 'cooked_meat', amount = 1},
                {item = 'cheese', amount = 1},
                {item = 'lettuce', amount = 1},
                {item = 'tomato', amount = 1}
            },
            station = 'prepare',
            time = 5000, -- milliseconds
            hunger = 60,
            thirst = 0,
            calories = 600,
            buffs = {}
        },
        ['bs_fries'] = {
            label = 'Burger Shot Fries',
            image = 'bs_fries.png',
            price = 5,
            ingredients = {
                {item = 'frozen_fries', amount = 1},
                {item = 'salt', amount = 1},
                {item = 'oil', amount = 1}
            },
            station = 'fryer',
            time = 3000,
            hunger = 20,
            thirst = 0,
            calories = 200,
            buffs = {}
        },
        ['bs_soda'] = {
            label = 'Burger Shot Soda',
            image = 'bs_soda.png',
            price = 3,
            ingredients = {
                {item = 'soda_syrup', amount = 1},
                {item = 'water_bottle', amount = 1},
                {item = 'ice', amount = 1}
            },
            station = 'drink',
            time = 2000,
            hunger = 0,
            thirst = 40,
            calories = 100,
            buffs = {}
        }
    },

    -- Pizza This Recipes
    pizzathis = {
        ['pizza_margherita'] = {
            label = 'Margherita Pizza',
            image = 'pizza_margherita.png',
            price = 20,
            ingredients = {
                {item = 'pizza_dough', amount = 1},
                {item = 'tomato_sauce', amount = 1},
                {item = 'cheese', amount = 2},
                {item = 'tomato', amount = 1}
            },
            station = 'cook',
            time = 8000,
            hunger = 70,
            thirst = 0,
            calories = 700,
            buffs = {}
        },
        ['pizza_pepperoni'] = {
            label = 'Pepperoni Pizza',
            image = 'pizza_pepperoni.png',
            price = 25,
            ingredients = {
                {item = 'pizza_dough', amount = 1},
                {item = 'tomato_sauce', amount = 1},
                {item = 'cheese', amount = 2},
                {item = 'cooked_meat', amount = 2}
            },
            station = 'cook',
            time = 8000,
            hunger = 80,
            thirst = 0,
            calories = 800,
            buffs = {}
        }
    }
}

return Ingredients, PreparedRecipes
