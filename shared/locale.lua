Locale = {}

Locale['en'] = {
    -- General
    ['press_to_open'] = 'Press ~INPUT_CONTEXT~ to open',
    ['press_to_interact'] = 'Press ~INPUT_CONTEXT~ to interact',
    ['cancelled'] = 'Cancelled',
    ['not_enough_items'] = 'You don\'t have enough items',
    ['inventory_full'] = 'Your inventory is full',
    ['success'] = 'Success',
    ['failed'] = 'Failed',

    -- Management
    ['management_menu'] = 'Management Menu',
    ['recipes_menu'] = 'Recipes Management',
    ['create_recipe'] = 'Create Recipe',
    ['edit_recipe'] = 'Edit Recipe',
    ['delete_recipe'] = 'Delete Recipe',
    ['menu_items'] = 'Menu Items',
    ['employees'] = 'Employees',
    ['society_money'] = 'Society Money',
    ['withdraw_money'] = 'Withdraw Money',
    ['deposit_money'] = 'Deposit Money',

    -- Crafting
    ['crafting_station'] = 'Crafting Station',
    ['select_recipe'] = 'Select Recipe',
    ['crafting'] = 'Crafting...',
    ['crafted_item'] = 'You crafted %s',
    ['missing_ingredients'] = 'Missing ingredients',

    -- Register
    ['cash_register'] = 'Cash Register',
    ['charge_customer'] = 'Charge Customer',
    ['enter_amount'] = 'Enter Amount',
    ['nearby_players'] = 'Nearby Players',
    ['invoice_sent'] = 'Invoice sent',
    ['invoice_received'] = 'Invoice received for %s',
    ['invoice_paid'] = 'Invoice paid',
    ['invoice_rejected'] = 'Invoice rejected',

    -- Storage
    ['open_stash'] = 'Open Storage',
    ['open_tray'] = 'Open Tray',
    ['stash'] = 'Storage',
    ['tray'] = 'Tray',

    -- Delivery
    ['delivery'] = 'Delivery',
    ['start_delivery'] = 'Start Delivery',
    ['delivery_in_progress'] = 'Delivery in progress',
    ['delivery_cooldown'] = 'Delivery on cooldown',
    ['deliver_to'] = 'Deliver to %s',
    ['delivery_completed'] = 'Delivery completed! You earned %s',
    ['delivery_failed'] = 'Delivery failed',

    -- Shop
    ['shop'] = 'Shop',
    ['buy'] = 'Buy',
    ['price'] = 'Price',
    ['quantity'] = 'Quantity',
    ['purchased'] = 'You purchased %s x%s for %s',

    -- Garage
    ['garage'] = 'Garage',
    ['take_vehicle'] = 'Take Vehicle',
    ['store_vehicle'] = 'Store Vehicle',
    ['vehicle_spawned'] = 'Vehicle spawned',
    ['vehicle_stored'] = 'Vehicle stored',
    ['no_vehicle_nearby'] = 'No vehicle nearby',

    -- Drive Thru
    ['drivethru'] = 'Drive Thru',
    ['drivethru_order'] = 'Someone is at the drive thru',
    ['drivethru_welcome'] = 'Welcome to %s drive thru',
    ['place_order'] = 'Place Order',
    ['pickup_order'] = 'Pick Up Order',

    -- Music
    ['music'] = 'Music',
    ['play_music'] = 'Play Music',
    ['stop_music'] = 'Stop Music',
    ['change_volume'] = 'Change Volume',
    ['enter_url'] = 'Enter Music URL',

    -- Chairs
    ['sit_down'] = 'Sit Down',
    ['stand_up'] = 'Stand Up',

    -- Permissions
    ['no_permission'] = 'You don\'t have permission',
    ['not_in_job'] = 'You are not employed here',

    -- Recipes
    ['recipe_name'] = 'Recipe Name',
    ['recipe_price'] = 'Price',
    ['recipe_image'] = 'Image URL',
    ['add_ingredient'] = 'Add Ingredient',
    ['ingredient_item'] = 'Item',
    ['ingredient_amount'] = 'Amount',
    ['recipe_created'] = 'Recipe created',
    ['recipe_deleted'] = 'Recipe deleted',
    ['recipe_limit_reached'] = 'Recipe limit reached',
    ['max_price_exceeded'] = 'Max price exceeded',
    ['max_ingredients_exceeded'] = 'Too many ingredients',
}

-- French translations
Locale['fr'] = {
    ['press_to_open'] = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir',
    ['press_to_interact'] = 'Appuyez sur ~INPUT_CONTEXT~ pour interagir',
    ['cancelled'] = 'Annulé',
    ['not_enough_items'] = 'Vous n\'avez pas assez d\'articles',
    ['inventory_full'] = 'Votre inventaire est plein',
    ['success'] = 'Succès',
    ['failed'] = 'Échoué',

    ['management_menu'] = 'Menu de Gestion',
    ['recipes_menu'] = 'Gestion des Recettes',
    ['create_recipe'] = 'Créer une Recette',
    ['edit_recipe'] = 'Modifier la Recette',
    ['delete_recipe'] = 'Supprimer la Recette',
    ['menu_items'] = 'Articles du Menu',
    ['employees'] = 'Employés',
    ['society_money'] = 'Argent de la Société',

    ['crafting_station'] = 'Station de Fabrication',
    ['select_recipe'] = 'Sélectionner une Recette',
    ['crafting'] = 'Fabrication...',
    ['crafted_item'] = 'Vous avez fabriqué %s',

    ['cash_register'] = 'Caisse Enregistreuse',
    ['charge_customer'] = 'Facturer un Client',

    ['delivery'] = 'Livraison',
    ['start_delivery'] = 'Commencer la Livraison',

    ['shop'] = 'Boutique',
    ['buy'] = 'Acheter',

    ['garage'] = 'Garage',
    ['take_vehicle'] = 'Sortir un Véhicule',
    ['store_vehicle'] = 'Ranger le Véhicule',

    ['no_permission'] = 'Vous n\'avez pas la permission',
}

---Get translated text
---@param key string
---@param ... any
---@return string
function Locale.Get(key, ...)
    local locale = Locale[Config.Locale] or Locale['en']
    local text = locale[key] or Locale['en'][key] or key

    if ... then
        return string.format(text, ...)
    end

    return text
end

_L = Locale.Get

return Locale
