/// Initialize constructions

// NOTE: to add a new construction, follow the numbers

global.build_rotation = 0;

// map buffer
/* OBSOLETE
global.inside = 1;
global.reserved = 2;
global.occupied = 4;
*/

global.build_tile_counts = ds_map_create();
global.build_action_counts = ds_map_create();
global.last_d_i = 0;
global.last_d_j = 0;
global.last_build_tile_key = 0;
var prop_count = 10;
var big_bad_size = 200; // assuming we don't go above this amount of build actions...
global.big_bad_buffer = buffer_create(big_bad_size*4*prop_count, buffer_fixed, 4);
global.construction_list = ds_list_create();

enum build_validation_i {
	inside,
	outside,
	any
}

enum build_validation_o {
	vacant,
	unoccupied,
	wall_like,
	any,
	wall
}

enum map_buffer_action {
	nothing,
	clear,
	reserve,
	occupy,
	wall_like,
	wall,
	inside
}

global.vacant = 0;
global.reserved = 1;
global.occupied = 2;
global.wall_like = 3;
global.wall_pure = 4;

global.basetile = 1;
global.outer_wall = 2;
global.wall = 3;
global.door = 4;
global.hatch = 5;
global.suit_closet = 6;
global.suit_closet_empty = 7;

var base_layer = layer_get_id("base");
var basetile_layer = layer_get_id("basetiles");

// basetile

scr_add_build_action(
	global.basetile,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.vacant,
	0,
	map_buffer_action.inside,
	basetile_layer,
	obj_base_tile,
	noone
);
scr_add_build_action(
	global.basetile,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall,
	0,
	map_buffer_action.inside,
	basetile_layer,
	obj_base_tile,
	obj_wall
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
	global.wall,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.wall,
	base_layer,
	obj_wall,
	noone
);

// hatch

scr_add_build_action(
	global.hatch,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.wall_like,
	base_layer,
	obj_hatch,
	obj_wall
);

scr_add_build_action(
	global.hatch,
	0,	// di
	-1,	// dj
	build_validation_i.any,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone
);

scr_add_build_action(
	global.hatch,
	0,	// di
	1,	// dj
	build_validation_i.any,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone
);

scr_add_build_action(
	global.hatch,
	-1,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone
);

scr_add_build_action(
	global.hatch,
	1,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone
);


// door

scr_add_build_action(
	global.door,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.wall_like,
	0,
	map_buffer_action.wall_like,
	base_layer,
	obj_door,
	obj_wall
);

scr_add_build_action(
	global.door,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.wall_like,
	base_layer,
	obj_door,
	noone
);

scr_add_build_action(
	global.door,
	0,	// di
	-1,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone
);

scr_add_build_action(
	global.door,
	0,	// di
	1,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone
);

scr_add_build_action(
	global.door,
	-1,	// di
	0,	// dj
	build_validation_i.any,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone
);

scr_add_build_action(
	global.door,
	1,	// di
	0,	// dj
	build_validation_i.any,
	build_validation_o.wall_like,
	0,
	map_buffer_action.nothing,
	noone,
	noone,
	noone
);

// closet

scr_add_build_action(
	global.suit_closet,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_layer,
	obj_suit_closet,
	noone
);

scr_add_build_action(
	global.suit_closet,
	1,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone
);

// closet empty

scr_add_build_action(
	global.suit_closet_empty,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_layer,
	obj_suit_closet,
	noone
);

scr_add_build_action(
	global.suit_closet_empty,
	1,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.unoccupied,
	0,
	map_buffer_action.reserve,
	noone,
	noone,
	noone
);

scr_finalize_build_buffers();