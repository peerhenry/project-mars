/// @arg i
/// @arg j
/// @arg object_index
var arg_i = argument0;
var arg_j = argument1;
var arg_object_index = argument2;

var output = true;
switch(arg_object_index)
{
	case obj_hatch:
		// one side must be a room, the other outside
		var rot_param = global.construction_ghost[? macro_ghost_rotation];
		var connects_horizontally  = (rot_param == 1 || rot_param == 3);
		var t_x = scr_gi_to_rc(arg_i);
		var t_y = scr_gi_to_rc(arg_j);
		if(connects_horizontally)
		{
			var side1 = position_meeting(t_x + 32, t_y, obj_base_tile);
			var side2 = position_meeting(t_x - 32, t_y, obj_base_tile);
			output = (side1 && !side2) || (!side1 && side2);
		}
		else
		{
			var side1 = position_meeting(t_x, t_y + 32, obj_base_tile);
			var side2 = position_meeting(t_x, t_y - 32, obj_base_tile);
			output = (side1 && !side2) || (!side1 && side2);
		}
		break;
}
return output;