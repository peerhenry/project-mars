var function = argument[0];
var here = f_astro;
switch(function)
{
	case "set_end_path_action":
		var astro = argument[1];
		var action = argument[2];
		if(instance_exists(astro.end_path_action)) destroy(astro.end_path_action);
		astro.end_path_action = action;
		break;
	default:
		scr_panic("function undefined: " + function);
}