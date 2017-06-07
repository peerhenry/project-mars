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
		var new_value = (map_r << 8) + (global.vacant << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.nothing:
		break;
	case map_buffer_action.reserve:
		var new_value = (map_r << 8) + (global.reserved << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.occupy:
		var new_value = (map_r << 8) + (global.occupied << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.wall_like:	// something that connects to walls (like doors)
		var new_value = (map_r << 8) + (global.wall_like << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.wall:
		var new_value = (map_r << 8) + (global.wall_pure << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.inside:
		var new_value = (map_r << 8) + (global.vacant << 1) + 1;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.under_construction:
		var new_value = (map_r << 8) + (global.under_construction << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
	case map_buffer_action.cable:
		var new_value = (map_r << 8) + (global.cable << 1) + map_i;
		scr_map_buffer_set_cell(arg_i, arg_j, new_value);
		break;
}