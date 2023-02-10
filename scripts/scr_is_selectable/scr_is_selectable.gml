function scr_is_selectable(argument0) {
	scr_trace("scr_is_selectable");
	var arg_instance = argument0;

	if(object_is_ancestor(arg_instance.object_index, obj_constructable))
	{
		return arg_instance.owner == macro_player;
	}


}
