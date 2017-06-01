global.ghost_previous_i = 0; // to check if ghost hovers over a new tile; scr_update_ghost
global.ghost_previous_j = 0;

global.build_rotation = 0;
global.build_tile_counts = ds_map_create();
global.build_action_counts = ds_map_create();
global.last_d_i = 0;
global.last_d_j = 0;
global.last_build_tile_key = 0;
var prop_count = 11;
var big_bad_size = 200; // assuming we don't go above this amount of build actions...
global.big_bad_buffer = buffer_create(big_bad_size*4*prop_count, buffer_fixed, 4); // temporary buffer to store all needed data for buildings
global.construction_list = ds_list_create();

// at the end of initialization, the data from big bad buffer gets transferred to a buffer for build tiles, and a buffer for build actions
// see scr_finalize_build_buffers

// used for gameplay:
global.build_stack = ds_stack_create(); // build stack is filled by ghost, see scr_update_ghost. Mouse release triggers new construction from the data on this stack.
global.invalid_build_stack = ds_stack_create(); // filled by scr_update_ghost, scr_draw_ghost will draw red tiles for these.
global.construction_queue = ds_list_create(); // constructions dont immediately build, but are put on a queue for astronauts to pick up.
global.construction_is_valid = false;
global.can_pay_for_construction = false;

enum build_state
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

// properties for constructions
#macro construction_build_state 0
#macro construction_completion 1
#macro construction_build_type 2
#macro construction_cells 3
#macro construction_astronaut 4
#macro construction_time 5

// properties for construction cells
#macro c_cell_i 0
#macro c_cell_j 1
#macro c_cell_new_instance 2
#macro c_cell_object_to_remove 3
#macro c_cell_map_buffer_action 4
#macro c_cell_layer 5

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
	wall
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
	under_construction
}

// used for map buffer
global.vacant = 0;
global.reserved = 1;
global.occupied = 2;
global.wall_like = 3;
global.wall_pure = 4;
global.under_construction = 5;

// the different constructions
enum build
{
	basetile,
	wall,
	door,
	hatch,
	suit_closet,
	suit_closet_empty,
	sensor,
	drill,
	pump,
	generator,
	oxygen_tank,
	bed,
	operating_table,
	electric_cable
}