/// @param i
/// @param j
/// @param action
/// @param previous_o	previous map buffer cell occupation
var arg_i = argument0;
var arg_j = argument1;
var arg_action = argument2;

var map_value = scr_map_buffer_get_cell(arg_i, arg_j);
var map_i = (map_value & 1);		// first bit tells if the cell is inside
var map_o = (map_value >> 1) & 127; // next 7 bits store occupation
var map_r = (map_value >> 8) & 255; // another byte for resource

// modify map_buffer
switch(arg_action)
{
	case map_buffer_action.clear:
		var new_value = (map_r << 8) + (map_value_vacant << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.nothing:
		break;
	case map_buffer_action.occupy:
		var new_value = (map_r << 8) + (map_value_occupied << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.wall_like:	// something that connects to walls (like doors)
		var new_value = (map_r << 8) + (map_value_wall_like << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.wall:
		var new_value = (map_r << 8) + (map_value_wall_pure << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.inside:
		var new_value = (map_r << 8) + (map_value_vacant << 1) + 1;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.cable:
		var new_o = map_value_cable;
		if(map_o == map_value_pipe || instance_position(scr_gi_to_rc(arg_i), scr_gi_to_rc(arg_j), obj_pipe) != noone)
		{
			new_o = map_value_pipe_and_cable;
		}
		var new_value = (map_r << 8) + (new_o << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.pipe:
		var new_o = map_value_pipe;
		if(map_o == map_value_cable || instance_position(scr_gi_to_rc(arg_i), scr_gi_to_rc(arg_j), obj_cable) != noone)
		{
			new_o = map_value_pipe_and_cable;
		}
		var new_value = (map_r << 8) + (new_o << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
}