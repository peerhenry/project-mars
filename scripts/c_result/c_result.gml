var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_result;

enum STATUS
{
	OK,
	PROBLEM
}

enum PROBLEM
{
	REFUSED,
	EXCEPTION,
	ERROR
}

switch(method)
{
	// params begin at argument[2]
	case constructor:
		this.status = argument[2];
		switch(this.status)
		{
			case STATUS.OK:
				if(argument_count == 4) this.value = argument[3];
				else this.value = noone;
				break;
			case STATUS.PROBLEM:
				if(argument_count > 3) this.value = argument[3];
				if(argument_count == 5) this.message = argument[4]; // 5 arguments: (method, this, status, problem, message)
				else this.message = "Unspecified";
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
		return this.value;
	
	// Result needs its own destructor
	case destructor:
		instance_destroy(this);
		break;
	
	case test:
		test_method(here, "test_ok");
		test_method(here, "test_ok_val");
		test_method(here, "test_refused");
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
	
	default:
		scr_panic("Not allowed to call method in result: " + method);
}