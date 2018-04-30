#region set method and this
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_dependencies;
#endregion

switch(method)
{
	#region CONSTRUCTOR / DESTRUCTOR
	
	case constructor:
		this.list = scr_array_to_list(args);
		return this;
	
	case destructor:
		destroy_collection(this.list);
		instance_destroy(this);
		return ok();
	
	case get_dependencies:
		return ok(skip_standards());
	
	#endregion

	#region METHODS
	case "extract_interface":
		var name = args[0];
		var dep = first_equals(this.list, "name", name);
		if(dep.class != c_interface_old) scr_panic(name + " is not an interface!");
		var indx = ds_list_find_index(this.list, dep);
		ds_list_delete(this.list, indx);
		return ok(dep);
	
	case "extract_mocks":
		var mock_list = morph(this.list, "destroy_to_mock");
		var mocks = scr_list_to_array(mock_list);
		ds_list_destroy(mock_list);
		ds_list_clear(this.list);
		return ok(mocks);
	#endregion
	
	#region UNIT TESTS
	
	case test:
		test_method(here, "tc");
		break;
	
	case "tc":
		// arrange
		var intf = new_interface("hi", []);
		var ti = new(c_dependencies, [intf]);
		assert_true(ds_list_find_index(ti.list, intf) > -1, "interface is in list");
		// act
		var res_int = call_unwrap(ti, "extract_interface", "hi");
		// assert
		assert_false(ds_list_find_index(ti.list, intf) > -1, "interface is in list");
		assert_equal(intf, res_int, "extracted interface is as expected");
		// cleanup
		destroy(intf);
		destroy(ti);
		break;
	
	#endregion
	
	default:
		return refused();
}