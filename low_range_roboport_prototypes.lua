


local CreateLRREntity = function()

    local entity = table.deepcopy(data.raw["roboport"]["roboport"])

    entity.name = "lr-roboport"
    entity.logistics_radius = 14
    entity.construction_radius = 16
    entity.logistics_connection_distance = 14

    return entity
end


local CreateLRRItem = function()

    local item = table.deepcopy(data.raw["item"]["roboport"])

    item.name = "lr-roboport"
    item.place_result = "lr-roboport"

    return item
end



local CreateLRRRecipe = function()

    local recipe = table.deepcopy(data.raw["recipe"]["roboport"])

    recipe.enabled = true
    recipe.name = "lr-roboport"
    recipe.result = "lr-roboport"

    return recipe
end



data:extend{CreateLRREntity(), CreateLRRItem(), CreateLRRRecipe()}
