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
	target_i += scr_get_delta_i(counter);
	target_j += scr_get_delta_j(counter);
	free = scr_navgrid_cell_is_free(target_i, target_j);
	counter++;
}
if(!free) return noone;
return tuple(target_i, target_j);