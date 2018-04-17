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
		test_method(here, "test_register_dependencies");
		break;
	
	case register_dependencies:
		var intf = interface([
			["clear_astronaut", t_void(), [t_object(obj_astronaut)]],
			["get_nearest_free_cell", t_object(obj_empty), [t_number(), t_number()]],
			["occupy", t_void(), [t_number(), t_number()]]
		])
		set_dependency(here, "navgrid", intf);
		break;
		
	case "test_register_dependencies":
		var dep_interface = get_dependency(here, "navgrid");
		assert_equal(3, array_length_1d(dep_interface.methods), "method count");
		break;
	
	case "can serve c_atm_embarker":
		var testable = in(here, "get_testable");
		var dummytuple = tuple(1,1);
		var mock_navgrid = testable.navgrid;
		mock_setup_unwrapped(mock_navgrid, "get_nearest_free_cell", dummytuple);
		assert_can_serve(testable, c_atm_embarker, "appear_setter"); // dependency inversion
		assert_false(instance_exists(dummytuple), "dummytuple exists");
		destroy(mock_navgrid);
		destroy(testable);
		break;
	
	case "get_testable":
		var intf = get_dependency(here, "navgrid");
		var mock_navgrid = mock(intf);
		return new(here, mock_navgrid);
	
	case "disappear_test":
		// arrange
		var testable = in(here, "get_testable");
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
		destroy(testable.navgrid);
		destroy(testable);
		break;
	
	case "reappear_test":
		// arrange
		var testable = in(here, "get_testable");
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
		destroy(mock_navgrid);
		destroy(testable);
		break;
	
	case "cannot_reappear":
		// arrange
		var testable = in(here, "get_testable");
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
		destroy(testable.navgrid);
		destroy(testable);
		destroy(exc);
		break;
	#endregion
	
	default:
		return refused();
}