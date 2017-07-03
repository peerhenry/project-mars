/// @param i
/// @param j
/// @param origin_i
/// @param origin_j
/// @param diff_i
/// @param diff_j
/// @param abs_diff_i
/// @param abs_diff_j
/// @param build
/// @param rotation

var arg_i = argument0;
var arg_j = argument1;
var arg_origin_i = argument2;
var arg_origin_j = argument3;
var arg_diff_i = argument4;
var arg_diff_j = argument5;
var arg_abs_diff_i = argument6;
var arg_abs_diff_j = argument7;
var arg_build = argument8;
var arg_rotation = argument9;

switch(arg_build)
{
	case construction.wall:
		scr_drag_wall(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
	case construction.basetile:
		scr_drag_basetile(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
	case construction.pipe:
		scr_drag_pipe(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
	case construction.cable:
		scr_drag_cable(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
		break;
}