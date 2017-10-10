// hardcoded constructable logic
if(under_construction)
{
	event_inherited();
	exit;
}

draw_self();

// draw oxygen bar
if(holds_suit && suit_oxygen < 100)
{
	draw_healthbar(
		x - 12, y - 15, 
		x + 12, y - 13, 
		suit_oxygen, 
		c_black, 
		oxygen_bar_color, 
		oxygen_bar_color, 
		0, 
		true, 
		false
	);
}

event_inherited(); // may draw the assigned icon