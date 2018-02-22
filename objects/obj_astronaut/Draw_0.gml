draw_sprite(spr_shadow, 0, x, y);

event_inherited();

if(wears_suit && owner == macro_player) 	// draw oxygen bar
{
	draw_healthbar(x - 12, y - 13, x + 12, y - 11, suit_oxygen, c_black, oxygen_bar_color, oxygen_bar_color, 0, true, true);
}