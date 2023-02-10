/// @description creates three cables and destroys middle one first
function test_grid_three_cables() {
	test_init(test_grid_three_cables);

	// Arrange
	var cable1 = instance_create_depth(32*1, 32, 0, obj_cable);
	var cable2 = instance_create_depth(32*2, 32, 0, obj_cable);
	var cable3 = instance_create_depth(32*3, 32, 0, obj_cable);
	with(obj_cable)
	{
		event_user(macro_event_finalize);
		assert_false(under_construction, "under_construction");
	}

	var surrounding = scr_get_surrounding_grid_components(cable2, macro_grid_electric);
	for(var n = 0; n<8; n++)
	{
		switch(n)
		{
			case 0:
				assert_equal(cable3, surrounding[n], "east cable");
				break;
			case 4:
				assert_equal(cable1, surrounding[n], "west cable");
				break;
			default:
				assert_equal(noone, surrounding[n], "surrounding cable");
				break;
		}
	}
	surrounding = 0;

	// assert setup
	var grid_count = 0;
	with(obj_grid){
		grid_count++;
		debug_grid(id);
	}
	assert_equal(1, grid_count, "grid count");
	assert_true(scr_grid_could_part(cable2, macro_grid_electric), "grid may part here");

	// act
	instance_destroy(cable2);

	// assert
	grid_count = 0;
	with(obj_grid){
		grid_count++;
		debug_grid(id);
	}
	assert_equal(2, grid_count, "grid count");

	// cleanup
	instance_destroy(cable1);
	instance_destroy(cable3);

	// assert cleanup
	grid_count = 0;
	with(obj_grid){
		grid_count++;
	}
	assert_equal(0, grid_count, "grid count");

	return test_result();


}
