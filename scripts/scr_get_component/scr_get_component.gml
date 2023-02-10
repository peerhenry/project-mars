/// @descr gets wall or base component at position
/// @param x
/// @param y
function scr_get_component(argument0, argument1) {
	var arg_x = argument0;
	var arg_y = argument1;
	var cc = instance_position(arg_x, arg_y, obj_base_component);
	if(cc == noone) cc = instance_position(arg_x, arg_y, obj_wall);
	return cc;


}
