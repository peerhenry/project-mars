/// @arg trigger
function scr_trigger_victory(argument0) {
	var arg_trigger = argument0;
	var level_end = instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_accomplished);
	with(arg_trigger.level) event_user(macro_victory_callback);


}
