var function = argument[0];
var args = argument[1];
var here = f_astro;
switch(function)
{
	case "set_end_path_action":
		var astro = args[0];
		var action = args[1];
		if(instance_exists(astro.end_path_action)) destroy(astro.end_path_action);
		astro.end_path_action = action;
		break;
	default:
		scr_panic("function undefined: " + function);
}