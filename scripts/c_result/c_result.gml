var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_result;

enum STATUS
{
	OK,
	REFUSED,
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
				break;
			case STATUS.REFUSED:
				this.message = "Refused request: function not defined";
				break;
			case STATUS.ERROR:
				this.value = noone;
				break;
		}
		return this;

	// methods
	case "unwrap":
		if(this.status != STATUS.OK) scr_panic("Cannot unwrap a result that is not OK");
		return this.value;
	
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
		assert_equal(STATUS.REFUSED, result.status, "status is refused");
		destroy(result);
		break;
	
	default:
		refused();
}