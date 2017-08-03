
// don't draw if hovering over hud
if(global.hovering_over_HUD) exit;

var construction = global.construct;

// Draw selection rectangle
if(is_dragging && construction == noone)
{
	draw_set_colour(c_aqua);
	draw_rectangle(click_x, click_y, mouse_x, mouse_y, true);
}

// Draw construction ghost
if(construction != noone)
{
	scr_draw_ghost();
}