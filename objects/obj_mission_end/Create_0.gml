alarm[0] = 30*6;
room_target = room_menu;

// create continue button
var button = instance_create_layer(x, y + 130, "logic", obj_gui_button);
with(button)
{
	top = y - 32;
	bottom = y + 32;
	left = x - 100;
	right = x + 100;
	text = "continue";
}