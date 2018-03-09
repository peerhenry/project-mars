/// @arg i
/// @arg j
/// @arg room_width
/// @arg room_height
/// @arg hall_spacing
var i = argument0;
var j = argument1;
var r_width = argument2;
var r_height = argument3;
var hall_length = argument4;

var i_or = i+1;
var j_or = j+1;

var i_step = r_width + hall_length + 2;
if(hall_length == 0) i_step = r_width + 1;

var j_step = r_height + hall_length + 2;
if(hall_length == 0) j_step = r_height + 1;

scr_setup_room(i_or, j_or, r_width, r_height); // room 1
scr_setup_room(i_or + i_step, j_or, r_width, r_height);
scr_setup_room(i_or + 2*i_step, j_or, r_width, r_height);

var solar_j = j_or + j_step;
scr_setup_cable(i_or + r_width + 1 + 2*i_step, solar_j, i_or + 3*i_step - 1, solar_j);
scr_setup_solar_array(i_or + 3*i_step, solar_j, r_width, r_height);

scr_setup_room(i_or, j_or + j_step, r_width, r_height); // room 4
scr_setup_room(i_or + i_step, j_or + j_step, r_width, r_height);
scr_setup_room(i_or + 2*i_step, j_or + j_step, r_width, r_height);

if(hall_length > 0)
{
	var hall_i = i_or + floor(r_width/2);
	var hall_j = j_or + floor(r_height/2);
	
	// horizontal halls
	scr_setup_hall(i_or + r_width, hall_j, i_or + i_step - 1, hall_j);
	scr_setup_hall(i_or + i_step + r_width, hall_j, i_or + 2*i_step - 1, hall_j);
	scr_setup_hall(i_or + r_width, hall_j + j_step, i_or + i_step - 1, hall_j + j_step);
	scr_setup_hall(i_or + i_step + r_width, hall_j + j_step, i_or + 2*i_step - 1, hall_j + j_step);

	// vertical halls
	scr_setup_hall(hall_i, j_or + r_height, hall_i, j_or + j_step - 1);
	scr_setup_hall(hall_i + i_step, j_or + r_height, hall_i + i_step, j_or + j_step - 1);
	scr_setup_hall(hall_i + 2*i_step, j_or + r_height, hall_i + 2*i_step, j_or + j_step - 1);
}

// hatch
var hatch_start_i = i_or + i_step + floor(r_width/2);
var hatch_start_j = j_or + j_step + r_height;
var hatch_end_i = hatch_start_i;
var hatch_end_j = hatch_start_j + 4;
scr_setup_hatch_hall(
	hatch_start_i, 
	hatch_start_j, 
	hatch_end_i, 
	hatch_end_j
);

// room 1: o2 tanks
scr_setup_single_tile_construction(i_or, j_or, macro_oxygen_tank, 0);
scr_setup_single_tile_construction(i_or+1, j_or, macro_oxygen_tank, 0);
scr_setup_single_tile_construction(i_or+2, j_or, macro_oxygen_tank, 0);
scr_setup_single_tile_construction(i_or+3, j_or, macro_oxygen_tank, 0);
scr_setup_single_tile_construction(i_or+4, j_or, macro_oxygen_tank, 0);
//var tank = instance_position(scr_gi_to_rc(i_or), scr_gi_to_rc(j_or), obj_oxygen_tank);
//scr_set_new_grid_props(tank, macro_grid_oxygen, macro_grid_storage_level, 1);

// room 2: water
scr_setup_dragging(i_or + i_step + 1, j_or + 1, r_width - 2, r_height - 2, macro_water_reservoir);

// room 3: electrolysers
var el_i = i_or + 2*i_step;
var el_j = j_or;
scr_setup_single_tile_construction(el_i, el_j, macro_electrolyser, 0);
scr_setup_single_tile_construction(el_i+1, el_j, macro_electrolyser, 0);
scr_setup_single_tile_construction(el_i+2, el_j, macro_electrolyser, 0);
scr_setup_single_tile_construction(el_i+3, el_j, macro_electrolyser, 0);
scr_setup_single_tile_construction(el_i+4, el_j, macro_electrolyser, 0);

// room 4: beds
scr_setup_single_tile_construction(i_or, j_or + j_step + 1, macro_bed, 0);
scr_setup_single_tile_construction(i_or, j_or + j_step + 4, macro_bed, 0);
scr_setup_single_tile_construction(i_or+4, j_or + j_step + 1, macro_bed, 0);
scr_setup_single_tile_construction(i_or+4, j_or + j_step + 4, macro_bed, 0);

// room 5: suit closets
scr_setup_single_tile_construction(i_or + i_step, j_or + j_step, macro_suit_closet, 0);
scr_setup_single_tile_construction(i_or + i_step, j_or + j_step + 1, macro_suit_closet, 0);
scr_setup_single_tile_construction(i_or + i_step, j_or + j_step + r_height - 1, macro_suit_closet, 0);
scr_setup_single_tile_construction(i_or + i_step, j_or + j_step + r_height - 2, macro_suit_closet, 0);
scr_setup_single_tile_construction(i_or + i_step + r_width - 1, j_or + j_step + r_height - 1, macro_suit_closet, 2);
scr_setup_single_tile_construction(i_or + i_step + r_width - 1, j_or + j_step + r_height - 2, macro_suit_closet, 2);

if(global.default_owner == macro_player)
{
	scr_setup_single_tile_construction(i_or + i_step + r_width - 1, j_or + j_step, macro_fridge, 0);
	with(obj_fridge)
	{
		scr_give_entity_new_item(id, inv_space.food);
	}
}

// room 6: hydroponics
var hydro_i = i_or + 2*i_step + 1;
var hydro_j = j_or + j_step + 1
scr_setup_single_tile_construction(hydro_i, hydro_j, macro_hydroponics, 0);
scr_setup_single_tile_construction(hydro_i+1, hydro_j, macro_hydroponics, 0);
scr_setup_single_tile_construction(hydro_i+2, hydro_j, macro_hydroponics, 0);
scr_setup_single_tile_construction(hydro_i, hydro_j+2, macro_hydroponics, 0);
scr_setup_single_tile_construction(hydro_i+1, hydro_j+2, macro_hydroponics, 0);
scr_setup_single_tile_construction(hydro_i+2, hydro_j+2, macro_hydroponics, 0);

// outside...
// water
var drill_i = i_or + r_width + 3 + 2*i_step;
var drill_j = j_or;
var container = global.script_container;
var get_layer_for = script_container_resolve(container, "get_layer_for");
var res_layer = script_execute(get_layer_for, obj_resource_water);
instance_create_layer(scr_gi_to_rc(drill_i), scr_gi_to_rc(drill_j), res_layer, obj_resource_water);
instance_create_layer(scr_gi_to_rc(drill_i), scr_gi_to_rc(drill_j+2), res_layer, obj_resource_water);
// drill
scr_setup_single_tile_construction(drill_i, drill_j, macro_drill, 0);
scr_setup_single_tile_construction(drill_i, drill_j+2, macro_drill, 0);
// pump
scr_setup_single_tile_construction(drill_i - 1, drill_j, macro_pump, 0);
scr_setup_single_tile_construction(drill_i - 1, drill_j+2, macro_pump, 0);
// cable
scr_setup_cable(drill_i-2, drill_j + 1, drill_i, drill_j + 1);
// pipe
scr_setup_single_tile_construction(drill_i - 2, drill_j, macro_pipe, 0);
scr_setup_single_tile_construction(drill_i - 2, drill_j+2, macro_pipe, 0);
