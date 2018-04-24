#region set here, method and this
var here = c_astro_appear_setter;
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
#endregion

switch(argument[0])
{
	case constructor:
		this.navgrid = argument[2];
		return this;
	
	// todo:
	// dependencies dont necessarily go into the constructor...
	// so how do we let the ioc container know which dependencies are constructor injections?
	case get_dependencies:
		var deps = new(c_dependencies, [
			new_interface("navgrid", [
				signature( "clear_astronaut", t_void(), [ t_object(obj_astronaut) ] ),
				signature( "get_nearest_free_cell", t_object(obj_empty), [t_number(), t_number()] ),
				signature( "occupy", t_void(), [t_number(), t_number()] )
			])
		]);
		return deps;
	
	#region METHODS
	case "disappear":
		var astro = argument[2];
		call_unwrap(this.navgrid, "clear_astronaut", astro);
		// scr_navgrid_clear_astronaut(astro); // TIGHT COUPLING
		with(astro)
		{
			script_update = scr_mock;
			visible = false;
		}
		return ok();

	case "reappear":
		var astro = argument[2];
		with(astro)
		{
			// todo: preserve inside/outside status
			var spot_result = call(this.navgrid, "get_nearest_free_cell", occ_i, occ_j);
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
				call_unwrap(this.navgrid, "occupy", occ_i, occ_j);
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
		// unit test your functions
		test_method(here, "disappear_test");
		test_method(here, "reappear_test");
		test_method(here, "cannot_reappear");
		test_method(here, "can serve c_atm_embarker");
		// todo: test depdencies
		break;
	
	case "can serve c_atm_embarker":
		var tup = setup_testable(here);
		var testable = tup.item0;
		var dummytuple = tuple(1,1);
		var mock_navgrid = testable.navgrid;
		mock_setup_unwrapped(mock_navgrid, "get_nearest_free_cell", dummytuple);
		assert_can_serve(testable, c_atm_embarker, "appear_setter"); // dependency inversion
		assert_false(instance_exists(dummytuple), "dummytuple exists");
		cleanup_testable(tup);
		break;
	
	case "disappear_test":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
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
		cleanup_testable(tup);
		break;
	
	case "reappear_test":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
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
		cleanup_testable(tup);
		break;
	
	case "cannot_reappear":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
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
		cleanup_testable(tup);
		destroy(exc);
		break;
	#endregion
	
	default:
		return refused();
}