var arg_action = argument0;
var map_r = argument1;
var map_i = argument2;
var target_i = argument3;
var target_j = argument4;
var object_to_remove = argument5;
var object_to_add = argument6;
var b_layer = argument7;
var metal_cost = argument8;

// modify map_buffer
switch(arg_action)
{
	case map_buffer_action.clear:
		var new_value = (map_r << 8) + (global.vacant << 1) + map_i;
		scr_map_buffer_set_cell(target_i, target_j, new_value);
		break;
	case map_buffer_action.nothing:
		break;
	case map_buffer_action.reserve:
		var new_value = (map_r << 8) + (global.reserved << 1) + map_i;
		scr_map_buffer_set_cell(target_i, target_j, new_value);
		break;
	case map_buffer_action.occupy:
		var new_value = (map_r << 8) + (global.occupied << 1) + map_i;
		scr_map_buffer_set_cell(target_i, target_j, new_value);
		break;
	case map_buffer_action.wall_like:
		var new_value = (map_r << 8) + (global.wall_like << 1) + map_i;
		scr_map_buffer_set_cell(target_i, target_j, new_value);
		break;
	case map_buffer_action.wall:
		var new_value = (map_r << 8) + (global.wall_pure << 1) + map_i;
		scr_map_buffer_set_cell(target_i, target_j, new_value);
		break;
	case map_buffer_action.inside:
		var new_value = (map_r << 8) + (global.vacant << 1) + 1;
		scr_map_buffer_set_cell(target_i, target_j, new_value);
		break;
}
	
var target_x = scr_gi_to_rc(target_i);
var target_y = scr_gi_to_rc(target_j);
	
// remove object
if(object_to_remove != noone)
{
	var instance = instance_position(target_x, target_y, object_to_remove);
	with(instance) instance_destroy();
}

scr_add_metal(-metal_cost);
	
// add object
if(object_to_add != noone)
{
	return instance_create_layer(target_x, target_y, b_layer, object_to_add);
}

return noone;