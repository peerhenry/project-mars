#region set method and this
var here = c_leak;
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	case constructor: // number => object
		this.drain_per_step = argument[2];
		return this;
	
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