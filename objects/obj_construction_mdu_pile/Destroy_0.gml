/// @description Insert description here
// You can write your code in this editor

// only if construction does not occupy navgrid

var constr = instance_position(x, y, obj_constructable);
with(constr)
{
	if(!constr.occupy_navgrid) scr_navgrid_clear_cell(occ_i, occ_j);
}