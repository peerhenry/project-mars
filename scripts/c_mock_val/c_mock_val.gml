/// @descr Mock class 
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_mock_val;

switch(method)
{
	#region construct/destruct
	case constructor:
		this.type_info = args[0];
		this.value = args[1];
		return this;
	
	case get_dependencies:
		return ok(skip_standards());
	
	case destructor:
		switch(this.type_info.type)
		{
			case TYPE.LIST:
				ds_list_destroy(this.value);
				break;
			case TYPE.OBJECT:
				instance_destroy(this.value);
				break;
			case TYPE.MAP:
				ds_map_destroy(this.value);
				break;
		}
		destroy(this.type_info);
		return ok();
	
	case get_object_index:
		return ok(obj_empty);
	#endregion
	
	case "get_value":
		return ok(this.value);
	
	#region tests
	case test:
		test_nyi(here);
		break;
	#endregion
	
	default:
		return refused();
}