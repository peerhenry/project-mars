/// @arg i
/// @arg j
var arg_i = argument0;
var arg_j = argument1;

var target_i = arg_i;
var target_j = arg_j;
var free = scr_navgrid_cell_is_free(target_i, target_j);
var counter = 0;
while(!free && counter < 100)
{
	var delta_ij = in(f_spiral_square, "get_delta_ij");
	target_i += delta_ij[0];
	target_j += delta_ij[1];
	free = scr_navgrid_cell_is_free(target_i, target_j);
	counter++;
}
if(!free) return noone;
return tuple(target_i, target_j);