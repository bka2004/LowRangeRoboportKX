local EntityGui = require "entity_gui"

local modData =
{
	constants = 
	  {  
		modPrefix = "LRRKX_",
	  },
	  

}


	modData.guiElementNames = 
	{        
		closeButton = modData.constants.modPrefix .. "EntityGuiCloseButton",
        okButton = modData.constants.modPrefix .. "EntityGuiOkButton",
        connectionRangeEditField = modData.constants.modPrefix .. "ConnectionRangeEditField",
        gui = modData.constants.modPrefix .. "EntityGui",
	}


local entityGui = EntityGui(modData)

local function HandleOnGuiOpened(event)

        if (event.gui_type ~= defines.gui_type.entity) then
            return
          end
        
          local clickedEntity = event.entity;
        
          if (clickedEntity.prototype.name ~= "lr-roboport") then
            return
          end
                
          local player = game.players[event.player_index]
        
          entityGui.Show(player, clickedEntity)
              
      end

script.on_event(defines.events.on_gui_opened, HandleOnGuiOpened)
script.on_event(defines.events.on_gui_click, entityGui.HandleOnGuiClick)







