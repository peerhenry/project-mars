/// @arg destruct_target
/// @arg wall
var arg_target = argument0;
var arg_hatch = argument1;

var needs_wall = false;
var hatch_surrounding_basetiles = scr_get_surrounding_instances(arg_hatch, obj_base_tile);
for(var p = 0; p<8; p++)
{
	var wall_sur_basetile = hatch_surrounding_basetiles[p];
	if(wall_sur_basetile != noone)
	{
		var abs_di = abs(wall_sur_basetile.occ_i - arg_target.occ_i);
		var abs_dj = abs(wall_sur_basetile.occ_j - arg_target.occ_j);
		if(abs_di > 1 || abs_dj > 1)
		{
			needs_wall = true;
			break;
		}
	}
}
if(!needs_wall)
{
	scr_create_destruct_ghost_cell(arg_hatch, obj_destruct_placemarker);
}
else
{
	scr_create_destruct_ghost_cell(arg_hatch, obj_wall);
}