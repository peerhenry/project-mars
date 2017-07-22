/// @descrtiption gets a free space within 3x3 inventory grid, returns a 4bit number; 2bit per coordinate
/// @param astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(ds_grid_value_exists(inventory, 0, 0, 2, 2, macro_inventory_empty)) return -1;
	var x_val = ds_grid_value_x(inventory, 0,0,2,2, macro_inventory_empty);
	var y_val = ds_grid_value_y(inventory, 0,0,2,2, macro_inventory_empty);
	return ((x_val << 2) + y_val);
}