if(position_meeting(mouse_x, mouse_y, self))
{
	global.hovers_over_dropdown_item = true;
	image_index = 1;
}
else
{
	global.hovers_over_dropdown_item = false;
	image_index = 0;
}