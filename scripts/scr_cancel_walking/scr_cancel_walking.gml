/// @arg astronaut
scr_trace("cancel moving");
var arg_entity = argument0;

// move to center of current grid cell.
var center_x = scr_rc_clamp_center(arg_entity.x);
var center_y = scr_rc_clamp_center(arg_entity.y);
if(center_x == arg_entity.x && center_y == arg_entity.y)
{
	scr_stop_moving(arg_entity);
}
else scr_navigate(arg_entity, center_x, center_y);