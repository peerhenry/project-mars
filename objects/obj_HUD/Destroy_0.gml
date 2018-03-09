for(var n = 0; n< ds_list_size(buttons); n++)
{
	var next_button = buttons[| n];
	instance_destroy(next_button);
}
ds_list_destroy(buttons);

instance_destroy(outliner);