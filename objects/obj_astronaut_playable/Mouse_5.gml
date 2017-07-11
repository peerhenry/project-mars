var any_astronauts_selected = false;
if(show_details)
{
	show_details = false;
	return;
}
with(obj_astronaut_playable)
{
	if(is_selected) any_astronauts_selected = true;
	show_details = false;
}
if(any_astronauts_selected) return;
if(!any_astronauts_selected)
{
	show_details = true;
}