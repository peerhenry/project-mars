/// @arg script_container
/// @arg destruct_target
/// @arg wall
var arg_container = argument0;
var arg_target = argument1;
var arg_wall = argument2;

var will_stay = false;
var wall_surrounding_basetiles = scr_get_surrounding_instances(arg_wall, obj_base_tile);
for(var p = 0; p<8; p++)
{
	var wall_sur_basetile = wall_surrounding_basetiles[p];
	if(wall_sur_basetile != noone)
	{
		var abs_di = abs(wall_sur_basetile.occ_i - arg_target.occ_i);
		var abs_dj = abs(wall_sur_basetile.occ_j - arg_target.occ_j);
		if(abs_di > 1 || abs_dj > 1)
		{
			will_stay = true;
			break;
		}
	}
}
if(!will_stay)
{
	scr_create_destruct_ghost_cell(arg_container, arg_wall, obj_destruct_placemarker);
}