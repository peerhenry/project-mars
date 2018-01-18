if(global.hovers_over_dropdown_item) exit;
with(dropdown)
{
	chosen_item = other;
	chosen_item_number = other.number;
	text = other.text;
	event_user(0);
}
with(obj_dropdown_item)
{
	instance_destroy();
}