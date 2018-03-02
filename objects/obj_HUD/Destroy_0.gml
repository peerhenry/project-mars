for(var n = 0; n< ds_list_size(buttons); n++)
{
	var next_button = buttons[| n];
	ds_map_destroy(next_button);
}
ds_list_destroy(buttons);