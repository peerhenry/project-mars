var arg_x = argument0;
var arg_y = argument1;
var arg_build = argument2;

switch(arg_build)
{
	case build.basetile:
		scr_update_walls_around_new_basetile(arg_x, arg_y);
		break;
	case build.wall:
		scr_update_wall_and_adjacents(arg_x, arg_y);
		break;
	case build.door:
		scr_update_adjacent_walls(arg_x, arg_y);
		break;
	case build.hatch:
		scr_update_adjacent_walls(arg_x, arg_y);
		break;
}