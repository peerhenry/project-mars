/// @description called on creation of drill or pump
/// @param instance
var arg_instance = argument0;

if(arg_instance.object_index == obj_pump)
{
	scr_connect_pump_to_drills(arg_instance);
}
else if(arg_instance.object_index == obj_drill)
{
	scr_connect_drill_to_pumps(arg_instance);
}
else
{
	show_error("script expects either drill or pump instance as argument", true);
}