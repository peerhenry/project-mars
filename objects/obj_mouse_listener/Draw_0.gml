
// don't draw if hovering over hud
if(global.hovering_over_HUD) exit;

var construct = global.construct;

// selection rectangle
if(is_dragging && construct == noone){
	draw_set_colour(c_aqua);
	draw_rectangle(click_x, click_y, mouse_x, mouse_y, true);
}

// construction ghost
if(construct != noone)
{
	scr_draw_ghost(
		click_x, 
		click_y, 
		mouse_x, 
		mouse_y, 
		construct, 
		global.build_rotation, 
		is_dragging
	);
}