test_init(test_new_construction);

// arrange
var expect_mdu_count = 738;
var expect_right = 124;
var expect_top = 904;
var expect_bottom = 2476;
var expect_left = 1252;
var expect_build_time = scr_calculate_build_time(expect_mdu_count, 0);
var expect_owner = macro_japan;
global.construct = 8282;
var expect_construction_type = global.construct;
var expected_array = [8,2,5];

// act
var constr = scr_new_construction(
	expect_mdu_count,
	expected_array,
	noone,
	expect_right,
	expect_top,
	expect_left,
	expect_bottom,
	expect_owner,
	0
);

// assert
assert_equal(expect_mdu_count, constr[? construction_required_mdu_count], "mdu count");
assert_equal(expect_mdu_count, constr[? construction_required_mdu_remaining], "mdu remaining");
assert_equal(expect_right, constr[? construction_bb_right], "right");
assert_equal(expect_top, constr[? construction_bb_top], "top");
assert_equal(expect_left, constr[? construction_bb_left], "left");
assert_equal(expect_bottom, constr[? construction_bb_bottom], "bottom");
assert_equal(expect_build_time, constr[? construction_time], "time");
assert_equal(expect_owner, constr[? construction_owner], "owner");
assert_arrays_are_equal(expected_array, constr[? construction_cells]);

assert_equal(0, constr[? construction_mdu_deliveries], "mdu deliveris");
assert_equal(noone, constr[? construction_prerequisite], "prerequisite");
assert_equal(noone, constr[? construction_astronaut], "");
assert_equal(0, constr[? construction_completion], "completion");
assert_equal(construction_state.not_ready, constr[? construction_build_state], "build_state");
assert_equal(expect_construction_type, constr[? construction_build_type], "build_type");
var list = constr[?construction_mdu_piles];
debug_type(list, macro_type_list);

// cleanup
expected_array = 0;
ds_map_replace(constr, construction_cells, 0);
ds_list_destroy(list);
ds_map_destroy(constr);

// return result
test_result();