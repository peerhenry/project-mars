#region set method and this
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	#region CONSTRUCTOR / DESTRUCTOR
	
	// params begin at argument[2]
	case constructor:
		return this;
	
	case get_dependencies:
		return noone;
	
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