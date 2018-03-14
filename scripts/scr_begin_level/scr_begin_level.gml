/// @arg site
/// @arg level
var arg_site = argument0;
var arg_level = argument1;
if(arg_level > 1) global.level_object_index = obj_level_2;
else global.level_object_index = obj_level_1;
global.mission_control_site = arg_site;
room_goto(mission_02);