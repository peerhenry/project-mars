#region set method and this
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_boilerplate; // <=== CHANGE THIS
#endregion

switch(method)
{
	#region CONSTRUCTOR / DESTRUCTOR
	
	case constructor:
		return this;
	
	case get_dependencies:
		return ok(noone);
	
	case get_clients:
		return ok(noone);
	
	case destructor:
		return ok();
		
	#endregion

	#region METHODS
	
	
	
	#endregion
	
	#region UNIT TESTS
	
	case test:
		break;
		
	#endregion
	
	default:
		return refused();
}