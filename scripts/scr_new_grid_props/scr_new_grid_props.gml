/// @param role		the role in the grid
/// @param value	the value (based on role it's either production/consumption/storage)

var arg_role = argument0;
var arg_value = argument1;

var new_grid_props;
new_grid_props[macro_grid_component_active] = true;
new_grid_props[macro_grid_component_value] = arg_value;
new_grid_props[macro_grid_component_role] = arg_role;

return new_grid_props;