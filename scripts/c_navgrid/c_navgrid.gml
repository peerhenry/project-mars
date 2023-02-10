function c_navgrid(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_navgrid;

	switch(func)
	{
		case constructor:
			// all navgrid logic should end up here
			/*
			var left = args[0];
			var top = args[1];
			var hcells = args[2];
			var vcells = args[3];
			var cellwidth = args[4];
			var cellheight = args[5];
			mp_grid_create(left, top, hcells, vcells, cellwidth, cellheight);
			*/
			return this;

		case get_clients:
			var clients = [ tuple(c_astro_appear_setter, "navgrid") ];
			return ok(clients);
	
		case get_class_info:
			return ok_class_info([
				prop_method("clear_astronaut", t_void(), p_object("astro", obj_astronaut)),
				prop_method("get_nearest_free_cell", 
					t_interface([	// todo: make a tuple type
						prop_integer("item0"),
						prop_integer("item1")
					]), 
					[
						p_integer("i"), 
						p_integer("j")
					]
				),
				prop_method("occupy", t_void(), [p_integer("i"), p_integer("j")])
			]);

		case "clear_astronaut":
			var astro = args[0];
			var i = astro.occ_i;
			var j = astro.occ_j;
			scr_navgrid_free(i, j);
			return ok();
	
		case "get_nearest_free_cell":
			var i = args[0];
			var j = args[1];
			var val = scr_navgrid_get_nearest_free_cell(i, j); // TIGHT COUPLING
			if(val == noone) return exception("Could not find free cell around: " + string(i) + ", " + string(j));
			return ok(val);
	
		case "occupy":
			var i = args[0];
			var j = args[1];
			scr_navgrid_occupy(i, j); // TIGHT COUPLING
			return ok();
	
		case test:
			break;
	
		default:
			return refused();
	}


}
