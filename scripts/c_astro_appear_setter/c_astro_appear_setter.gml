function c_astro_appear_setter(argument0, argument1, argument2) {
#region set here, method and this
	var here = c_astro_appear_setter;
	var func = argument0;
	var this = argument1;
	var args = argument2;
#endregion

	switch(func)
	{
		case constructor:
			this.navgrid = args[0];
			return this;
		
		case get_class_info:
			return ok_class_info([
				prop_interface("navgrid", [
					prop_method("clear_astronaut", t_void(), p_object("astronaut", obj_astronaut)),
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
					prop_method("occupy", t_void(), [p_number("i"), p_number("j")])
				]),
				prop_method("disappear", t_void(), p_object("astro", obj_astronaut)),
				prop_method("reappear", t_void(), p_object("astro", obj_astronaut))
			]);
		
		case get_clients:
			var clients = [tuple(c_embarkable, "appear_setter")];
			return ok(clients);
	
	#region METHODS
		case "disappear":
			var astro = args[0];
			call_unwrap(this.navgrid, "clear_astronaut", astro);
			with(astro)
			{
				script_update = scr_mock;
				visible = false;
			}
			return ok();

		case "reappear":
			var astro = args[0];
			with(astro)
			{
				// todo: preserve inside/outside status
				var spot_result = call(this.navgrid, "get_nearest_free_cell", [occ_i, occ_j]);
				if(spot_result.status == STATUS.OK)
				{
					script_update = scr_astro_update;
					visible = true;
					var spot = unwrap(spot_result);
					occ_i = spot.item0;
					occ_j = spot.item1;
					x = scr_gi_to_rc(occ_i);
					y = scr_gi_to_rc(occ_j);
					encoded_ij = scr_encode_grid_coord(occ_i, occ_j);
					destroy(spot);
					call_unwrap(this.navgrid, "occupy", [occ_i, occ_j]);
				}
				else
				{
					return spot_result; // propagate exception
				}
			}
			return ok();
	#endregion
	
	#region TESTS
	
		case test:
			test_method(here, "disappear_test");
			test_method(here, "reappear_test");
			test_method(here, "cannot_reappear");
			break;
	
		case "disappear_test":
			// arrange
			var testable = setup_testable(here);
			var astro = instance_create_depth(0,0,0,obj_astronaut);
			// assert setup
			assert_false(scr_navgrid_cell_is_free(astro.occ_i, astro.occ_j), "nagrid is free");
			// act
			call_unwrap(testable, "disappear", astro);
			// assert
			assert_equal(scr_mock, astro.script_update, "astro.update_script");
			assert_false(astro.visible, "astro.visible");
			mock_verify(testable.navgrid, "clear_astronaut", Times.Once);
			// cleanup
			instance_destroy(astro);
			cleanup_testable(testable);
			break;
	
		case "reappear_test":
			// arrange
			var testable = setup_testable(here);
			var astro = instance_create_depth(0,0,0,obj_astronaut);
			var mock_navgrid = testable.navgrid;
			var dummytuple = tuple(1,1);
			mock_setup_unwrapped(mock_navgrid, "get_nearest_free_cell", dummytuple);
			// act
			call_unwrap(testable, "disappear", astro);
			call_unwrap(testable, "reappear", astro);
			// assert
			assert_equal(scr_astro_update, astro.script_update, "astro.update_script");
			assert_true(astro.visible, "astro.visible");
			mock_verify(testable.navgrid, "clear_astronaut", Times.Once);
			mock_verify(testable.navgrid, "occupy", Times.Once);
			mock_verify(testable.navgrid, "get_nearest_free_cell", Times.Once);
			// cleanup
			instance_destroy(astro);
			cleanup_testable(testable);
			break;
	
		case "cannot_reappear":
			// arrange
			var testable = setup_testable(here);
			var astro = instance_create_depth(0,0,0,obj_astronaut);
			call_unwrap(testable, "disappear", astro);
			var old_i = astro.occ_i;
			var old_j = astro.occ_j;
			var exc = exception("yo!");
			mock_setup(testable.navgrid, "get_nearest_free_cell", exc);
			// act
			var result = call(testable, "reappear", astro);
			// assert
			assert_equal(exc, result, "result");
			assert_equal(scr_mock, astro.script_update, "astro.update_script");
			assert_false(astro.visible, "astro.visible");
			assert_true(old_i == astro.occ_i && old_j == astro.occ_j, "astro is on old spot");
			// cleanup
			instance_destroy(astro);
			cleanup_testable(testable);
			destroy(exc);
			break;
	#endregion
	
		default:
			return refused();
	}


}
