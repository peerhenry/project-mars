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
}

if(keyboard_check_pressed(ord("L")))
{
	var cable = instance_position(mouse_x, mouse_y, obj_cable);
	if(cable > 0) show_debug_message("cable adjacency number: " + string(cable.adjacency_number));
}

if(keyboard_check_pressed(ord("B")))
{
	global.draw_room_bb = !global.draw_room_bb
}