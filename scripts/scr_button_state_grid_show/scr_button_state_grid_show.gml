/// @arg button
var arg_button = argument0;

var active = false;
var this_grid = arg_button.grid;
with(obj_gui_grid_details_panel)
{
	active = (this_grid == grid);
}
return active;