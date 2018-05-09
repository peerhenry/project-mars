var method = argument0;
var this = argument1;
var args = argument2;
var here = c_leak;

switch(method)
{
	case constructor: // number => object
		this.drain_per_step = args[0];
		return this;

	case get_class_info:
		return ok_class_info([
			prop_number("drain_per_step")
		]);

	// UNIT TESTS
	case test:
		test_method(here, "test_constructor");
		break;
	
	case "test_constructor":
		// arrange
		var expect = 25.5;
		var leak = new(c_leak, expect);
		// act
		var result = leak.drain_per_step;
		// assert
		assert_equal(expect, result, "drain_per_step");
		// cleanup
		destroy(leak);
		break;
	
	default:
		return refused();
}