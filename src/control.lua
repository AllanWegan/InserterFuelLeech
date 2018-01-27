script.on_event(defines.events.on_tick, function(event)
			leech()
end)

script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name ~= "burner-inserter" then return end
  if not global.burner then
    global.burner = {}
  end
  local burner = event.created_entity
  table.insert(global.burner, burner)
  check_burner(burner)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	if event.created_entity.name ~= "burner-inserter" then return end
  if not global.burner then
    global.burner = {}
  end
  local burner = event.created_entity
  table.insert(global.burner, burner)
  check_burner(burner)
end)

function leech()
  if  not fuel_list then
  --I recalculate the fuel list everytime because adding or removing mod/items can fuck it all up and this doesn't take very long
   fuel_list = {}
    for k, v in pairs (game.item_prototypes) do    
      if v.fuel_value > 0 then
        table.insert(fuel_list,v)
      end
    end
  end
  if global.burner_index == nil then
  global.burner_index = 1
  end
  if global.burner == nil then return end
  if global.burner[global.burner_index] == nil then return end
  check_burner(global.burner[global.burner_index])
  if global.burner_index >= #global.burner then
    global.burner_index = 1
  else 
    global.burner_index = global.burner_index + 1
  end
end


function check_burner(burner)
  if not burner then return end
  if not burner.valid then 
  table.remove(global.burner, global.burner_index) 
  global.burner_index = global.burner_index -1
  return
  end
  local send_to_target = false
  if burner.drop_target ~= nil then
    if burner.drop_target.get_fuel_inventory() ~= nil then
      if burner.drop_target.get_fuel_inventory().get_item_count() < 1 then
        send_to_target = true
      end
    end
  end
  if burner.pickup_target == nil then return end
  if burner.get_item_count() < 1 or send_to_target then
    leeched = burner.pickup_target
    if leeched == nil then return end
    if burner.held_stack.valid_for_read == false then           
      for j, v in pairs (fuel_list) do
        if leeched.get_item_count(v.name) > 0 then                 
          burner.held_stack.set_stack({name = v.name, count = 1})		
          leeched.remove_item({name = v.name, count = 1})
          return
        end
      end
    end
  end
end
