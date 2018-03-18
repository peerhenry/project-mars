/// @description inject (level, condition script) in (x, y)
name = "trigger";
description = "";
trigger_delay = room_speed*2; // how long to wait between alarms
trigger_count = 0;	// how often has the condition evaluated to true
if(!scr_instance_inherits(x, obj_level)) show_error("Trigger expects obj_level to be injected in x", true);
level = x;
script_condition = y;
script_trigger = noone;
script_else = noone;
continue_after_trigger = false;
once = false;
owner = macro_player;

enum trigger_type
{
	standard,
	objective,
}

type = trigger_type.standard;
alarm[0] = trigger_delay;