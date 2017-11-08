event_inherited();
if(instance_position(x, y, obj_wall) == noone)
{
	// if theres no wall, free navgrid
	scr_navgrid_clear_cell(occ_i, occ_j);
}