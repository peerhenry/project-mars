var here = f_example; // useful to express function calls for this script.
switch(argument[0])
{
	case "function1":
		return "foo";
		
	case "function2":
		return "bar";
		
	case "function3":
		return in(here, "foo") + in(here, "bar");
	
	case test:
		test_init("f_example test");
		var result = in(here, "function3");
		assert_equal("foobar", result, "result");
		test_result();
	
	default:
		show_error("Function undefined: " + string(argument[0]), true);
}