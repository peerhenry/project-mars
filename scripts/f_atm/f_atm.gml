var here = f_atm;
switch(argument[0])
{
	// functions
	case "embark":
		var arg_atm = argument[1];
		var arg_astronaut = argument[2];
		ds_list_add(arg_atm.embarked_astronauts, arg_astronaut);
		in(f_astro_disappear, "disappear", assigned_astronaut);
		break;
	
	case test:
		// unit test your functions
		break;
	
	default:
		show_error("Function undefined: " + string(argument[0]), true);
}