/// @description Initialize

var focussed_first_enabled = false;
for(var i = 0; i < array_length_1d(list_items); i++)
{
	var item = list_items[i];
	var list_button = instance_create_depth(x, y + i * list_button_height, 0, obj_list_button);
	list_button.caption = item[0];
	list_button.index = item[1];
	if(array_length_1d(item) > 2) list_button.enabled = item[2];
	if(!focussed_first_enabled && list_button.enabled)
	{
		list_button.focussed = true;
		focussed_first_enabled = true;
	}
	ds_list_add(list_buttons, list_button);
}