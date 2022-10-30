


local CreateLRREntity = function(connectionRange)

    local entity = table.deepcopy(data.raw["roboport"]["roboport"])

    entity.name = "lr-roboport" + tostring(connectionRange)
    entity.logistics_radius = connectionRange
    entity.construction_radius = connectionRange + 2
    entity.logistics_connection_distance = connectionRange

    return entity
end


local CreateLRRItem = function(connectionRange)

    local item = table.deepcopy(data.raw["item"]["roboport"])

    item.name = "lr-roboport" + tostring(connectionRange)
    item.place_result = "lr-roboport" + tostring(connectionRange)

    return item
end



local CreateLRRRecipe = function(connectionRange)

    local recipe = table.deepcopy(data.raw["recipe"]["roboport"])

    recipe.enabled = true
    recipe.name = "lr-roboport" + tostring(connectionRange)
    recipe.result = "lr-roboport" + tostring(connectionRange)

    return recipe
end



for _, range in ipairs({8,10,12,14,16,18,20}) do
    data:extend{CreateLRREntity(range), CreateLRRItem(range), CreateLRRRecipe(range)}
    
end

