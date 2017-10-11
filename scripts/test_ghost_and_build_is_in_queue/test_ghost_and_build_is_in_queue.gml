test_init(test_ghost_and_build);

// arrange
scr_ghost_reset();

// act
scr_update_ghost_single(10, 10, macro_basetile, 0);
scr_build_new(); // creates the construction

// assert
var cq = scr_get_construction_queue(macro_player);
var constr = ds_list_find_value(cq, 0);
var cells = constr[? construction_cells]; // array of cells
var length = array_length_1d(cells);
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