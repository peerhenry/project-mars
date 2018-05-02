/// @descr Easy helper class to allow multiple return values
var method = argument0;
var this = argument1;
var args = argument2;
var arg_count = array_length_1d(args);

switch(method)
{
	case constructor:
		switch(arg_count)
		{
			case 7:
				this.item6 = args[6];
			case 6:
				this.item5 = args[5];
			case 5:
				this.item4 = args[4];
			case 4:
				this.item3 = args[3];
			case 3:
				this.item2 = args[2];
			case 2:
				this.item1 = args[1];
			case 1:
				this.item0 = args[0];
				break;
			default:
				show_error("invalid argument count: " + string(arg_count), true);
				break;
		}
		this.item_count = arg_count;
		return this;

	case destructor:
		return ok();
		
	case get_class_info:
		return ok_class_info([]);
	
	case test:
		test_init("test tuple");
		var result = tuple(25, "foo", "bar", 16.7);
		assert_equal(25, result.item0, "item0");
		assert_equal("foo", result.item1, "item1");
		assert_equal("bar", result.item2, "item2");
		assert_equal(16.7, result.item3, "item3");
		destroy(result);
		test_result();
		break;
	
	default:
		return refused();
}