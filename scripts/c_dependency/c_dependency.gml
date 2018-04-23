#region set method and this
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	#region CONSTRUCTOR / DESTRUCTOR
	
	// params begin at argument[2]
	case constructor:
		this.name = argument[2];
		this.type_info = argument[3];
		this.optional = argument[4];
		return this;
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			dependency("name", t_string()),
			dependency("type_info", t_object(obj_type_info)),
			dependency("optional", t_number()), // boolean
			optional_dependency("interface", t_object(obj_interface))
		]);
		return deps;
	
	case destructor:
		destroy(this.type_info)
		instance_destroy(this);
		return ok();
		
	#endregion

	#region METHODS
	case "destroy_to_mock":
		var result = call(this.type_info, "create_dummy");
		destroy(this);
		return result;
	#endregion
	
	#region UNIT TESTS
	
	case test:
		break;
		
	#endregion
	
	default:
		return refused();
}