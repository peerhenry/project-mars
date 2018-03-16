/// @arg trigger
var arg_trigger = argument0;
var level_end = instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_accomplished);
level_end.button.level = arg_trigger.level;