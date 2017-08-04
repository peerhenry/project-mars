/// @param x
/// @param y
var arg_x = argument0;
var arg_y = argument1;

var cc = instance_position(arg_x, arg_y, obj_constructable);
if(cc != noone && cc.owner == macro_enemy)
{
	return cc;
}
else return noone;