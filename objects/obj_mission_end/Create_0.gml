var panel = scr_create_panel(x - 360, y - 90, x + 360, y + 170);

// create continue button
button = instance_create_layer(x, y + 130, "logic", obj_gui_end_level_button);
with(button)
{
	top = y - 32;
	bottom = y + 32;
	left = x - 100;
	right = x + 100;
	text = "Continue";
	depth = panel.depth - 1;
}