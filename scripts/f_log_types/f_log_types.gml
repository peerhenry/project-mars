var function = argument[0];
var here = f_log_types;
switch(function)
{
	case "check_type":
		var thing = argument[1];
		show_debug_message("typeof(" + string(thing) + "): " + typeof(thing));
		break;
	
	case test:
		show_debug_message("");
		show_debug_message("TRAVOLTA");
		in(here, "check_type", 1);			// typeof(1): number
		in(here, "check_type", 0);			// typeof(0): number
		in(here, "check_type", 0.0);		// typeof(0): number
		in(here, "check_type", 1.0);		// typeof(1): number
		in(here, "check_type", 1.5);		// typeof(1.50): number
		in(here, "check_type", "Hey");		// typeof(Hey): string
		in(here, "check_type", false);		// typeof(0): number
		in(here, "check_type", true);		// typeof(1): number
		in(here, "check_type", [1,2,3]);	// typeof({ { 1,2,3 },  }): array
		var mything;
		mything[2] = 25.5;
		in(here, "check_type", mything);	// typeof({ { 0,0,25.50 },  }): array
		var mylist = ds_list_create();
		in(here, "check_type", mylist);		// typeof(216): number
		ds_list_destroy(mylist);
		show_debug_message("typeof unparameterized true: " + typeof(true)); // typeof unparameterized true: number
		show_debug_message("");
		break;
}