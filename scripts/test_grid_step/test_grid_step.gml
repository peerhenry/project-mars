function test_grid_step() {
	test_init(test_grid_step);

	// arrange
	var grid = instance_create_depth(0,0,0,obj_grid);

	// act
	with(grid)
	{
		event_perform(ev_step, ev_step_normal);
	}

	// assert
	// does not crash

	// cleanup
	instance_destroy(grid);

	test_result();


}
