function test_points_are_within_range() {
	test_init(test_points_are_within_range);

	// 1. Within range

	// act
	var within_range = scr_points_are_within_range(0,0,10*32,10*32,15);

	// assert
	assert_true(within_range, "|{10,10}| < 15 == true");

	// 2. Outside range

	// act
	var within_range = scr_points_are_within_range(0,0,10*32,10*32,14);

	// assert
	assert_false(within_range, "|{10,10}| < 14 == false");

	test_result();


}
