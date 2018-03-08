/// @arg hud
/// @arg x
/// @arg y
/// @arg sprite
/// @arg action
var hud = argument0;
var arg_x = argument1;
var arg_y = argument2;
var arg_sprite = argument3;
var arg_action = argument4;

var button = scr_add_hud_button_ext(
	hud, 
	arg_x, 
	arg_x + 36, 
	arg_y, 
	arg_y + 36, 
	noone, 
	"", 
	arg_x + 2, 
	arg_y + 2, 
	arg_sprite, 
	arg_action
);

button.draw_as_panel = false;