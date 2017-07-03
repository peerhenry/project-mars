// the different constructions
enum construction
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
}

var active_constructions = ds_list_create();
ds_list_add(active_constructions, construction.basetile);
global.active_constructions = active_constructions;

global.construction_map = ds_map_create();

var basetile_layer = layer_get_id("basetiles");
var base_layer = layer_get_id("base");
var base_tall_layer = layer_get_id("base_tall");

scr_construction_new(construction.basetile, "base tile", spr_base_tile, 3);

scr_construction_set_action(build_validation_i.outside, build_validation_o.vacant,	map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone, 100);	// build outside
scr_construction_set_action(build_validation_i.outside, build_validation_o.wall,	map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone, 0);		// replace outside wall
scr_construction_set_action(build_validation_i.inside,	build_validation_o.any,		map_buffer_action.nothing,	noone,			noone,			noone, 0);							// do nothing inside

scr_construction_set_surrounder(3);
scr_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.wall,		base_layer, obj_base_tile,	noone, 100);	// build outside wall
scr_construction_set_action(build_validation_i.outside, build_validation_o.wall_like,	map_buffer_action.nothing,	noone,		noone,			noone, 0);		// wall like: nothing
scr_construction_set_action(build_validation_i.inside,	build_validation_o.any,			map_buffer_action.nothing,	noone,		noone,			noone, 0);		// inside; nothing