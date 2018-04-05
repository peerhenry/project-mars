/// @descr check keys

if(keyboard_check_pressed(ord("G")))
{
	show_grid = !show_grid;
}

if(keyboard_check_pressed(ord("T")))
{
	//scr_run_tests();
	show_debug_message("Checking if walls block navgrid...");
	show_debug_message("...");
	with(obj_wall)
	{
		var is_free = scr_navgrid_cell_is_free(occ_i, occ_j);
		if(is_free)
		{
			show_debug_message("WALL DETECTED WITH FREE NAVGRID AT: " + string(occ_i) + ", " + string(occ_j));
			return;
		}
	}
	show_debug_message("Everything OK.");
}

if(keyboard_check_pressed(ord("F")))
{
	debug_finish_all_constructions();
}

if(keyboard_check_pressed(ord("I")))
{
	var mouse_i = scr_rc_to_gi(mouse_x);
	var mouse_j = scr_rc_to_gi(mouse_y);
	var map_val = scr_map_buffer_get_cell(mouse_i, mouse_j);
	var map_i = map_val & 1;
	var map_o = (map_val >> 1) & 127;
	var map_r = (map_val >> 8) & 255;
	show_debug_message("map_i: " + string(map_i));
	show_debug_message("map_o: " + string(map_o));
	show_debug_message("map_r: " + string(map_r));
}

if(keyboard_check_pressed(ord("M")))
{
	global.resource_amount_metal += 10000;
	with(obj_hydroponics)
	{
		show_debug_message("hydroponics y is: " + string(y));
		show_debug_message("hydroponics depth is: " + string(depth));
	}
}

if(keyboard_check_pressed(ord("H")))
{
	with(obj_hydroponics) food_level = 100;
}

if(keyboard_check_pressed(ord("L")))
{
	//scr_show_construction_queue();
	//show_debug_message("room count: " + string(scr_count_instances(obj_room)));
	with(obj_room) oxygen_level = 100;
}

// Kill a selected movable, or a movable over which mouse hovers
if(keyboard_check_pressed(ord("K")))
{
	var found = false;
	with(obj_movable)
	{
		if(is_selected)
		{
			found = true;
			scr_kill(id);
			break;
		}
	}
	if(!found)
	{
		var astro = instance_position(mouse_x, mouse_y, obj_movable);
		if(astro != noone) scr_kill(astro);
		else
		{
			var con = instance_position(mouse_x, mouse_y, obj_constructable);
			if(con != noone) con.damage = 100;
		}
	}
}

if(keyboard_check_pressed(ord("B")))
{
	global.draw_room_bb = !global.draw_room_bb
}

if(keyboard_check_pressed(ord("O")))
{
	with(obj_grid)
	{
		if(grid_type == macro_grid_oxygen) 
		{
			total_production = 10;
			total_demand = 0;
			net_output = 10;
			storage = 10;
			storage_capacity = 10;
		}
	}
	with(obj_room)
	{
		oxygen_level = 100;
	}
}

if(keyboard_check_pressed(ord("C")))
{
	with(obj_movable)
	{
		if(is_selected) scr_cancel_walking(id);
	}
}

if(keyboard_check_pressed(vk_numpad1))
{
	#region deplete food & sleep
	with(obj_astronaut)
	{
		show_debug_message("");
		show_debug_message("food_level " + string(food_level));
		show_debug_message("floor(food_level) " + string(floor(food_level)));
		show_debug_message("");
		show_debug_message("sleep_level " + string(sleep_level));
		show_debug_message("floor(sleep_level) " + string(floor(sleep_level)));
		food_level = 1;
		sleep_level = 1;
	}
	#endregion
}

if(keyboard_check_pressed(vk_numpad2))
{
}

if(keyboard_check_pressed(vk_numpad3))
{
}

if(keyboard_check_pressed(vk_numpad4))
{
	#region list triggers
	with(obj_level)
	{
		show_debug_message("");
		show_debug_message("### LISTING TRIGGERS ###");
		
		show_debug_message("nr of triggers: " + string(ds_list_size(trigger_list)));
		for(var n = 0; n < ds_list_size(trigger_list); n++)
		{
			var next_trigger = trigger_list[|n];
			var text = next_trigger.name;
			if(next_trigger.type == trigger_type.objective) text = text + " - accomplished: " + string(next_trigger.accomplished);
			show_debug_message(text);
			show_debug_message("trigger count: " + string(next_trigger.trigger_count)); // DEBUG
		}
		
		show_debug_message("");
	}
	#endregion
}

if(keyboard_check_pressed(vk_numpad5))
{
	#region trigger victory
	with(obj_level)
	{
		for(var n = 0; n < ds_list_size(trigger_list); n++)
		{
			var next_trigger = trigger_list[|n];
			if(next_trigger.type == trigger_type.objective) next_trigger.accomplished = true;
			if(next_trigger.object_index == obj_trigger_standard_victory){
				with(next_trigger)
				{
					if(script_exists(script_trigger)) script_execute(script_trigger, id);
					with(level) event_user(macro_trigger_callback);
				}
			}
		}
	}
	#endregion
}

if(keyboard_check_pressed(vk_numpad6))
{
	scr_spawn_worm();
}

if(keyboard_check_pressed(vk_numpad7))
{
	scr_notify_player("This is a dummy message.");
}

if(keyboard_check_pressed(vk_numpad8))
{
}

if(keyboard_check_pressed(vk_numpad9))
{
}

if(keyboard_check_pressed(vk_numpad0))
{
}