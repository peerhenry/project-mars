/// @param grid_type
var arg_grid_type = argument0;

var logic_layer = layer_get_id("logic");
var new_grid = instance_create_layer(0, 0, "logic", obj_grid);
with(new_grid)
{
	grid_type = arg_grid_type;
}
return new_grid;