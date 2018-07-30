/// @description Insert description here
// You can write your code in this editor

// only if construction does not occupy navgrid

var constr = instance_position(x, y, obj_constructable);
with(constr)
{
	if(!constr.occupy_navgrid)
	{
		// the construcable might be the basetile underneath the thing constructed, so also check for base component
		var comp = instance_position(x, y, obj_base_component);
		var cancel_clearing = (comp != noone && comp.occupy_navgrid);
		if(!cancel_clearing) scr_navgrid_clear_cell(occ_i, occ_j);
	}
}