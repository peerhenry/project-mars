#region init
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_navgrid;
#endregion

switch(method)
{
	case constructor:
		// all navgrid logic should end up here
		return this;
	
	case destructor: 
		instance_destroy(this);
		break;
	
	case get_dependencies:
		return noone;

	case "clear_astronaut":
		var astro = argument[2];
		var i = astro.occ_i;
		var j = astro.occ_j;
		scr_navgrid_free(i, j);
		return ok();
	
	case "get_nearest_free_cell":
		var i = argument[2];
		var j = argument[3];
		var val = scr_navgrid_get_nearest_free_cell(i, j);
		if(val == noone) return exception("Could not find free cell around: " + string(i) + ", " + string(j));
		return ok(val);
	
	case "occupy":
		var i = argument[2];
		var j = argument[3];
		scr_navgrid_occupy(i, j);
		return ok();
	
	case test:
		scr_warn("No tests written for: " + script_get_name(here));
		// var testable = new(here);
		// test_can_serve(testable, c_astro_appear_setter, "navgrid");
		break;
	
	default:
		return refused();
}