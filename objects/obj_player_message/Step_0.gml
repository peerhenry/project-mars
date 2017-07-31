if(popping_down)
{
	text_y+=2;
	if(text_y == gui_height)
	{
		instance_destroy();
	}
}
else if(popping_up)
{
	text_y-=2;
	if(text_y == text_stop_y)
	{
		popping_up = false;
	}
}