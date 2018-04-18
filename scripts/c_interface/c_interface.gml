/// @descr Mock class 
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_interface;

switch(method)
{
	case constructor:
		this.signatures = ds_map_create();
		this.methods = [];
		var funcs = argument[2];
		if(!is_array(funcs)) scr_panic("Interface must receive an array of arrays, which must consist of method name, return type and argument types.");
		for(var n = 0; n < array_length_1d(funcs); n++)
		{
			var next = funcs[n];
			if(!is_array(next)) scr_panic("Interface must receive an array of arrays, which must consist of method name, return type and argument types.");
			var name = next[0];
			var return_type = next[1];
			var arg_types = next[2];
			this.methods[n] = name;
			this.signatures[? name] = signature(return_type, arg_types);
		}
		return this;

	case destructor:
		for(var n = 0; n < array_length_1d(this.methods); n++)
		{
			var method = this.methods[n];
			var sig = this.signatures[? method];
			destroy(sig);
		}
		ds_map_destroy(this.signatures);
		instance_destroy(this);
		break;
	
	case test:
		test_method(here, "constructor_test_one_method");
		break;
		
	case "constructor_test_one_method":
		// arrange
		// act
		var interf = new(here, [
			["foo", t_number(), t_string()],
			["bar", t_void(), [t_number(), t_number()]]
		]);
		// assert
		assert_equal(2, array_length_1d(interf.methods), "methods.length");
		assert_equal("foo", interf.methods[0], "methods[0] is foo");
		assert_equal("bar", interf.methods[1], "methods[1] is bar");
		var sig = interf.signatures[? "foo"];
		assert_equal(TYPE.NUMBER, sig.return_type.type, "foo return type");
		assert_equal(1, array_length_1d(sig.argument_types), "argument_types has length 1");
		var at = sig.argument_types[0]
		assert_equal(TYPE.STRING, at.type, "foo arg type");
		var bar_sig = interf.signatures[? "bar"];
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