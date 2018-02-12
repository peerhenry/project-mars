/// @param i
/// @param j
/// @param action
/// @param previous_o	previous map buffer cell occupation
var arg_i = argument0;
var arg_j = argument1;
var arg_action = argument2;

if(global.map_buffer< 0) exit;

var map_value = scr_map_buffer_get_cell(arg_i, arg_j);
var map_i = (map_value & 1);		// first bit tells if the cell is inside
var map_o = (map_value >> 1) & 127; // next 7 bits store occupation
var map_r = (map_value >> 8) & 255; // another byte for resource

var new_i = map_i;
var new_o = map_o;
var new_r = map_r;

// modify map_buffer
switch(arg_action)
{
	case map_buffer_action.nothing:
		exit;
	case map_buffer_action.clear:
		new_o = map_value_vacant;
		break;
	case map_buffer_action.reserve:
		new_o = map_value_reserved;
		break;
	case map_buffer_action.occupy:
		new_o = map_value_occupied;
		break;
	case map_buffer_action.wall_like:	// something that connects to walls (like doors)
		new_o = map_value_wall_like;
		break;
	case map_buffer_action.wall:
		new_o = map_value_wall_pure;
		break;
	case map_buffer_action.clear_and_inside:
		new_o = map_value_vacant;
	case map_buffer_action.inside:
		new_i = 1;
		break;
	case map_buffer_action.clear_and_outside:
		new_o = map_value_vacant;
	case map_buffer_action.outside:
		new_i = 0;
		break;
	case map_buffer_action.cable:
		new_o = map_value_cable;
		if(map_o == map_value_pipe || instance_position(scr_gi_to_rc(arg_i), scr_gi_to_rc(arg_j), obj_pipe) != noone)
		{
			new_o = map_value_pipe_and_cable;
		}
		break;
	case map_buffer_action.pipe:
		new_o = map_value_pipe;
		if(map_o == map_value_cable || instance_position(scr_gi_to_rc(arg_i), scr_gi_to_rc(arg_j), obj_cable) != noone)
		{
			new_o = map_value_pipe_and_cable;
		}
		break;
	case map_buffer_action.clear_pipe:
		var new_o = map_value_vacant;
		if(map_o == map_value_pipe_and_cable)
		{
			new_o = map_value_cable;
		}
		break;
	case map_buffer_action.clear_cable:
		var new_o = map_value_vacant;
		if(map_o == map_value_pipe_and_cable)
		{
			new_o = map_value_pipe;
		}
		break;
}

var new_value = (new_r << 8) + (new_o << 1) + new_i;
scr_map_buffer_set_cell(arg_i, arg_j, new_value);