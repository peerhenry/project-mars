if(position_meeting(mouse_x, mouse_y, self))
{
	var hovers_over_dropdown_item = false;
	with(obj_dropdown_item)
	{
		if(hovers) hovers_over_dropdown_item = true;
	}
	
	if( !hovers_over_dropdown_item )
	{
		hovers = true;
		image_index = 1;
		exit;
	}
}

hovers = false;
image_index = 0;