#region set method and this
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	#region CONSTRUCTOR
	
	case constructor:
		return this;
		
	#endregion

	#region METHODS
	
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
		show_error("Refused request: function not defined", true);
}