

local function EntityGui(modData)

	local self = 
	{
		modData = modData, 
		connectionRangeEditField = nil,	
		editedEntity = nil,
		guiFrame = nil
	}



    function self.AddTitleBarToEntityGui(parent, dragTarget)
        local flow = parent.add{type = "flow", direction = "horizontal"}
        flow.add{type = "label", caption = {"EntityGui.Title"}, style = "frame_title"}
        flow.add{type = "empty-widget", style = "wirelessdragwidget"}.drag_target = dragTarget
        flow.add{type = "sprite-button", name = self.modData.guiElementNames.closeButton, sprite = "utility/close_white", style = "frame_action_button"}
      end
      
      
     function self.AddConnectionRangeEditFieldToEntityGui(parent)

        local flow = parent.add{type = "flow", direction = "horizontal"}
        flow.add{type = "label", caption = {"EntityGui.ConnectionRangeLabel"}}
        connectionRangeEditField = flow.add{type = "textfield", name = self.modData.guiElementNames.connectionRangeEditField}

      end
      
      
      function self.AddOkButtonToEntityGui(parent)
      
        local flow = parent.add{type = "flow", direction = "horizontal"}
        flow.add{type = "button", name = self.modData.guiElementNames.okButton, caption = {"EntityGui.Ok"}}

      end


      
      function self.Close(playerId)

        if (not self.guiFrame) then
          return
        end

        self.guiFrame.destroy()
		self.guiFrame = nil

      end


      function self.HandleCloseButton(event)

        if (event.element.name ~= self.modData.guiElementNames.closeButton) then
            return false
        end

        self.Close(event.player_index)

        return true
      end


      function self.HandleBusDropDownSelectionChanged(event)

        if (event.element.name ~= self.modData.guiElementNames.busOfEntityDropdown) then
          return
        end

        self.UpdateChannelOfEntityDropdown()

      end
      



      function self.HandleEntityOkButton(event)

        if (event.element.name ~= self.modData.guiElementNames.okButton) then
          return false
        end
      
		local connectionRange = self.connectionRangeEditField.text
		local logisticsRange = connectionRange
		local constructionRange = connectionRange + 2

		if (not self.editedEntity) then
			return true
		end

		self.editedEntity.logistics_connection_distance = connectionRange
		self.editedEntity.logistics_radius = logisticsRange
		self.editedEntity.construction_radius = constructionRange

        return true

      end
      

      function self.Show(player, entity)

        self.Close(player.index) -- in case another entity is already open

        self.guiFrame = player.gui.screen.add{type = "frame", name = modData.guiElementNames.gui, direction = "vertical"}
        local verticalFlow = self.guiFrame.add{type = "flow", direction = "vertical"}

        self.AddTitleBarToEntityGui(verticalFlow, self.guiFrame)
        self.AddConnectionRangeEditFieldToEntityGui(verticalFlow)
        self.AddOkButtonToEntityGui(verticalFlow)
		
		self.connectionRangeEditField.text = entity.logistics_connection_distance
		self.editedEntity = entity

        self.guiFrame.location = {0, 0}

        player.opened = self.guiFrame

      end



    function self.HandleOnGuiClick(event)

        return tools.CallEventHandler(event, {
            self.HandleEntityOkButton,
            self.HandleCloseButton
        })

      end

      
    return self

end


return EntityGui