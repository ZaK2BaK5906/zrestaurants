Stations = {}

-- Define station types and what can be crafted at each
Stations = {
    ['prepare'] = {
        label = 'Preparation Station',
        icon = 'utensils',
        allowedTypes = {'food', 'burger', 'sandwich', 'salad'},
        animation = Config.Animations.prepare
    },
    ['cook'] = {
        label = 'Cooking Station',
        icon = 'fire',
        allowedTypes = {'pizza', 'pasta', 'meat'},
        animation = Config.Animations.cook
    },
    ['grill'] = {
        label = 'Grill Station',
        icon = 'hamburger',
        allowedTypes = {'burger', 'meat', 'bbq'},
        animation = Config.Animations.grill
    },
    ['fryer'] = {
        label = 'Deep Fryer',
        icon = 'temperature-high',
        allowedTypes = {'fries', 'nuggets', 'fried'},
        animation = Config.Animations.fryer
    },
    ['drink'] = {
        label = 'Drink Station',
        icon = 'glass',
        allowedTypes = {'drink', 'beverage', 'soda', 'coffee'},
        animation = Config.Animations.drink
    },
    ['pack'] = {
        label = 'Packaging Station',
        icon = 'box',
        allowedTypes = {'package', 'delivery'},
        animation = Config.Animations.pack
    }
}

return Stations
