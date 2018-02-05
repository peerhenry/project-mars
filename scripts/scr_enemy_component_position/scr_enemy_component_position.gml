/// @param x
/// @param y
var arg_x = argument0;
var arg_y = argument1;

var cc = scr_get_component(arg_x, arg_y);

if(cc != noone && cc.owner == macro_enemy)
{
	return cc;
}
else return noone;