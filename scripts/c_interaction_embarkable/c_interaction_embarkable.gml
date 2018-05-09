var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_embarkable;

switch(method)
{
	case constructor:
		this.embarkable = args[0];
		this.astronaut = args[1];
		return this;

	case destructor:
		return ok();
	
	case get_class_info:
		return ok_class_info([
			prop_interface("embarkable", [
				prop_signature("embark", t_void(), t_object(obj_astronaut))
			]),
			prop_object("astronaut", t_object(obj_astronaut))
		]);

	case "execute":
		var result = call(this.embarkable, "embark", this.astronaut);
		return result;
	
	#region tests
	
	case test:
		test_method(here, "test_execute");
		break;
	
	case "test_execute":
		var item = setup_testable(here);
		void_unwrap(item, "execute");
		mock_verify(item.embarkable, "embark", Times.Once);
		cleanup_testable(item);
		break;
	
	#endregion
	
	default:
		return refused();
}