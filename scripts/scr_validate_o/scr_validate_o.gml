// validate occupation: is there a required occupation on the cell?
validation_o = argument0;
map_o = argument1;
arg_i = argument2;
arg_j = argument3;

switch(validation_o)
{
	case build_validation_o.vacant:
		return map_o == global.vacant && scr_navgrid_cell_is_free(arg_i, arg_j);
	case build_validation_o.unoccupied:
		return (map_o == global.vacant || map_o == global.reserved) && scr_navgrid_cell_is_free(arg_i, arg_j);
	case build_validation_o.wall_like:
		return map_o == global.wall_like || map_o == global.wall_pure;
	case build_validation_o.any:
		return true;
	case build_validation_o.wall:
		return map_o == global.wall_pure;
	default:
		return false;
}