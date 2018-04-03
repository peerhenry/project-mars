if(under_construction)
{
	event_inherited();
	exit;
}

draw_self();

if(locked)
{
	var lock_y = y;
	if(global.draw_tall_walls) lock_y = y - 16;
	draw_sprite(spr_locked, 0, x, lock_y);
}

if(is_selected)
{
	var h = sprite_get_height(sprite_index);
	var w_half = sprite_get_width(sprite_index)/2;
	draw_set_color(c_aqua);
	draw_rectangle(x - w_half, y + 16 - h, x + w_half - 1, y + 15, true);
}