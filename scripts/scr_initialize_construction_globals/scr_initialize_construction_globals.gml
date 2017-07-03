// construction properties
#macro macro_id 0
#macro macro_name 1
#macro macro_hud_sprite 3
#macro macro_build_tile_map 4
#macro macro_build_tile_keys 5
#macro macro_rotation_behavior 6
#macro macro_drag_behavior 7
#macro macro_surround_behavior 8

// build action properties
#macro macro_validation_i 0
#macro macro_validation_o 1
#macro macro_map_buffer_action 2
#macro macro_layer 3
#macro macro_object_to_add 4
#macro macro_object_to_remove 5
#macro macro_metal_cost 6

enum build_validation_i
{
	inside,
	outside,
	any
}

enum build_validation_o
{
	vacant,
	unoccupied,
	wall_like,
	any,
	wall,
	for_cable,
	for_pipe
}

enum map_buffer_action
{
	nothing,
	clear,
	reserve,
	occupy,
	wall_like,
	wall,
	inside,
	under_construction,
	cable,
	pipe
}

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



















// to be used later...


// construction instance properties
#macro construction_build_state 0
#macro construction_completion 1
#macro construction_build_type 2
#macro construction_cells 3
#macro construction_astronaut 4
#macro construction_time 5




// drag types
#macro dragging_none 0
#macro dragging_linear 1
#macro dragging_rectangular 2

// action types

#macro action_type_validation_and_object 0		// validation means an object is required at the tile
#macro action_type_negation_and_object 1		// negation means an object is required not to be at given tile
#macro action_type_validation 2
#macro action_type_negation 3
#macro action_type_replacement 4









// old from here

global.ghost_previous_i = 0; // to check if ghost hovers over a new tile; scr_update_ghost
global.ghost_previous_j = 0;

global.build_rotation = 0;
global.build_tile_counts = ds_map_create();
global.build_action_counts = ds_map_create();
global.last_d_i = 0;
global.last_d_j = 0;
global.last_build_tile_key = 0;

// at the end of initialization, the data from big bad buffer gets transferred to a buffer for build tiles, and a buffer for build actions
// see scr_finalize_build_buffers

// used for gameplay:
global.build_stack = ds_stack_create(); // build stack is filled by ghost, see scr_update_ghost. Mouse release triggers new construction from the data on this stack.
global.invalid_build_stack = ds_stack_create(); // filled by scr_update_ghost, scr_draw_ghost will draw red tiles for these.
global.construction_queue = ds_list_create(); // constructions dont immediately build, but are put on a queue for astronauts to pick up.
global.construction_is_valid = false;
global.can_pay_for_construction = false;

enum construction_state
{
	not_ready,		// not ready to be constructed.
	ready,			// construction is ready to be picked up
	picked_up,		// an astronaut picked up this construction task
	done
}

// The following macros are array index handles that serve as object properties.

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

