/// @arg base_component
function scr_lr_on_base_component(argument0) {
	var arg_base_component = argument0;

	scr_deselect_all();
	with(arg_base_component)
	{
		is_selected = true;
	}
	global.hud_details_panel = scr_create_hud_details_panel(arg_base_component);


}
