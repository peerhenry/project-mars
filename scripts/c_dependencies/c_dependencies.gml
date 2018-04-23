#region set method and this
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(method)
{
	#region CONSTRUCTOR / DESTRUCTOR
	
	// params begin at argument[2]
	case constructor:
		var dep_array = argument[2];
		this.list = scr_array_to_list(dep_array);
		return this;
	
	case destructor:
		destroy_collection(this.list);
		ds_list_destroy(this.list);
		instance_destroy(this);
		return ok();
		
	#endregion

	#region METHODS
	case "extract_interface":
		var name = argument[2];
		var dep = first_equals(this.list, "name", name);
		if(dep.class != c_interface) scr_panic(name + " is not an interface!");
		var indx = ds_list_find_index(this.list, dep);
		ds_list_delete(this.list, indx);
		return ok(dep);
	
	case "extract_mocks":
		var mock_list = morph(this.list, "destroy_to_mock");
		var mocks = scr_list_to_array(mock_list);
		ds_list_destroy(mock_list);
		ds_list_clear(this.list);
		return mocks;
	#endregion
	
	#region UNIT TESTS
	
	case test:
		// todo
		break;
		
	#endregion
	
	default:
		return refused();
}