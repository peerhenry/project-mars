function debug_show_construction(argument0) {
	var next_construction = argument0;
	show_debug_message("construction_build_state: " + string(ds_map_find_value(next_construction, construction_build_state)));
	show_debug_message("construction_completion: " + string(ds_map_find_value(next_construction, construction_completion)));
	show_debug_message("construction_type: " + string(ds_map_find_value(next_construction, construction_type)));
	var cells = ds_map_find_value(next_construction, construction_cells);
	var cell_count = ds_list_size(cells);
	show_debug_message("cell_count: " + string(cell_count));
	show_debug_message("construction_astronaut: " + string(ds_map_find_value(next_construction, construction_astronaut)));
	show_debug_message("construction_time: " + string(ds_map_find_value(next_construction, construction_time)));
	show_debug_message("has prerequisite: " + string(is_array(ds_map_find_value(next_construction, construction_prerequisite))));
	show_debug_message("construction_required_mdu_count: " + string(ds_map_find_value(next_construction, construction_required_mdu_count)));
	show_debug_message("construction_required_mdu_remaining: " + string(ds_map_find_value(next_construction, construction_required_mdu_remaining)));


}
