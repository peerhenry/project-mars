if(position_meeting(mouse_x, mouse_y, self))
{
	if(instance_exists(obj_res_dropdown_item))
	{
		with(obj_res_dropdown_item)
		{
			instance_destroy();
		}
	}
	else
	{
		var y_incr = sprite_get_height(spr_dropdown);
		var yy = y + y_incr - 2;
		var list = global.window[? key_window_resolutions_list];
		var min_height = 720;
		for(var i = 0; i < ds_list_size(list); i++)
		{
			var list_item = list[|i];
			if(list_item[1] < min_height) continue;
			var dropdown_item = instance_create_layer(x, yy, layer, obj_res_dropdown_item);
			dropdown_item.text = string(list_item[0]) + " x " + string(list_item[1]); //todo: refactor format "width x height"
			dropdown_item.width = list_item[0];
			dropdown_item.height = list_item[1];
			yy += y_incr - 2;
		}
	}
}
else
{
	if(!position_meeting(mouse_x, mouse_y, obj_res_dropdown_item))
	{
		if(instance_exists(obj_res_dropdown_item))
		{
			with(obj_res_dropdown_item)
			{
				instance_destroy();
			}
		}
	}
}