/// @arg astronaut
var arg_astronaut = argument0;

// move to center of current grid cell.
var center_x = scr_rc_clamp_center(arg_astronaut.x);
var center_y = scr_rc_clamp_center(arg_astronaut.y);
if(center_x == arg_astronaut.x && center_y == arg_astronaut.y)
{
	scr_stop_moving(arg_astronaut);
}
else scr_navigate(arg_astronaut, center_x, center_y);