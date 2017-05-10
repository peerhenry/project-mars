/// @description Insert description here
// You can write your code in this editor
//image_angle = 0;

if(is_selected)
{
	draw_set_colour(c_black);
	var onlyOutline = true;
	//draw_rectangle(x-16, y-16, x+16, y+16, onlyOutline);	
	draw_sprite(spr_selection, 0, x, y);
}

draw_healthbar(x - 12, y - 17, x + 12, y - 15, astronaut_health, c_black, c_red, c_lime, 0, true, false)
if(wears_suit) 	// draw oxygen bar
{
	draw_healthbar(x - 12, y - 15, x + 12, y - 13, suit_oxygen, c_black, global.oxygen_bar_color, global.oxygen_bar_color, 0, true, false);
}
draw_self();