var method = argument0;
var this = argument1;
var args = argument2;
var here = c_test_selection;

#macro xqwerg_dummy new(c_test_selection)

switch(method)
{	
	case test:
		test_method(here, "macros can be used to create shit");
		break;
	
	case "macros can be used to create shit":
		var thing = xqwerg_dummy;
		assert_true(instance_exists(thing), "instance exists");
		destroy(thing);
		break;
	
	default:
		return refused();
}