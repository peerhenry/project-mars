if(position_meeting(mouse_x, mouse_y, self))
{
	if(instance_exists(obj_dropdown_item))
	{
		with(obj_dropdown_item)
		{
			instance_destroy();
		}
	}
	else
	{
		var y_incr = sprite_get_height(spr_dropdown);
		var yy = y + y_incr - 2;
		for(var n = 0; n < ds_list_size(item_labels); n++)
		{
			var item = instance_create_layer(x, yy, layer, obj_dropdown_item);
			item.text = ds_list_find_value(item_labels, n);
			yy += y_incr - 2;
		}
	}
}
else
{
	if(!position_meeting(mouse_x, mouse_y, obj_dropdown_item))
	{
		if(instance_exists(obj_dropdown_item))
		{
			with(obj_dropdown_item)
			{
				instance_destroy();
			}
		}
	}
}