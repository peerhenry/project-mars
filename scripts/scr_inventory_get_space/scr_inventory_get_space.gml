/// @descrtiption gets a free space within inventory grid, returns a 16-bit number: 8 bit per coordinate
/// @param astronaut
var arg_inventory = argument0;

var width = arg_inventory.width;
var height = arg_inventory.height;

if(!ds_grid_value_exists(arg_inventory.space, 0, 0, width, height, inv_space.empty)) return -1;
var x_val = ds_grid_value_x(arg_inventory.space, 0, 0, width, height, inv_space.empty);
var y_val = ds_grid_value_y(arg_inventory.space, 0, 0, width, height, inv_space.empty);
return ((x_val << 8) + y_val);