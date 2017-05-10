/// @description Insert description here
// You can write your code in this editor
draw_self();

// draw oxygen bar
if(holds_suit && suit_oxygen < 100)
{
	draw_healthbar(x - 12, y - 15, x + 12, y - 13, suit_oxygen, c_black, global.oxygen_bar_color, global.oxygen_bar_color, 0, true, false);
}

event_inherited();