var basetile_layer = layer_get_id("basetiles");
var base_layer = layer_get_id("base");
var base_tall_layer = layer_get_id("base_tall");

global.construction_map = ds_map_create();

// basetile

init_construction_new(macro_basetile, "base tile", spr_base_tile, 3);	// new construction gets 3 build actions

init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,	map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone, 100);	// build outside
init_construction_set_action(build_validation_i.outside, build_validation_o.wall,	map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone, 0);		// replace outside wall
init_construction_set_action(build_validation_i.inside,	build_validation_o.any,		map_buffer_action.nothing,	noone,			noone,			noone, 0);		// do nothing inside

init_construction_set_surrounder(3); // surrounder gets 3 build actions
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.wall,		base_layer, obj_wall,		noone, 100);		// build outside wall
init_construction_set_action(build_validation_i.outside, build_validation_o.wall_like,	map_buffer_action.nothing,	noone,		noone,			noone, 0);		// wall like: nothing
init_construction_set_action(build_validation_i.inside,	build_validation_o.any,			map_buffer_action.nothing,	noone,		noone,			noone, 0);		// inside; nothing

init_construction_set_dragging(dragging.rectangular, 3);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,	map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone, 100);	// build outside
init_construction_set_action(build_validation_i.outside, build_validation_o.wall,	map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone, 0);		// replace outside wall
init_construction_set_action(build_validation_i.inside,	build_validation_o.any,		map_buffer_action.nothing,	noone,			noone,			noone, 0);		// do nothing inside

// wall