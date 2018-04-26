var method = argument0;
var this = argument1;
var args = argument2;
var here = c_interaction_bed;

switch(method)
{
	case constructor:
		this.appear_setter =  args[0];
		this.bed = args[1];
		this.astronaut = args[2];
		return this;

	case destructor: 
		return ok();
	
	case get_dependencies:
		var deps = new(c_dependencies, [
			new_interface("appear_setter", [
				signature("disappear", t_void(), [t_object(obj_astronaut)])
			]),
			dependency("bed", t_object(obj_bed)),
			dependency("astronaut", t_object(obj_astronaut))
		]);
		return ok(deps);

	case "execute":
		if(bed.occupant != noone)
		{
			return exception("Cannot enter bed; bed is occupied");
		}
		
		return ok();
	
	#region tests
	
	case test:
		break;
	
	#endregion
	
	default:
		return refused();
}