var basetile_layer = layer_get_id("basetiles");
var base_layer = layer_get_id("base");
var base_tall_layer = layer_get_id("base_tall");

// read from file
/*var i, file, file_string;
show_debug_message(" === The working directory is: " + string(working_directory));
show_debug_message(" === The working directory is: " + string(working_directory));
show_debug_message(" === The working directory is: " + string(working_directory));*/

global.construction_map = ds_map_create();

// # basetile

init_construction_new_single(macro_basetile, "base tile", spr_base_tile, 4);	// new construction gets 3 build actions

//								inside validation			occupation validation			action					layer			add				remove		cost

init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone,		100);	// build outside
init_construction_set_action(build_validation_i.outside, build_validation_o.wall,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	obj_wall,	0);		// replace outside wall
init_construction_set_action(build_validation_i.outside, build_validation_o.cable,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	obj_cable,	50);		// replace cable
init_construction_set_action(build_validation_i.outside, build_validation_o.pipe,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	obj_pipe,	50);		// replace cable

// ## surrounder
init_construction_set_surrounder(5); // surrounder gets 3 build actions
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.wall,		base_layer,		obj_wall,		noone,		100);	// build outside wall
init_construction_set_action(build_validation_i.outside, build_validation_o.wall_like,	map_buffer_action.nothing,	noone,			noone,			noone,		0);		// wall like: nothing
init_construction_set_action(build_validation_i.inside,	build_validation_o.any,			map_buffer_action.nothing,	noone,			noone,			noone,		0);		// inside; nothing
init_construction_set_action(build_validation_i.outside, build_validation_o.cable,		map_buffer_action.wall,		base_layer,		obj_wall,		obj_cable,	50);	// build outside wall
init_construction_set_action(build_validation_i.outside, build_validation_o.pipe,		map_buffer_action.pipe,		base_layer,		obj_wall,		obj_pipe,	50);	// build outside wall
// ## dragging
init_construction_set_dragging(dragging.rectangular, 5);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	noone,		100);	// build outside
init_construction_set_action(build_validation_i.outside, build_validation_o.wall,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	obj_wall,	0);		// replace outside wall
init_construction_set_action(build_validation_i.inside,	build_validation_o.any,			map_buffer_action.nothing,	noone,			noone,			noone,		0);		// do nothing inside
init_construction_set_action(build_validation_i.outside, build_validation_o.cable,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	obj_cable,	50);		// replace cable
init_construction_set_action(build_validation_i.outside, build_validation_o.pipe,		map_buffer_action.inside,	basetile_layer, obj_base_tile,	obj_pipe,	50);		// replace cable

// # wall
init_construction_new_single(macro_wall, "wall", spr_wall, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.wall,		base_layer,		obj_wall,		noone,		100);	// build inside
// ## dragging
init_construction_set_dragging(dragging.linear, 2);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.wall,		base_layer,		obj_wall,		noone,		100);	// build inside
init_construction_set_action(build_validation_i.inside, build_validation_o.wall_like,	map_buffer_action.wall,		noone,			noone,			noone,		0);		// over existing wall: nothing
init_construction_set_drag_parameter(macro_drag_vertical, macro_sprite, spr_wall_straight);
init_construction_set_drag_parameter(macro_drag_horizontal, macro_sprite, spr_wall_straight);
init_construction_set_drag_parameter(macro_drag_vertical, macro_angle, 90);
init_construction_set_drag_parameter(macro_drag_top, macro_angle, 90);
init_construction_set_drag_parameter(macro_drag_bottom, macro_angle, 270);
init_construction_set_drag_parameter(macro_drag_left, macro_angle, 180);

init_construction_set_drag_parameter(macro_drag_left, macro_sprite, spr_wall_end);
init_construction_set_drag_parameter(macro_drag_right, macro_sprite, spr_wall_end);
init_construction_set_drag_parameter(macro_drag_top, macro_sprite, spr_wall_end);
init_construction_set_drag_parameter(macro_drag_bottom, macro_sprite, spr_wall_end);

// # hatch
init_construction_new_multitile(macro_hatch, "hatch", spr_hatch, 3); // construction uses 3 tiles
init_construction_set_tile(0, 0, 1); // di, dj, action_count
init_construction_set_action(build_validation_i.outside, build_validation_o.wall,		map_buffer_action.wall_like, base_layer,	obj_hatch,		obj_wall,	100);	// build on outside wall
init_construction_set_tile(-1, 0, 1);
init_construction_set_validation(build_validation_i.outside, build_validation_o.wall_like);
init_construction_set_tile(1, 0, 1);
init_construction_set_validation(build_validation_i.outside, build_validation_o.wall_like);
init_construction_set_rotation_parameter(macro_rotation_1, macro_angle, 90); // sprite must be drawn at an angle with the rotation parameter
init_construction_set_rotation_parameter(macro_rotation_3, macro_angle, 90);

// # door
init_construction_new_multitile(macro_door, "door", spr_door, 3); // 3 tiles
init_construction_set_tile(0, 0, 2); // di, dj, action_count
init_construction_set_action(build_validation_i.inside, build_validation_o.wall,		map_buffer_action.wall_like, base_layer,	obj_door,		obj_wall,	100);	// build on inside wall
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.wall_like, base_layer,	obj_door,		noone,		200);	// build on inside vacancy
init_construction_set_tile(-1, 0, 1);
init_construction_set_validation(build_validation_i.any, build_validation_o.wall_like);
init_construction_set_tile(1, 0, 1);
init_construction_set_validation(build_validation_i.any, build_validation_o.wall_like);
init_construction_set_rotation_parameter(macro_rotation_1, macro_angle, 90);
init_construction_set_rotation_parameter(macro_rotation_3, macro_angle, 90);

// # suit closet
init_construction_new_single(macro_suit_closet, "space suit closet", spr_suit_closet, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_suit_closet, noone, 200);
init_construction_set_rotation_parameter(macro_rotation_1, macro_image, 1);
init_construction_set_rotation_parameter(macro_rotation_2, macro_image, 2);
init_construction_set_rotation_parameter(macro_rotation_3, macro_image, 3);

// # empty suit closet
init_construction_new_single(macro_suit_closet_empty, "empty suit closet", spr_suit_closet, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_suit_closet, noone, 100);
init_construction_set_rotation_parameter(macro_rotation_0, macro_image, 4);
init_construction_set_rotation_parameter(macro_rotation_1, macro_image, 5);
init_construction_set_rotation_parameter(macro_rotation_2, macro_image, 6);
init_construction_set_rotation_parameter(macro_rotation_3, macro_image, 7);

// # drill
init_construction_new_single(macro_drill, "drill", spr_drill_bottom, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.occupy,	base_tall_layer, obj_drill,		noone, 100);

// # sensor
init_construction_new_single(macro_sensor, "sensor", spr_sensor, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_sensor,		noone, 100);

// # battery
init_construction_new_single(macro_battery, "battery", spr_battery, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_battery,	noone, 100);

// # O2 tank
init_construction_new_single(macro_oxygen_tank, "oxygen tank", spr_oxygen_tank, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_oxygen_tank, noone, 100);

// # pump
init_construction_new_single(macro_pump, "pump", spr_pump, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_pump,		noone, 100);

// # cable
init_construction_new_single(macro_cable, "cable", spr_cable, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.for_cable,	map_buffer_action.cable,	base_layer,		obj_cable,		noone, 100);
init_construction_set_dragging(dragging.linear, 2);
init_construction_set_action(build_validation_i.outside, build_validation_o.cable,		map_buffer_action.nothing,	noone,			noone,			noone, 100);
init_construction_set_action(build_validation_i.outside, build_validation_o.for_cable,	map_buffer_action.cable,	base_layer,		obj_cable,		noone, 100);
init_construction_set_drag_parameter(macro_drag_vertical, macro_image, 2);
init_construction_set_drag_parameter(macro_drag_top, macro_image, 2);
init_construction_set_drag_parameter(macro_drag_bottom, macro_image, 2);

// # pipe
init_construction_new_single(macro_pipe, "pipe", spr_pipe, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.for_pipe,	map_buffer_action.pipe,		base_layer,		obj_pipe,		noone, 100);
init_construction_set_dragging(dragging.linear, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.pipe,		map_buffer_action.nothing,	noone,			noone,			noone, 100);
init_construction_set_action(build_validation_i.outside, build_validation_o.for_pipe,	map_buffer_action.pipe,		base_layer,		obj_pipe,		noone, 100);
init_construction_set_drag_parameter(macro_drag_vertical, macro_image, 1);
init_construction_set_drag_parameter(macro_drag_top, macro_image, 1);
init_construction_set_drag_parameter(macro_drag_bottom, macro_image, 1);

// # bed
init_construction_new_multitile(macro_bed, "bed", spr_bed_hud, 2);
init_construction_set_tile(0, 0, 1); // di, dj, action_count
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_bed,		noone, 100);
init_construction_set_tile(0, -1, 1); // di, dj, action_count
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	noone,			noone,			noone, 0);
// rotation behavior: change sprite
init_construction_set_rotation_parameter(macro_rotation_0, macro_sprite, spr_bed_vertical);
init_construction_set_rotation_parameter(macro_rotation_1, macro_sprite, spr_bed_horizontal);
init_construction_set_rotation_parameter(macro_rotation_2, macro_sprite, spr_bed_vertical_2);
init_construction_set_rotation_parameter(macro_rotation_3, macro_sprite, spr_bed_horizontal_2);

// # water reservoir
init_construction_new_single(macro_water_reservoir, "water reservoir", spr_water_reservoir, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_water_reservoir,	noone, 100);
init_construction_set_dragging(dragging.rectangular, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_water_reservoir,	noone, 100);

// # hydroponics
init_construction_new_single(macro_hydroponics, "hydroponics", spr_hydroponics_hud, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_tall_layer, obj_hydroponics,		noone, 100);

// # magic generator
init_construction_new_single(macro_magic_generator, "magic generator", spr_magic_generator, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_magic_generator,	noone, 100);

// # magic pump
init_construction_new_single(macro_magic_pump, "magic pump", spr_magic_pump, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_magic_pump,			noone, 100);

// # fridge
init_construction_new_single(macro_fridge, "refridgerator", spr_fridge_hud, 1);
init_construction_set_action(build_validation_i.inside, build_validation_o.vacant,		map_buffer_action.occupy,	base_tall_layer, obj_fridge,			noone, 100);
init_construction_set_rotation_parameter(macro_rotation_0, macro_image, 0);
init_construction_set_rotation_parameter(macro_rotation_1, macro_image, 1);
init_construction_set_rotation_parameter(macro_rotation_2, macro_image, 2);
init_construction_set_rotation_parameter(macro_rotation_3, macro_image, 3);

// # solar panel
init_construction_new_single(macro_solar_panel, "solar panel", spr_solar_panel, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_solar_panel,		noone, 100);
init_construction_set_dragging(dragging.rectangular, 1);
init_construction_set_action(build_validation_i.outside, build_validation_o.vacant,		map_buffer_action.occupy,	base_layer,		obj_solar_panel,		noone, 100);





// List of active constructions:
var active_constructions = ds_list_create();
global.active_constructions = active_constructions;
ds_list_add(active_constructions, macro_basetile);
ds_list_add(active_constructions, macro_wall);
ds_list_add(active_constructions, macro_hatch);
ds_list_add(active_constructions, macro_door);
ds_list_add(active_constructions, macro_suit_closet);
ds_list_add(active_constructions, macro_suit_closet_empty);
ds_list_add(active_constructions, macro_drill);
ds_list_add(active_constructions, macro_sensor);
ds_list_add(active_constructions, macro_battery);
ds_list_add(active_constructions, macro_oxygen_tank);
ds_list_add(active_constructions, macro_pump);
ds_list_add(active_constructions, macro_cable);
ds_list_add(active_constructions, macro_pipe);
ds_list_add(active_constructions, macro_bed);
ds_list_add(active_constructions, macro_water_reservoir);
ds_list_add(active_constructions, macro_hydroponics);
ds_list_add(active_constructions, macro_magic_generator);
ds_list_add(active_constructions, macro_magic_pump);
ds_list_add(active_constructions, macro_fridge);
ds_list_add(active_constructions, macro_solar_panel);