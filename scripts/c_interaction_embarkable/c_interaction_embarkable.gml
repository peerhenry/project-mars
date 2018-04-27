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
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			new_interface("embarkable", [
				signature("embark", t_void(), t_object(obj_astronaut))
			]),
			dependency("astronaut", t_object(obj_astronaut))
		]);
		return ok(deps);

	case "execute":
		var result = call(this.embarkable, "embark", this.astronaut);
		return result;
	
	#region tests
	
	case test:
		test_method(here, "test_execute");
		break;
	
	case "test_execute":
		var tup = setup_testable(here);
		var item = tup.item0;
		void_unwrap(item, "execute");
		mock_verify(tup.item1[0], "embark", Times.Once);
		cleanup_testable(tup);
		break;
	
	#endregion
	
	default:
		return refused();
}