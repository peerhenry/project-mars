// the different constructions
/*enum construction
{
	basetile,			// carrier
	wall,				// carrier
	door,				// NA
	hatch,				// NA
	suit_closet,		// NA
	suit_closet_empty,	// NA
	sensor,				// consumer
	drill,				// consumer
	pump,				// consumer
	battery,			// source
	oxygen_tank,		// NA
	bed,				// NA
	operating_table,	// consumer
	cable,				// carrier
	pipe,
	airlock_pump
}//*/
#macro macro_basetile 0
#macro macro_wall 1
#macro macro_door 2
#macro macro_hatch 3
#macro macro_suit_closet 4
#macro macro_suit_closet_empty 5
#macro macro_sensor 6
#macro macro_drill 7
#macro macro_battery 8
#macro macro_oxygen_tank 9
#macro macro_cable 10
#macro macro_pipe 11
#macro macro_bed 12

// construction properties
#macro macro_id 0
#macro macro_name 1
#macro macro_hud_sprite 3
#macro macro_build_tile_map 4
#macro macro_build_tile_keys 5
#macro macro_rotation_behavior 6
#macro macro_dragging 7
#macro macro_drag_actions 8
#macro macro_surround_actions 9

// build action properties
#macro macro_validation_i 0
#macro macro_validation_o 1
#macro macro_map_buffer_action 2
#macro macro_layer 3
#macro macro_object_to_add 4
#macro macro_object_to_remove 5
#macro macro_metal_cost 6

// used for map buffer
#macro map_value_vacant 0
#macro map_value_reserved 1
#macro map_value_occupied 2
#macro map_value_wall_like 3
#macro map_value_wall_pure 4
#macro map_value_under_construction 5
#macro map_value_cable 6
#macro map_value_pipe 7
#macro map_value_pipe_and_cable 8

// properties for build cells
#macro build_cell_i 0
#macro build_cell_j 1
#macro build_cell_object_to_add 2
#macro build_cell_layer 3
#macro build_cell_object_to_remove 4
#macro build_cell_map_buffer_action 5
#macro build_cell_cost 6
#macro build_cell_object_sprite 7
#macro build_cell_object_image 8
#macro build_cell_object_angle 9

// properties for construction cells
#macro c_cell_i 0
#macro c_cell_j 1
#macro c_cell_new_instance 2
#macro c_cell_object_to_remove 3
#macro c_cell_map_buffer_action 4
#macro c_cell_layer 5