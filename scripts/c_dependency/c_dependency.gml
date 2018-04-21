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
		this.type = argument[3];
		this.optional = argument[4];
		if(argument_count == 6) this.interface = argument[5];
		return this;
	
	case get_dependencies:
		var deps = dependencies([
			dependency("name", t_string()),
			dependency("type", t_object(obj_type)),
			dependency("optional", t_number()), // boolean
			optional_dependency("interface", t_object(obj_interface))
		]);
		return deps;
	
	case destructor:
		instance_destroy(this);
		return ok();
		
	#endregion

	#region METHODS
	// params begin at argument[2]
	#endregion
	
	#region UNIT TESTS
	
	case test:
		break;
		
	#endregion
	
	default:
		return refused();
}