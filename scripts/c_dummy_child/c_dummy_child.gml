var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	case constructor:
		return this;
	
	case get_parent:
		return ok(c_dummy_parent);
	
	// override parent method
	case "method2":
		return ok(5);
	
	case test:
		test_init("c_dummy_child");
		// arrange
		var child = new(c_dummy_child);
		assert_equal(c_dummy_parent, get_parent_class(c_dummy_child), "parent");
		// act
		var result1 = call_unwrap(child, "method1", 2);
		var result2 = call_unwrap(child, "method2");
		// assert
		assert_equal(4, result1, "result1");
		assert_equal(5, result2, "result2");
		// cleanup
		destroy(child);
		test_result();
		break;
	
	default:
		return refused();
}