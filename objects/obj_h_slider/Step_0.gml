if(!mouse_check_button(mb_left))
{
	grabbed = false;
}

if(!grabbed) exit;
var new_x = mouse_x;

if(new_x < left_limit)
{
	x = left_limit;
}
else if(new_x > right_limit)
{
	x = right_limit;
}
else
{
	x = new_x;
}

var new_percentage = macro_calculate_percentage;
if(new_percentage != percentage)
{
	percentage = new_percentage;
	with(slider_bar)
	{
		event_user(macro_on_change);
	}
}