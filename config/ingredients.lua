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
    },

    -- Alcohol Ingredients
    ['vodka_bottle'] = {
        label = 'Vodka Bottle',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['whiskey_bottle'] = {
        label = 'Whiskey Bottle',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['beer_bottle'] = {
        label = 'Beer Bottle',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['tequila_bottle'] = {
        label = 'Tequila Bottle',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['rum_bottle'] = {
        label = 'Rum Bottle',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['lime'] = {
        label = 'Lime',
        hunger = 2,
        thirst = 5,
        calories = 20,
        buffs = {},
        category = 'fruit'
    },
    ['mint'] = {
        label = 'Mint',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'herb'
    },

    -- Coffee Ingredients
    ['espresso_shot'] = {
        label = 'Espresso Shot',
        hunger = 0,
        thirst = 10,
        calories = 5,
        buffs = {},
        category = 'coffee'
    },
    ['whipped_cream'] = {
        label = 'Whipped Cream',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'dairy'
    },
    ['chocolate_syrup'] = {
        label = 'Chocolate Syrup',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },
    ['caramel_syrup'] = {
        label = 'Caramel Syrup',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },

    -- Diner Ingredients
    ['eggs'] = {
        label = 'Eggs',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'protein'
    },
    ['pancake_mix'] = {
        label = 'Pancake Mix',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'baking'
    },
    ['maple_syrup'] = {
        label = 'Maple Syrup',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },
    ['hot_dog_bun'] = {
        label = 'Hot Dog Bun',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'bread'
    },
    ['sausage'] = {
        label = 'Sausage',
        hunger = 20,
        thirst = 0,
        calories = 200,
        buffs = {},
        category = 'meat'
    },
    ['apple'] = {
        label = 'Apple',
        hunger = 10,
        thirst = 5,
        calories = 100,
        buffs = {},
        category = 'fruit'
    },
    ['pie_crust'] = {
        label = 'Pie Crust',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'baking'
    },

    -- Fast Food Ingredients
    ['chicken_wings_raw'] = {
        label = 'Raw Chicken Wings',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['onion_rings_frozen'] = {
        label = 'Frozen Onion Rings',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },
    ['bbq_sauce'] = {
        label = 'BBQ Sauce',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
    },
    ['ranch_sauce'] = {
        label = 'Ranch Sauce',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
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
    },

    -- Vanilla Unicorn (Bar)
    unicorn = {
        ['unicorn_vodka'] = {
            label = 'Vodka Glass',
            image = 'vodka.png',
            price = 12,
            ingredients = {
                {item = 'vodka_bottle', amount = 1},
                {item = 'ice', amount = 1}
            },
            station = 'drink',
            time = 2000,
            hunger = 0,
            thirst = 15,
            calories = 50,
            buffs = {}
        },
        ['unicorn_whiskey'] = {
            label = 'Whiskey Glass',
            image = 'whiskey.png',
            price = 15,
            ingredients = {
                {item = 'whiskey_bottle', amount = 1},
                {item = 'ice', amount = 1}
            },
            station = 'drink',
            time = 2000,
            hunger = 0,
            thirst = 15,
            calories = 60,
            buffs = {}
        },
        ['unicorn_beer'] = {
            label = 'Cold Beer',
            image = 'beer.png',
            price = 8,
            ingredients = {
                {item = 'beer_bottle', amount = 1}
            },
            station = 'prepare',
            time = 1000,
            hunger = 0,
            thirst = 20,
            calories = 80,
            buffs = {}
        },
        ['unicorn_cocktail'] = {
            label = 'Unicorn Cocktail',
            image = 'cocktail.png',
            price = 18,
            ingredients = {
                {item = 'vodka_bottle', amount = 1},
                {item = 'lime', amount = 1},
                {item = 'sugar', amount = 1},
                {item = 'ice', amount = 1}
            },
            station = 'drink',
            time = 3000,
            hunger = 5,
            thirst = 25,
            calories = 120,
            buffs = {}
        },
        ['unicorn_tequila'] = {
            label = 'Tequila Shot',
            image = 'tequila.png',
            price = 10,
            ingredients = {
                {item = 'tequila_bottle', amount = 1},
                {item = 'lime', amount = 1},
                {item = 'salt', amount = 1}
            },
            station = 'drink',
            time = 2000,
            hunger = 0,
            thirst = 10,
            calories = 40,
            buffs = {}
        }
    },

    -- Up'N Atom
    upnatom = {
        ['atom_burger'] = {
            label = 'Atom Burger',
            image = 'atom_burger.png',
            price = 18,
            ingredients = {
                {item = 'burger_bun', amount = 1},
                {item = 'cooked_meat', amount = 2},
                {item = 'cheese', amount = 2},
                {item = 'lettuce', amount = 1},
                {item = 'tomato', amount = 1},
                {item = 'pickles', amount = 1}
            },
            station = 'prepare',
            time = 5000,
            hunger = 70,
            thirst = 0,
            calories = 700,
            buffs = {}
        },
        ['atom_fries'] = {
            label = 'Atom Fries',
            image = 'atom_fries.png',
            price = 6,
            ingredients = {
                {item = 'frozen_fries', amount = 1},
                {item = 'salt', amount = 1},
                {item = 'oil', amount = 1}
            },
            station = 'fryer',
            time = 3000,
            hunger = 25,
            thirst = 0,
            calories = 250,
            buffs = {}
        },
        ['atom_wings'] = {
            label = 'Chicken Wings',
            image = 'wings.png',
            price = 14,
            ingredients = {
                {item = 'chicken_wings_raw', amount = 1},
                {item = 'bbq_sauce', amount = 1},
                {item = 'oil', amount = 1}
            },
            station = 'fryer',
            time = 4000,
            hunger = 40,
            thirst = 0,
            calories = 400,
            buffs = {}
        },
        ['atom_onion_rings'] = {
            label = 'Onion Rings',
            image = 'onion_rings.png',
            price = 7,
            ingredients = {
                {item = 'onion_rings_frozen', amount = 1},
                {item = 'ranch_sauce', amount = 1},
                {item = 'oil', amount = 1}
            },
            station = 'fryer',
            time = 3000,
            hunger = 20,
            thirst = 0,
            calories = 200,
            buffs = {}
        },
        ['atom_milkshake'] = {
            label = 'Milkshake',
            image = 'milkshake.png',
            price = 8,
            ingredients = {
                {item = 'milk', amount = 1},
                {item = 'ice', amount = 1},
                {item = 'sugar', amount = 1},
                {item = 'whipped_cream', amount = 1}
            },
            station = 'drink',
            time = 3000,
            hunger = 15,
            thirst = 30,
            calories = 300,
            buffs = {}
        }
    },

    -- Pop's Diner
    popsdiner = {
        ['diner_breakfast'] = {
            label = 'Classic Breakfast',
            image = 'breakfast.png',
            price = 22,
            ingredients = {
                {item = 'eggs', amount = 2},
                {item = 'bacon', amount = 2},
                {item = 'bread', amount = 1},
                {item = 'salt', amount = 1},
                {item = 'pepper', amount = 1}
            },
            station = 'grill',
            time = 6000,
            hunger = 80,
            thirst = 0,
            calories = 800,
            buffs = {}
        },
        ['diner_pancakes'] = {
            label = 'Pancakes Stack',
            image = 'pancakes.png',
            price = 16,
            ingredients = {
                {item = 'pancake_mix', amount = 1},
                {item = 'eggs', amount = 1},
                {item = 'milk', amount = 1},
                {item = 'maple_syrup', amount = 1}
            },
            station = 'cook',
            time = 5000,
            hunger = 60,
            thirst = 0,
            calories = 600,
            buffs = {}
        },
        ['diner_club_sandwich'] = {
            label = 'Club Sandwich',
            image = 'club_sandwich.png',
            price = 18,
            ingredients = {
                {item = 'bread', amount = 2},
                {item = 'cooked_chicken', amount = 1},
                {item = 'bacon', amount = 1},
                {item = 'lettuce', amount = 1},
                {item = 'tomato', amount = 1},
                {item = 'mayo', amount = 1}
            },
            station = 'prepare',
            time = 4000,
            hunger = 65,
            thirst = 0,
            calories = 650,
            buffs = {}
        },
        ['diner_apple_pie'] = {
            label = 'Apple Pie Slice',
            image = 'apple_pie.png',
            price = 12,
            ingredients = {
                {item = 'pie_crust', amount = 1},
                {item = 'apple', amount = 2},
                {item = 'sugar', amount = 1}
            },
            station = 'cook',
            time = 7000,
            hunger = 40,
            thirst = 0,
            calories = 400,
            buffs = {}
        },
        ['diner_hotdog'] = {
            label = 'Hot Dog',
            image = 'hotdog.png',
            price = 10,
            ingredients = {
                {item = 'hot_dog_bun', amount = 1},
                {item = 'sausage', amount = 1},
                {item = 'ketchup', amount = 1},
                {item = 'mustard', amount = 1}
            },
            station = 'grill',
            time = 3000,
            hunger = 45,
            thirst = 0,
            calories = 450,
            buffs = {}
        }
    },

    -- Bean Machine Coffee
    beanmachine = {
        ['bean_espresso'] = {
            label = 'Espresso',
            image = 'espresso.png',
            price = 5,
            ingredients = {
                {item = 'coffee_beans', amount = 1}
            },
            station = 'drink',
            time = 2000,
            hunger = 0,
            thirst = 15,
            calories = 10,
            buffs = {}
        },
        ['bean_cappuccino'] = {
            label = 'Cappuccino',
            image = 'cappuccino.png',
            price = 8,
            ingredients = {
                {item = 'espresso_shot', amount = 1},
                {item = 'milk', amount = 1},
                {item = 'sugar', amount = 1}
            },
            station = 'drink',
            time = 3000,
            hunger = 5,
            thirst = 25,
            calories = 100,
            buffs = {}
        },
        ['bean_latte'] = {
            label = 'Caffe Latte',
            image = 'latte.png',
            price = 9,
            ingredients = {
                {item = 'espresso_shot', amount = 2},
                {item = 'milk', amount = 1},
                {item = 'caramel_syrup', amount = 1}
            },
            station = 'drink',
            time = 3000,
            hunger = 10,
            thirst = 30,
            calories = 150,
            buffs = {}
        },
        ['bean_mocha'] = {
            label = 'Mocha',
            image = 'mocha.png',
            price = 10,
            ingredients = {
                {item = 'espresso_shot', amount = 1},
                {item = 'milk', amount = 1},
                {item = 'chocolate_syrup', amount = 1},
                {item = 'whipped_cream', amount = 1}
            },
            station = 'drink',
            time = 4000,
            hunger = 15,
            thirst = 25,
            calories = 200,
            buffs = {}
        },
        ['bean_iced_coffee'] = {
            label = 'Iced Coffee',
            image = 'iced_coffee.png',
            price = 7,
            ingredients = {
                {item = 'espresso_shot', amount = 1},
                {item = 'milk', amount = 1},
                {item = 'ice', amount = 2},
                {item = 'sugar', amount = 1}
            },
            station = 'drink',
            time = 2000,
            hunger = 5,
            thirst = 35,
            calories = 120,
            buffs = {}
        }
    }
}

return Ingredients, PreparedRecipes
