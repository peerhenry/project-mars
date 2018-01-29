draw_healthbar(x - 12, y - 17, x + 12, y - 15, astronaut_health, c_black, c_red, c_lime, 0, true, false)
draw_sprite(spr_shadow, 0, x, y);
if(wears_suit) 	// draw oxygen bar
{
	draw_healthbar(x - 12, y - 15, x + 12, y - 13, suit_oxygen, c_black, global.oxygen_bar_color, global.oxygen_bar_color, 0, true, false);
}

draw_self();

scr_draw_mask(id);