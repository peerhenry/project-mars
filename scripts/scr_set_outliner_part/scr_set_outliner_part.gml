/// @description creates or destroys relevant hud entity panels
/// @arg outliner
/// @arg object_index
/// @arg show
function scr_set_outliner_part(argument0, argument1, argument2) {
	var arg_outliner = argument0;
	var arg_object_index = argument1;
	var arg_show = argument2;

	if(arg_show)
	{
		with(arg_object_index) // astro / robot / cart
		{
			if(owner == macro_player)
			{
				var panel = instance_create_depth(0,0,0,obj_HUD_entity_panel);
				panel.left = display_get_gui_width() - arg_outliner.tab_w;
				panel.right = display_get_gui_width();
				panel.entity = id;
			}
		}
	}
	else
	{
		with(obj_HUD_entity_panel)
		{
			if(scr_instance_inherits(entity, arg_object_index)) instance_destroy();
		}
	}


}
