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

scr_setup_room(i_or, j_or, r_width, r_height);
scr_setup_room(i_or + i_step, j_or, r_width, r_height);
scr_setup_room(i_or + 2*i_step, j_or, r_width, r_height);

scr_setup_cable(i_or + r_width + 1 + 2*i_step, j_or, i_or + 3*i_step - 1, j_or);
scr_setup_solar_array(i_or + 3*i_step, j_or, r_width, r_height);

scr_setup_room(i_or, j_or + j_step, r_width, r_height);
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

// o2 tank
scr_setup_single_tile_construction(i_or, j_or, macro_oxygen_tank, 0);
var tank = instance_position(scr_gi_to_rc(i_or), scr_gi_to_rc(j_or), obj_oxygen_tank);
with(tank)
{
	
}
