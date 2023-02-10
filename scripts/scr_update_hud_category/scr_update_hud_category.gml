function scr_update_hud_category(argument0) {
	var arg_category = argument0;

	var any_items = false;
	var construction_list = global.active_constructions;
	var counter = 0;
	for(var n = 0; n < ds_list_size(construction_list); n++){
		var next_build = ds_list_find_value(construction_list, n);
		if(scr_get_category(next_build) == arg_category)
		{
			any_items = true;
		}
	}
	var cat_item = noone;
	with(obj_HUD)
	{
		switch(arg_category)
		{
			case macro_category_deconstruction:
				cat_item = deconstruction_item;
				break;
			case macro_category_foundation:
				cat_item = foundation_item;
				break;
			case macro_category_outside:
				cat_item = outside_item;
				break;
			case macro_category_inside:
				cat_item = inside_item;
				break;
		}
	}

	if(any_items)
	{
		instance_activate_object(cat_item);
	}
	else
	{
		instance_deactivate_object(cat_item);
	}

	return any_items;


}
