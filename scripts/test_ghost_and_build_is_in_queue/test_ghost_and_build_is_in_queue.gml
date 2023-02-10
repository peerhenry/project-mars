function test_ghost_and_build_is_in_queue() {
	test_init(test_ghost_and_build_is_in_queue);

	// arrange
	scr_ghost_reset_with_constr_type(macro_basetile);

	// act
	scr_update_ghost_single(10, 10, macro_basetile, 0);
	scr_build_new(); // creates the construction

	// assert
	var cq = scr_get_construction_queue(macro_player);
	var constr = ds_list_find_value(cq, 0);
	var cells = constr[? construction_cells]; // list of cells
	var length = ds_list_size(cells);
	assert_equal(9, length, "cells of first construction in queue");

	// cleanup
	with(obj_base_tile){
		instance_destroy();
	}
	with(obj_wall){
		instance_destroy();
	}
	ds_list_clear(cq);

	test_result();


}
