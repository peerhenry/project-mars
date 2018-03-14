// Check victory conditions
var all_accomplished = ds_list_size(objective_list) > 0;
for(var n = 0; n < ds_list_size(objective_list); n++)
{
	var next_obj = objective_list[|n];
	if(!next_obj.accomplished)
	{
		all_accomplished = false;
	}
}

if(all_accomplished)
{
	var level_end = instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_accomplished);
	level_end.button.level = id;
}

// Check if lost
var lost = scr_count_live_astronauts(macro_player) == 0;
if(lost) instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_failed);