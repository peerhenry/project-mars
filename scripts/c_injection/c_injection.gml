var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_injection;

switch(method)
{
	// params begin at argument[2]
	case constructor: // can be remove if not needed
		this.injectable = argument[2];
		this.from_ioc_container = argument[3];
		if(this.from_ioc_container && !script_exists(this.injectable)) scr_panic("An injection cannot use ioc container if its value is not a class definition script!");
		return this;

	case "resolve":
		var val = this.injectable;
		if(this.from_ioc_container)
		{
			var ioc_container = argument[2];
			val = call_unwrap(ioc_container, "resolve", this.injectable);
		}
		return ok(val);

	case destructor: 
		instance_destroy(this);
		break;
	
	case test:
		test_method(here, "test_use_ioc_container");
		test_method(here, "test_simple");
		break;
	
	case "test_use_ioc_container":
		var expect = instance_create_depth(0,0,0,obj_empty);
		var intf = interface([["resolve", t_object(obj_empty), t_script()]]);
		var mock_container = mock(intf);
		mock_setup_unwrapped(mock_container, "resolve", expect);
		var injection = new(here, scr_mock, true);
		// act
		var result = call_unwrap(injection, "resolve", mock_container);
		// assert
		mock_verify(mock_container, "resolve", Times.Once);
		assert_equal(expect, result, "Injection resolve result");
		// cleanup
		destroy(intf);
		destroy(mock_container);
		instance_destroy(expect);
		destroy(injection);
		break;
	
	case "test_simple":
		var expect = "Aloha";
		var injection = new(here, expect, false);
		// act
		var result = call_unwrap(injection, "resolve");
		// assert
		assert_equal(expect, result, "Injection resolve result");
		// cleanup
		destroy(injection);
		break;
	
	default:
		return refused();
}