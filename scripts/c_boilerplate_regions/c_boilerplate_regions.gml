function c_boilerplate_regions(argument0, argument1, argument2) {
#region set method and this
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_boilerplate; // <=== CHANGE THIS
#endregion

	switch(func)
	{
	#region CONSTRUCTOR / DESTRUCTOR
	
		case constructor:
			return this;
	
		case get_class_info:
			return ok_class_info([]);
	
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


}
