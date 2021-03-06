/// @param role		the role in the grid
/// @param value	the value (based on role it's either production/consumption/storage)

var arg_role = argument0;
var arg_value = argument1;

var new_grid_props;
if(arg_role == macro_grid_role_storage) new_grid_props[macro_grid_storage_level] = 0;
new_grid_props[macro_grid_prop_can_perform_role] = true;
new_grid_props[macro_grid_prop_value] = arg_value;
new_grid_props[macro_grid_prop_role] = arg_role;
new_grid_props[macro_grid_prop_grid] = noone;

return new_grid_props;