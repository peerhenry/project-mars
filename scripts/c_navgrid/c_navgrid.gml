var method = argument0;
var this = argument1;
var args = argument2;
var here = c_navgrid;

switch(method)
{
	case constructor:
		// all navgrid logic should end up here
		return this;
		
	case get_clients:
		var clients = [ tuple(c_astro_appear_setter, "navgrid") ];
		return ok(clients);

	case "clear_astronaut":
		var astro = args[0];
		var i = astro.occ_i;
		var j = astro.occ_j;
		scr_navgrid_free(i, j);
		return ok();
	
	case "get_nearest_free_cell":
		var i = args[0];
		var j = args[1];
		var val = scr_navgrid_get_nearest_free_cell(i, j);
		if(val == noone) return exception("Could not find free cell around: " + string(i) + ", " + string(j));
		return ok(val);
	
	case "occupy":
		var i = args[0];
		var j = args[1];
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