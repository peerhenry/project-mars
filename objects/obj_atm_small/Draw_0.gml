draw_self();
scr_draw_mask(id);
if(is_selected)
{
	var h = sprite_get_height(sprite_index);
	var w_half = sprite_get_width(sprite_index)/2;
	draw_set_color(c_aqua);
	draw_rectangle(x - w_half, y + 16 - h + 64, x + w_half, y + 15 + 32, true);
}