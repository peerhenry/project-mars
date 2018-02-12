/// @arg i
/// @arg j
/// @arg validation_inside
/// @arg validation_occupation
/// @arg owner
var arg_i = argument0;
var arg_j = argument1;
var validation_i = argument2;
var validation_o = argument3;
var arg_owner = argument4;

var map_value = scr_map_buffer_get_cell(arg_i, arg_j);
var map_i = (map_value & 1);
var map_o = (map_value >> 1) & 127; // next 7 bytes store o

var i_is_valid = scr_validate_i(validation_i, map_i);
var o_is_valid = scr_validate_o(validation_o, map_o, arg_i, arg_j);
var validation_passed = i_is_valid && o_is_valid;
if(validation_passed && !global.init_stage) // validate ownership
{
	var target_x = scr_gi_to_rc(arg_i);
	var target_y = scr_gi_to_rc(arg_j);
	if(validation_i == build_validation_i.inside)
	{
		var tile = instance_position(target_x, target_y, obj_base_tile);
		validation_passed = tile.owner == arg_owner;
	}
	if(validation_passed && validation_o == build_validation_o.wall)
	{
		var wall = instance_position(target_x, target_y, obj_wall);
		validation_passed = wall.owner == arg_owner ;
	}
}
return validation_passed;