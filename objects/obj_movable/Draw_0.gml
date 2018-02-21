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
draw_healthbar(x - 12, y - 17, x + 12, y - 15, entity_health, c_black, c_red, c_lime, 0, true, false);