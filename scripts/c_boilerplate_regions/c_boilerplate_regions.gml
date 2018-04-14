#region set method and this
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	#region CONSTRUCTOR
	
	// params begin at argument[2]
	case constructor:
		return this;
		
	#endregion

	#region METHODS
	// params begin at argument[2]
	#endregion

	#region DESTRUCTOR
	
	case "destroy":
		instance_destroy(this);
		break;
		
	#endregion
	
	#region UNIT TESTS
	
	case "test":
		break;
		
	#endregion
	
	default:
		return refused();
}