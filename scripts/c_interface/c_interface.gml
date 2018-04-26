/// @descr Mock class 
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_interface;

switch(method)
{
	case constructor:
		this.name = argument[2];
		this.methods = argument[3];
		if(!is_array(this.methods)) scr_panic("Interface must receive an array of named signatures.");
		for(var n = 0; n < array_length_1d(this.methods); n++)
		{
			var next = this.methods[n];
			if(next.class != c_signature) scr_panic("Cannot make interface: elements must be signatures.");
		}
		return this;
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			dependency("name", t_string()),
			dependency("name", t_array()),
		]);
		return ok(deps);

	case destructor:
		for(var n = 0; n < array_length_1d(this.methods); n++)
		{
			var method = this.methods[n];
			destroy(method);
		}
		instance_destroy(this);
		break;
		
	case "destroy_to_mock":
		var m = mock(this); // mock gets ownership
		return ok(m);
	
	case test:
		test_method(here, "constructor_test_one_method");
		break;
		
	case "constructor_test_one_method":
		// arrange
		// act
		var interf = new_interface("dummy", [
			signature("foo", t_number(), t_string()),
			signature("bar", t_void(), [t_number(), t_number()])
		]);
		// assert
		assert_equal(obj_interface, interf.object_index, "object_index");
		assert_equal(2, array_length_1d(interf.methods), "methods.length");
		assert_equal("foo", interf.methods[0].name, "methods[0].name is foo");
		assert_equal("bar", interf.methods[1].name, "methods[1].name is bar");
		var sig = interf.methods[0];
		assert_equal(TYPE.NUMBER, sig.return_type.type, "foo return type");
		assert_equal(1, array_length_1d(sig.argument_types), "argument_types has length 1");
		var at = sig.argument_types[0];
		assert_equal(TYPE.STRING, at.type, "foo arg type");
		var bar_sig = interf.methods[1];
		var bar_rt = bar_sig.return_type;
		assert_equal(TYPE.VOID, bar_rt.type, "bar return type");
		assert_equal(2, array_length_1d(bar_sig.argument_types), "argument_types has length 1");
		var bar_at1 = bar_sig.argument_types[0];
		var bar_at2 = bar_sig.argument_types[1];
		assert_equal(TYPE.NUMBER, bar_at1.type, "bar arg 1 type");
		assert_equal(TYPE.NUMBER, bar_at2.type, "bar arg 2 type");
		// cleanup
		destroy(interf);
		break;
	
	default:
		return refused();
}