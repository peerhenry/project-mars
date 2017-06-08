
var base_layer = layer_get_id("base");
var basetile_layer = layer_get_id("basetiles");
var base_tall_layer = layer_get_id("base_tall");

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
scr_add_build_action(
	build.basetile,
	0,	// di
	0,	// dj
	build_validation_i.inside,
	build_validation_o.any,
	0,
	map_buffer_action.nothing,
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
	base_tall_layer,
	obj_sensor,
	noone,
	500
);


// drill
scr_add_build_action(
	build.drill,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_tall_layer,
	obj_drill,
	noone,
	800
);


// pump
scr_add_build_action(
	build.pump,
	0,	// di
	0,	// dj
	build_validation_i.outside,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_layer,
	obj_pump,
	noone,
	500
);

// battery
scr_add_build_action(
	build.battery,
	0,	// di
	0,	// dj
	build_validation_i.any,
	build_validation_o.vacant,
	0,
	map_buffer_action.occupy,
	base_layer,
	obj_battery,
	noone,
	500
);

// cable
scr_add_build_action(
	build.cable,
	0,0, // di, dj
	build_validation_i.outside,
	build_validation_o.unoccupied,
	0, // image_index
	map_buffer_action.cable,
	base_layer,
	obj_cable,
	noone,
	20
)

// pipe
scr_add_build_action(
	build.pipe,
	0,0, // di, dj
	build_validation_i.outside,
	build_validation_o.unoccupied,
	0, // image_index
	map_buffer_action.pipe,
	base_layer,
	obj_pipe,
	noone,
	20
)