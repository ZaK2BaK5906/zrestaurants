Ingredients = {}

-- Base Ingredients (100 ingrédients en français)
-- Ces items doivent exister dans votre ox_inventory/data/items.lua

Ingredients = {
    -- Viandes (Meats)
    ['raw_meat'] = {
        label = 'Viande Crue',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['cooked_meat'] = {
        label = 'Viande Cuite',
        hunger = 30,
        thirst = 0,
        calories = 300,
        buffs = {},
        category = 'meat'
    },
    ['raw_chicken'] = {
        label = 'Poulet Cru',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['cooked_chicken'] = {
        label = 'Poulet Cuit',
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
    ['raw_fish'] = {
        label = 'Poisson Cru',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['cooked_fish'] = {
        label = 'Poisson Cuit',
        hunger = 20,
        thirst = 0,
        calories = 200,
        buffs = {},
        category = 'meat'
    },
    ['raw_pork'] = {
        label = 'Porc Cru',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },
    ['cooked_pork'] = {
        label = 'Porc Cuit',
        hunger = 28,
        thirst = 0,
        calories = 280,
        buffs = {},
        category = 'meat'
    },
    ['ground_beef'] = {
        label = 'Bœuf Haché',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'meat'
    },

    -- Légumes (Vegetables)
    ['lettuce'] = {
        label = 'Laitue',
        hunger = 5,
        thirst = 5,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['tomato'] = {
        label = 'Tomate',
        hunger = 5,
        thirst = 10,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['onion'] = {
        label = 'Oignon',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['pickles'] = {
        label = 'Cornichons',
        hunger = 5,
        thirst = 5,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['potato'] = {
        label = 'Pomme de Terre',
        hunger = 8,
        thirst = 0,
        calories = 80,
        buffs = {},
        category = 'vegetable'
    },
    ['carrot'] = {
        label = 'Carotte',
        hunger = 6,
        thirst = 5,
        calories = 60,
        buffs = {},
        category = 'vegetable'
    },
    ['cucumber'] = {
        label = 'Concombre',
        hunger = 4,
        thirst = 8,
        calories = 40,
        buffs = {},
        category = 'vegetable'
    },
    ['pepper'] = {
        label = 'Poivron',
        hunger = 5,
        thirst = 5,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },
    ['mushroom'] = {
        label = 'Champignon',
        hunger = 4,
        thirst = 0,
        calories = 40,
        buffs = {},
        category = 'vegetable'
    },
    ['spinach'] = {
        label = 'Épinards',
        hunger = 3,
        thirst = 5,
        calories = 30,
        buffs = {},
        category = 'vegetable'
    },
    ['corn'] = {
        label = 'Maïs',
        hunger = 7,
        thirst = 0,
        calories = 70,
        buffs = {},
        category = 'vegetable'
    },
    ['broccoli'] = {
        label = 'Brocoli',
        hunger = 5,
        thirst = 3,
        calories = 50,
        buffs = {},
        category = 'vegetable'
    },

    -- Produits Laitiers (Dairy)
    ['cheese'] = {
        label = 'Fromage',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'dairy'
    },
    ['milk'] = {
        label = 'Lait',
        hunger = 5,
        thirst = 20,
        calories = 50,
        buffs = {},
        category = 'dairy'
    },
    ['butter'] = {
        label = 'Beurre',
        hunger = 8,
        thirst = 0,
        calories = 80,
        buffs = {},
        category = 'dairy'
    },
    ['cream'] = {
        label = 'Crème',
        hunger = 6,
        thirst = 0,
        calories = 60,
        buffs = {},
        category = 'dairy'
    },
    ['whipped_cream'] = {
        label = 'Crème Fouettée',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'dairy'
    },
    ['yogurt'] = {
        label = 'Yaourt',
        hunger = 8,
        thirst = 10,
        calories = 80,
        buffs = {},
        category = 'dairy'
    },

    -- Pain & Pâte (Bread & Dough)
    ['bread'] = {
        label = 'Pain',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'bread'
    },
    ['burger_bun'] = {
        label = 'Pain à Burger',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'bread'
    },
    ['pizza_dough'] = {
        label = 'Pâte à Pizza',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'dough'
    },
    ['hot_dog_bun'] = {
        label = 'Pain à Hot Dog',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'bread'
    },
    ['croissant'] = {
        label = 'Croissant',
        hunger = 12,
        thirst = 0,
        calories = 120,
        buffs = {},
        category = 'bread'
    },
    ['baguette'] = {
        label = 'Baguette',
        hunger = 18,
        thirst = 0,
        calories = 180,
        buffs = {},
        category = 'bread'
    },
    ['tortilla'] = {
        label = 'Tortilla',
        hunger = 8,
        thirst = 0,
        calories = 80,
        buffs = {},
        category = 'bread'
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
        label = 'Moutarde',
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
        label = 'Sauce Tomate',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
    },
    ['bbq_sauce'] = {
        label = 'Sauce BBQ',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
    },
    ['ranch_sauce'] = {
        label = 'Sauce Ranch',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'sauce'
    },
    ['hot_sauce'] = {
        label = 'Sauce Piquante',
        hunger = 1,
        thirst = -3,
        calories = 10,
        buffs = {},
        category = 'sauce'
    },
    ['soy_sauce'] = {
        label = 'Sauce Soja',
        hunger = 2,
        thirst = -2,
        calories = 20,
        buffs = {},
        category = 'sauce'
    },

    -- Surgelés (Frozen Foods)
    ['frozen_fries'] = {
        label = 'Frites Surgelées',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },
    ['frozen_nuggets'] = {
        label = 'Nuggets Surgelés',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },
    ['chicken_wings_raw'] = {
        label = 'Ailes de Poulet Crues',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },
    ['onion_rings_frozen'] = {
        label = 'Rondelles d\'Oignon Surgelées',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },
    ['frozen_pizza'] = {
        label = 'Pizza Surgelée',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'frozen'
    },

    -- Aliments Cuisinés (Cooked Items)
    ['fries'] = {
        label = 'Frites',
        hunger = 20,
        thirst = 0,
        calories = 200,
        buffs = {},
        category = 'sides'
    },
    ['nuggets'] = {
        label = 'Nuggets de Poulet',
        hunger = 25,
        thirst = 0,
        calories = 250,
        buffs = {},
        category = 'sides'
    },

    -- Boissons (Drinks Base)
    ['water_bottle'] = {
        label = 'Bouteille d\'Eau',
        hunger = 0,
        thirst = 50,
        calories = 0,
        buffs = {},
        category = 'drink'
    },
    ['coffee_beans'] = {
        label = 'Grains de Café',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },
    ['ice'] = {
        label = 'Glace',
        hunger = 0,
        thirst = 5,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },
    ['soda_syrup'] = {
        label = 'Sirop de Soda',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },
    ['tea_leaves'] = {
        label = 'Feuilles de Thé',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'drink_base'
    },
    ['juice'] = {
        label = 'Jus de Fruits',
        hunger = 5,
        thirst = 30,
        calories = 50,
        buffs = {},
        category = 'drink'
    },

    -- Ingrédients Spéciaux (Special Ingredients)
    ['sugar'] = {
        label = 'Sucre',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'special'
    },
    ['salt'] = {
        label = 'Sel',
        hunger = 0,
        thirst = -5,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['pepper'] = {
        label = 'Poivre',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['oil'] = {
        label = 'Huile de Cuisson',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['flour'] = {
        label = 'Farine',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['yeast'] = {
        label = 'Levure',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['vanilla'] = {
        label = 'Vanille',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },
    ['cinnamon'] = {
        label = 'Cannelle',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'special'
    },

    -- Alcool (Alcohol Ingredients)
    ['vodka_bottle'] = {
        label = 'Bouteille de Vodka',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['whiskey_bottle'] = {
        label = 'Bouteille de Whisky',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['beer_bottle'] = {
        label = 'Bouteille de Bière',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['tequila_bottle'] = {
        label = 'Bouteille de Tequila',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['rum_bottle'] = {
        label = 'Bouteille de Rhum',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['wine_bottle'] = {
        label = 'Bouteille de Vin',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['champagne_bottle'] = {
        label = 'Bouteille de Champagne',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },
    ['gin_bottle'] = {
        label = 'Bouteille de Gin',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'alcohol'
    },

    -- Fruits
    ['lime'] = {
        label = 'Citron Vert',
        hunger = 2,
        thirst = 5,
        calories = 20,
        buffs = {},
        category = 'fruit'
    },
    ['lemon'] = {
        label = 'Citron',
        hunger = 2,
        thirst = 5,
        calories = 20,
        buffs = {},
        category = 'fruit'
    },
    ['apple'] = {
        label = 'Pomme',
        hunger = 10,
        thirst = 5,
        calories = 100,
        buffs = {},
        category = 'fruit'
    },
    ['banana'] = {
        label = 'Banane',
        hunger = 12,
        thirst = 3,
        calories = 120,
        buffs = {},
        category = 'fruit'
    },
    ['strawberry'] = {
        label = 'Fraise',
        hunger = 5,
        thirst = 4,
        calories = 50,
        buffs = {},
        category = 'fruit'
    },
    ['orange'] = {
        label = 'Orange',
        hunger = 8,
        thirst = 10,
        calories = 80,
        buffs = {},
        category = 'fruit'
    },
    ['grape'] = {
        label = 'Raisin',
        hunger = 6,
        thirst = 8,
        calories = 60,
        buffs = {},
        category = 'fruit'
    },
    ['watermelon'] = {
        label = 'Pastèque',
        hunger = 10,
        thirst = 20,
        calories = 100,
        buffs = {},
        category = 'fruit'
    },

    -- Herbes & Épices (Herbs & Spices)
    ['mint'] = {
        label = 'Menthe',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'herb'
    },
    ['basil'] = {
        label = 'Basilic',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'herb'
    },
    ['oregano'] = {
        label = 'Origan',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'herb'
    },
    ['parsley'] = {
        label = 'Persil',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'herb'
    },
    ['garlic'] = {
        label = 'Ail',
        hunger = 1,
        thirst = 0,
        calories = 10,
        buffs = {},
        category = 'herb'
    },

    -- Café (Coffee Ingredients)
    ['espresso_shot'] = {
        label = 'Shot d\'Espresso',
        hunger = 0,
        thirst = 10,
        calories = 5,
        buffs = {},
        category = 'coffee'
    },
    ['chocolate_syrup'] = {
        label = 'Sirop de Chocolat',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },
    ['caramel_syrup'] = {
        label = 'Sirop de Caramel',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },
    ['hazelnut_syrup'] = {
        label = 'Sirop de Noisette',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },

    -- Diner Ingredients
    ['eggs'] = {
        label = 'Œufs',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'protein'
    },
    ['pancake_mix'] = {
        label = 'Préparation à Crêpes',
        hunger = 0,
        thirst = 0,
        calories = 0,
        buffs = {},
        category = 'baking'
    },
    ['maple_syrup'] = {
        label = 'Sirop d\'Érable',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },
    ['sausage'] = {
        label = 'Saucisse',
        hunger = 20,
        thirst = 0,
        calories = 200,
        buffs = {},
        category = 'meat'
    },
    ['pie_crust'] = {
        label = 'Pâte à Tarte',
        hunger = 5,
        thirst = 0,
        calories = 50,
        buffs = {},
        category = 'baking'
    },
    ['honey'] = {
        label = 'Miel',
        hunger = 8,
        thirst = 0,
        calories = 80,
        buffs = {},
        category = 'special'
    },
    ['peanut_butter'] = {
        label = 'Beurre de Cacahuète',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'special'
    },
    ['jam'] = {
        label = 'Confiture',
        hunger = 8,
        thirst = 0,
        calories = 80,
        buffs = {},
        category = 'special'
    },
    ['chocolate'] = {
        label = 'Chocolat',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'special'
    },
    ['rice'] = {
        label = 'Riz',
        hunger = 12,
        thirst = 0,
        calories = 120,
        buffs = {},
        category = 'grain'
    },
    ['pasta'] = {
        label = 'Pâtes',
        hunger = 15,
        thirst = 0,
        calories = 150,
        buffs = {},
        category = 'grain'
    },
    ['beans'] = {
        label = 'Haricots',
        hunger = 10,
        thirst = 0,
        calories = 100,
        buffs = {},
        category = 'vegetable'
    }
}

-- Recettes Préparées (Example recipes that come with the script)
-- Les propriétaires peuvent créer leurs propres recettes via le menu de gestion
PreparedRecipes = {
    -- Burger Shot
    burgershot = {
        ['bs_burger'] = {
            label = 'Burger Burger Shot',
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
            time = 5000,
            hunger = 60,
            thirst = 0,
            calories = 600,
            buffs = {}
        },
        ['bs_fries'] = {
            label = 'Frites Burger Shot',
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
            label = 'Soda Burger Shot',
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

    -- Pizza This
    pizzathis = {
        ['pizza_margherita'] = {
            label = 'Pizza Margherita',
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
            label = 'Pizza Pepperoni',
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
            label = 'Verre de Vodka',
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
            label = 'Verre de Whisky',
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
            label = 'Bière Fraîche',
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
            label = 'Cocktail Unicorn',
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
            label = 'Shot de Tequila',
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
            label = 'Burger Atom',
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
            label = 'Frites Atom',
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
            label = 'Ailes de Poulet',
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
            label = 'Rondelles d\'Oignon',
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
            label = 'Petit-Déjeuner Classique',
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
            label = 'Pile de Crêpes',
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
            label = 'Part de Tarte aux Pommes',
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
            label = 'Café Latte',
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
            label = 'Moka',
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
            label = 'Café Glacé',
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
