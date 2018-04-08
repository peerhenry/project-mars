if(global.hovering_over_gui)
{
	is_dragging	= false;
	exit; // GUI clicks must not propagate
}
scr_mouse_step(id);