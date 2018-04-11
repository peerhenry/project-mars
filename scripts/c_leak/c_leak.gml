#region set method and this
var here = c_leak;
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	#region CONSTRUCTOR
	
	case constructor: // number => object
		this.drain_per_step = argument[2];
		return this;
		
	#endregion

	#region METHODS
	
	#endregion

	#region DESTRUCTOR
	
	case destructor:
		instance_destroy(this);
		break;
		
	#endregion
	
	#region UNIT TESTS
	
	case test:
		call_static(here, "test_constructor");
		break;
	
	case "test_constructor":
		test_init("test_constructor");
		// arrange
		var expect = 25.5;
		var leak = new(c_leak, expect);
		// act
		var result = leak.drain_per_step;
		// assert
		assert_equal(expect, result, "drain_per_step");
		// cleanup
		destroy(leak);
		test_result();
		break;
		
	#endregion
	
	default:
		show_error("Refused request: function not defined", true);
}