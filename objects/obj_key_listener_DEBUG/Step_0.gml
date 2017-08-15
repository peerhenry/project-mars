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

if(keyboard_check_pressed(ord("L")))
{
	//var cable = instance_position(mouse_x, mouse_y, obj_cable);
	//if(cable > 0) show_debug_message("cable adjacency number: " + string(cable.adjacency_number));
	
	/*var count = 0;
	var leak_count = 0;
	var replenish_count = 0;
	with(obj_room)
	{
		count++;
		if(oxygen_is_replenishing) replenish_count++;
		if(oxygen_is_leaking) leak_count++;
	}
	show_debug_message("room count: " + string(count));
	show_debug_message("leak count: " + string(leak_count));
	show_debug_message("replenish_count: " + string(replenish_count));*/
	
	// scr_show_construction_queue();
	
	/*with(obj_astronaut)
	{
		scr_kill(id);
	}//*/
	
	with(obj_grid)
	{
		var room_count = 0;
		if(grid_type == macro_grid_oxygen)
		{
			var consumers = role_map[? macro_grid_role_consumer];
			for(var n = 0; n < ds_list_size(consumers); n++)
			{
				var next_c = ds_list_find_value(consumers, n);
				if(next_c.object_index == obj_room)
				{
					room_count++;
				}
			}
			show_debug_message("oxygen grid has " + string(room_count) + " rooms");
		}
	}
	
}

if(keyboard_check_pressed(ord("B")))
{
	global.draw_room_bb = !global.draw_room_bb
}