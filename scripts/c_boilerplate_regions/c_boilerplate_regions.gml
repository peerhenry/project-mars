#region set method and this
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

#region METHOD DEFINITIONS

#endregion

switch(method)
{
	#region CONSTRUCTOR
	
	case OBJECT.NEW:
		return this;
		
	#endregion

	#region METHODS
	
	#endregion

	#region DESTRUCTOR
	
	case OBJECT.DESTROY:
		instance_destroy(this);
		break;
		
	#endregion
	
	#region UNIT TESTS
	
	case OBJECT.TEST:
		break;
		
	#endregion
	
	default:
		show_error("Refused request: function not defined", true);
}