/// @descr Wrapper for method return values
// Necessary for allowing inheritance and exception handling
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_result;
var arg_count = array_length_1d(args);

enum STATUS
{
	OK,
	PROBLEM
}

enum PROBLEM
{
	REFUSED = -1,
	EXCEPTION = 0,
	ERROR = 1
}

switch(method)
{
	case constructor:
		this.status = args[0];
		this.refused_request = false;
		switch(this.status)
		{
			case STATUS.OK:
				if(arg_count == 2) this.value = args[1];
				else this.value = noone;
				break;
			case STATUS.PROBLEM:
				if(arg_count > 1) this.value = args[1];
				if(arg_count == 3) this.message = args[2]; // 3 arguments: (status, problem, message)
				else this.message = "Unspecified";
				this.refused_request = this.value == PROBLEM.REFUSED;
				break;
		}
		return this;

	// methods
	case "unwrap":
		if(this.status != STATUS.OK)
		{
			var problem = "PROBLEM.REFUSED";
			if(this.value = PROBLEM.EXCEPTION) problem = "PROBLEM.EXCEPTION";
			if(this.value = PROBLEM.ERROR) problem = "PROBLEM.ERROR";
			scr_panic("The result is not OK: " + problem + ": " + this.message);
		}
		// todo: consider if result needs to be destroyed here instead of in the unwrap script
		return this.value;
	
	case "consume_action":
		var action = args[0];
		if(this.status != STATUS.OK)
		{
			destroy(action);
			return this;
		}
		var new_result;
		if(this.value != noone) new_result = call(action, "execute", this.value);
		else new_result = void(action, "execute");
		destroy(action);
		instance_destroy(this);
		return new_result;
	
	case "to_string":
		var str = "";
		if(this.status != STATUS.OK)
		{
			var problem = "Refused Request";
			if(this.value = PROBLEM.EXCEPTION) problem = "Exception: " + this.message;
			if(this.value = PROBLEM.ERROR) problem = "Error: " + this.message;
			str = str + problem;
		}
		else
		{
			str = "OK: " + string(this.value)
		}
		return ok(str);
	
	// Result needs its own destructor, otherwise destructor inheritance will cause infinite loop of result instances.
	case destructor:
		return ok();
	
	case get_class_info:
		return ok_class_info([]);
	
	case get_object_index:
		return ok(obj_result);
	
	case test:
		test_method(here, "test_ok");
		test_method(here, "test_ok_val");
		test_method(here, "test_refused");
		test_method(here, "test_consume_action");
		break;
	
	case "test_ok":
		var result = ok();
		assert_equal(STATUS.OK, result.status, "status is ok");
		destroy(result);
		break;
	
	case "test_ok_val":
		var result = ok(25);
		assert_equal(STATUS.OK, result.status, "status is ok");
		assert_equal(25, result.value, "ok value");
		destroy(result);
		break;
	
	case "test_refused":
		var result = refused();
		assert_equal(STATUS.PROBLEM, result.status, "status is refused");
		assert_equal(PROBLEM.REFUSED, result.value, "val is refused");
		destroy(result);
		break;
	
	case "test_consume_action":
		var ci = new(c_class_info, [
			prop_method_void("foo", t_void())
		]);
		var mocky = new(c_mock, ci);
		var result = ok();
		var action = new(c_action, [mocky, "foo"]);
		var new_result = call(result, "consume_action", action);
		// assert
		call_unwrap(mocky, "verify", ["foo", Times.Once]);
		assert_false(instance_exists(action), "action exists");
		assert_false(instance_exists(result), "old result exists");
		// cleanup
		destroy(mocky)
		instance_destroy(new_result);
		destroy(ci);
		break;
	
	default:
		scr_panic("Not allowed to call method in result: " + method);
}