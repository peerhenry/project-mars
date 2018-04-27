#region set method and this
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_dependency;
#endregion

switch(method)
{
	#region CONSTRUCTOR / DESTRUCTOR
	
	case constructor:
		this.name = args[0];
		this.type_info = args[1];
		this.optional = args[2];
		return this;
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			dependency("name", t_string()),
			dependency("type_info", t_object(obj_type_info)),
			dependency("optional", t_number())
		]);
		return ok(deps);
		//return ok(skip_standards());
	
	case destructor:
		if(this.type_info != noone) destroy(this.type_info)
		return ok();
		
	#endregion

	#region METHODS
	case "destroy_to_mock":
		var result = void(this.type_info, "create_mock"); // mock_val gets ownership of type_info
		this.type_info = noone;
		destroy(this);
		return result;
	#endregion
	
	#region UNIT TESTS
	
	case test:
		// todo: test_nyi(here);
		break;
		
	#endregion
	
	default:
		return refused();
}