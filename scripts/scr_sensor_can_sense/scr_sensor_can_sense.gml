/// @param sensor
var arg_sensor = argument0;
var can_draw_power = resolve_execute(arg_sensor.script_container, "can_draw_power", arg_sensor);
return !arg_sensor.under_construction && can_draw_power;