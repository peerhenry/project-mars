/// @description Close
for(var n = 0; n < ds_list_size(button_list); n++)
{
	var next_button = ds_list_find_value(button_list, n);
	with(next_button)
	{
		instance_destroy();
	}
}
ds_list_clear(button_list);
if(instance_exists(panel)) instance_destroy(panel);
is_active = false;
global.gui_press_button = noone;