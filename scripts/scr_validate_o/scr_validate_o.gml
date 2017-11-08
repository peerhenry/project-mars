// validate occupation: is there a required occupation on the cell?
validation_o = argument0;
map_o = argument1;
arg_i = argument2;
arg_j = argument3;

var result = false;

switch(validation_o)
{
	case build_validation_o.vacant:
		result = map_o == map_value_vacant && scr_navgrid_cell_is_free(arg_i, arg_j);
		break;
	case build_validation_o.vacant_or_reserved:
		result = (map_o == map_value_vacant || map_o == map_value_reserved) && scr_navgrid_cell_is_free(arg_i, arg_j);
		break;
	case build_validation_o.wall_like:
		result = map_o == map_value_wall_like || map_o == map_value_wall_pure;
		break;
	case build_validation_o.any:
		result = true;
		break;
	case build_validation_o.wall:
		result = map_o == map_value_wall_pure;
		break;
	case build_validation_o.cable:
		result = map_o == map_value_cable || map_o = map_value_pipe_and_cable;
		break;
	case build_validation_o.pipe:
		result = map_o == map_value_pipe || map_o = map_value_pipe_and_cable;
		break;
	case build_validation_o.for_pipe:
		with(obj_astronaut)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
			scr_navgrid_clear_cell(dest_i, dest_j);
		}
		result = (map_o == map_value_vacant && scr_navgrid_cell_is_free(arg_i, arg_j)) || map_o == map_value_cable;
		with(obj_astronaut)
		{
			scr_navgrid_occupy(occ_i, occ_j);
			scr_navgrid_occupy(dest_i, dest_j);
		}
		break;
	case build_validation_o.for_cable:
		with(obj_astronaut)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
			scr_navgrid_clear_cell(dest_i, dest_j);
		}
		result = (map_o == map_value_vacant && scr_navgrid_cell_is_free(arg_i, arg_j)) || map_o == map_value_pipe;
		with(obj_astronaut)
		{
			scr_navgrid_occupy(occ_i, occ_j);
			scr_navgrid_occupy(dest_i, dest_j);
		}
		break;
}
return result;