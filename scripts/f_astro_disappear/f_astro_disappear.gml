var here = f_astro_disappear; // CHANGE THIS TO YOUR SCRIPT NAME
switch(argument[0])
{
	// functions
	case "disappear":
		var astro = argument[1];
		scr_navgrid_clear_astronaut(astro);
		with(astro)
		{
			script_update = scr_mock;
			visible = false;
		}
		break;
		
	case "reappear":
		var astro = argument[1];
		with(astro)
		{
			script_update = scr_astro_update;
			var spot = scr_navgrid_get_nearest_free_cell(occ_i, occ_j); // todo: preserve inside/outside status
			if(spot != noone)
			{
				visible = true;
				occ_i = spot.item0;
				occ_j = spot.item1;
				x = scr_gi_to_rc(occ_i);
				y = scr_gi_to_rc(occ_j);
				encoded_ij = scr_encode_grid_coord(occ_i, occ_j);
				destroy(spot);
				scr_navgrid_occupy(occ_i, occ_j);
			}
			else
			{
				resolve_execute(script_container, "alert_player", "Warning: No free spot for astronaut.");
			}
		}
		break;
	
	case test:
		// unit test your functions
		run_fs_test(here, "disappear_test");
		run_fs_test(here, "reappear_test");
		run_fs_test(here, "reappear_on_occupied_cell_test");
		break;
	
	case "disappear_test":
		// arrange
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		// assert setup
		assert_false(scr_navgrid_cell_is_free(astro.occ_i, astro.occ_j), "nagrid is free");
		// act
		in(here, "disappear", astro);
		// assert
		assert_equal(scr_mock, astro.script_update, "astro.update_script");
		assert_false(astro.visible, "astro.visible");
		assert_true(scr_navgrid_cell_is_free(astro.occ_i, astro.occ_j), "nagrid is free");
		// cleanup
		instance_destroy(astro);
		break;
	
	case "reappear_test":
		// arrange
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		// act
		in(here, "disappear", astro);
		in(here, "reappear", astro);
		// assert
		assert_equal(scr_astro_update, astro.script_update, "astro.update_script");
		assert_true(astro.visible, "astro.visible");
		assert_false(scr_navgrid_cell_is_free(astro.occ_i, astro.occ_j), "nagrid is free");
		// cleanup
		instance_destroy(astro);
		break;
	
	case "reappear_on_occupied_cell_test":
		// arrange
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		in(here, "disappear", astro);
		var old_i = astro.occ_i;
		var old_j = astro.occ_j;
		scr_navgrid_occupy(old_i, old_j);
		// act
		in(here, "reappear", astro);
		// assert
		assert_equal(scr_astro_update, astro.script_update, "astro.update_script");
		assert_true(astro.visible, "astro.visible");
		assert_false(old_i == astro.occ_i && old_j == astro.occ_j, "astro is on old spot");
		assert_false(scr_navgrid_cell_is_free(astro.occ_i, astro.occ_j), "nagrid is free");
		// cleanup
		instance_destroy(astro);
		break;
	
	default:
		show_error("Function undefined: " + string(argument[0]), true);
}