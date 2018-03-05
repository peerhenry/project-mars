/// @description selection box, self, mask and health bar

// selected box
if(is_selected)
{
	draw_set_colour(c_black);
	var onlyOutline = true;
	//draw_rectangle(x-16, y-16, x+16, y+16, onlyOutline);	
	draw_sprite(spr_selection, 0, x, y);
}

draw_self();
scr_draw_mask(id);
if(entity_health < 100)
{
	var hc = health_bar_color;
	if(entity_health < 20) hc = c_red;
	else if(entity_health < 50) hc = c_yellow;
	draw_healthbar(x - 12, y - 17, x + 12, y - 15, entity_health, c_black, hc, hc, 0, true, true);
}