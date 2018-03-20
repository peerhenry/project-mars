/// @arg unit
/// @arg left
/// @arg top
/// @arg width
/// @arg height
/// @arg sprite
/// @arg grid
var unit = argument0;
var left = argument1;
var top = argument2;
var width = argument3;
var height = argument4;
var sprite = argument5;
var arg_grid = argument6;
var button = scr_create_panel_icon_button(unit, left, top, width, height, sprite, details_panel_action.show_grid_details);
button.grid = arg_grid;
return button;