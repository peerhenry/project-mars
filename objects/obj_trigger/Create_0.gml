name = "trigger";
description = "";
trigger_delay = room_speed*2; // how long to wait between alarms
trigger_count = 0;	// how often has the condition evaluated to true
script_condition = x;
script_trigger = y;
script_else = noone;
continue_after_trigger = false;
once = false;
owner = macro_player;

/*
show_debug_message("trigger created with: ");
show_debug_message("trigger_delay: " + string(trigger_delay)); // debug
show_debug_message("script_condition index " + string(script_condition) + " and name " + script_get_name(script_condition));
*/

enum trigger_type
{
	standard,
	objective,
}

type = trigger_type.standard;
alarm[0] = trigger_delay;