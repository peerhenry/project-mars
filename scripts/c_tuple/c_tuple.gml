var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	case constructor:
		switch(argument_count)
		{
			case 9:
				this.item6 = argument[8];
			case 8:
				this.item5 = argument[7];
			case 7:
				this.item4 = argument[6];
			case 6:
				this.item3 = argument[5];
			case 5:
				this.item2 = argument[4];
			case 4:
				this.item1 = argument[3];
			case 3:
				this.item0 = argument[2];
				break;
			default:
				show_error("invalid argument count: " + string(argument_count), true);
		}
		this.item_count = argument_count - 2;
		return this;

	case destructor:
		instance_destroy(this);
		break;
	
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
		refused();
}