if(show_details)
{
	show_details = false;
	return;
}
var selected_count = 0;
with(obj_astronaut_playable)
{
	if(is_selected)
	{
		selected_count++;
	}
	show_details = false;
}
if(selected_count > 1) exit;
if((selected_count == 0) || (selected_count == 1 && is_selected))
{
	show_details = true;
}