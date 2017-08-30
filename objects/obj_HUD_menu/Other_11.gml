/// @description Close
for(var n = 0; n < ds_list_size(button_list); n++)
{
	var next_button = ds_list_find_value(button_list, n);
	with(next_button){
		instance_destroy();
	}
}
with(panel){
	instance_destroy();
}
is_active = false;