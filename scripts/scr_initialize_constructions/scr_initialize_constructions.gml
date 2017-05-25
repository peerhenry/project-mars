/// Initialize constructions

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
global.build_stack = ds_stack_create(); // build stack is filled by ghost, see scr_draw_ghost. Mouse release triggers new construction from the data on this stack.
global.construction_queue = ds_list_create(); // construction does not immediately build, but puts it on the build queue for astronauts to pick up.

enum build_state
{
	not_ready,		// not ready to be constructed.
	ready,			// construction is ready to be picked up
	assigned,		// an astronaut picked up this construction task
	in_progress,	// an astronaut is constructing
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

// properties for construction cells
#macro c_cell_i 0
#macro c_cell_j 1
#macro c_cell_new_instance 2
#macro c_cell_object_to_remove 3
#macro c_cell_map_buffer_action 4

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
	sensor
}

var base_layer = layer_get_id("base");
var basetile_layer = layer_get_id("basetiles");

// basetile

scr_add_build_action(
	build.basetile,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.vacant,
	0,
	map_buffer_action.inside,
	basetile_layer,
	obj_base_tile,
	noone,
	100
);
scr_add_build_action(
	build.basetile,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall,
	0,
	map_buffer_action.inside,
	basetile_layer,
	obj_base_tile,
	obj_wall,
	0
);
scr_add_outside_wall_build_actions(-1,-1);
scr_add_outside_wall_build_actions(0,-1);
scr_add_outside_wall_build_actions(1,-1);
scr_add_outside_wall_build_actions(-1,0);
scr_add_outside_wall_build_actions(1,0);
scr_add_outside_wall_build_actions(-1,1);
scr_add_outside_wall_build_actions(0,1);
scr_add_outside_wall_build_actions(1,1);

// wall

scr_add_build_action(
	build.wall,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.wall,
	base_layer,
	obj_wall,
	noone,
	100
);

// hatch

scr_add_build_action(
	build.hatch,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.wall_like,
	base_layer,
	obj_hatch,
	obj_wall,
	200
);

scr_add_build_action(
	build.hatch,
	0,	// di
	-1,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone,
	0
);

scr_add_build_action(
	build.hatch,
	0,	// di
	1,	// dj
	build_validation_i.outside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone,
	0
);

scr_add_build_action(
	build.hatch,
	-1,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone,
	0
);

scr_add_build_action(
	build.hatch,
	1,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone,
	0
);


// door

scr_add_build_action(
	build.door,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.wall_like,
	base_layer,
	obj_door,
	obj_wall,
	100
);

scr_add_build_action(
	build.door,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.wall_like,
	base_layer,
	obj_door,
	noone,
	200
);

scr_add_build_action(
	build.door,
	0,	// di
	-1,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone,
	0
);

scr_add_build_action(
	build.door,
	0,	// di
	1,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone,
	0
);

scr_add_build_action(
	build.door,
	-1,	// di
	0,	// dj
	build_validation_i.any,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone,
	0
);

scr_add_build_action(
	build.door,
	1,	// di
	0,	// dj
	build_validation_i.any,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone,
	0
);

// closet

scr_add_build_action(
	build.suit_closet,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_layer,
	obj_suit_closet,
	noone,
	500
);

scr_add_build_action(
	build.suit_closet,
	1,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone,
	0
);

// closet empty

scr_add_build_action(
	build.suit_closet_empty,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	4,
	map_buffer_action.occupy,
	base_layer,
	obj_suit_closet,
	noone,
	100
);

scr_add_build_action(
	build.suit_closet_empty,
	1,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone,
	0
);

// sensor

scr_add_build_action(
	build.sensor,
	0,
	0,
	build_validation_i.outside,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_layer,
	obj_sensor,
	noone,
	500
);



// AFTER ALL CONSTRUCTIONS HAVE BEEN DEFINED...

scr_finalize_build_buffers();