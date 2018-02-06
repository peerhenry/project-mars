/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;

var ass_i = arg_assignable.occ_i;
var ass_j = arg_assignable.occ_j;
var astro_i = arg_astronaut.occ_i;
var astro_j = arg_astronaut.occ_j;

var di = astro_i - ass_i;
var dj = astro_j - ass_j;
var closest_side = macro_south;
if(dj > di)
{
	if(dj > -di) closest_side = macro_south;
	else closest_side = macro_west;
}
else
{
	if(dj > -di) closest_side = macro_east;
	else closest_side = macro_north;
}

switch(arg_assignable.object_index)
{
	case obj_bed:
	case obj_operating_table:
		return scr_get_spots_rec(arg_assignable, arg_astronaut, closest_side);
	default:
		return scr_get_spots_square(arg_assignable, arg_astronaut, closest_side);
}