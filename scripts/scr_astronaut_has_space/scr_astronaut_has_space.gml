/// @descrtiption checks if any free space within 3x3 inventory grid
/// @param astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	return ds_grid_value_exists(inventory, 0, 0, 2, 2, macro_inventory_empty);
}