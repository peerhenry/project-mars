/// @descrtiption gets a free space within inventory grid, returns a 16-bit number: 8 bit per coordinate
/// @param astronaut
var arg_inventory = argument0;

var width = ds_grid_width(arg_inventory);
var height = ds_grid_height(arg_inventory);

if(!ds_grid_value_exists(arg_inventory, 0, 0, width, height, macro_inventory_empty)) return -1;
var x_val = ds_grid_value_x(arg_inventory, 0, 0, width, height, macro_inventory_empty);
var y_val = ds_grid_value_y(arg_inventory, 0, 0, width, height, macro_inventory_empty);
return ((x_val << 8) + y_val);