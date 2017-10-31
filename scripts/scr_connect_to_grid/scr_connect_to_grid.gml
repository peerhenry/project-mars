/// @description Adds component to grid and sets grid in component
/// @param grid
/// @param component
var arg_grid = argument0;
var arg_component = argument1;

scr_trace_script("scr_connect_to_grid", [argument0, argument1]);
debug_type(arg_grid, obj_grid);

with(arg_grid)
{
	// Get component's grid props
	var component_grid_props = scr_get_grid_props(arg_component, grid_type);
	
	// Add component to grid's relevant list
	scr_add_to_grid_logic_map(arg_grid, arg_component);
	
	// Add component to grid's tile map (only construcables take up tiles)
	if(object_is_ancestor(arg_component.object_index, obj_constructable))
	{
		scr_add_to_grid_tile_map(arg_grid, arg_component);
	}
	else
	{
		// Is allowed: for example rooms for oxygen grid
	}
	
	// Set grid in component
	component_grid_props[@macro_grid_prop_grid] = arg_grid;
}