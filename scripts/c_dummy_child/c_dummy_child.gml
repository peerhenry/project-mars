var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	case constructor:
		return this;

	// implement parent method
	case "method1":
		return call_static(c_dummy_parent, method, this, argument[2]);
	
	// override parent method
	case "method2":
		return 5;

	case destructor:
		instance_destroy(this);
		break;
	
	case test:
		test_init("c_dummy_child");
		// arrange
		var child = new(c_dummy_child);
		// act
		var result1 = call(child, "method1", 2);
		var result2 = call(child, "method2");
		// assert
		assert_equal(4, result1, "result1");
		assert_equal(5, result2, "result2");
		test_result();
		break;
	
	default:
		show_error("Refused request: function not defined", true);
}