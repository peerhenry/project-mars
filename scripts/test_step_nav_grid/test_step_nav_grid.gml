test_init(test_step_nav_grid);
//arrange
var astro = instance_create_depth(16,16,0,obj_astronaut);
var init_i;
var init_j;
var navgrid = scr_get_nav_grid();
with(astro)
{
	old_i = occ_i;
	old_j = occ_j;
	is_moving = true;
	x = 100;
	y = 100;
}
// act
scr_step_nav_grid(astro)
// assert
with(astro)
{
	assert_equal(scr_rc_to_gi(x), occ_i, "occ_i");
	assert_equal(scr_rc_to_gi(y), occ_j, "occ_j");
	var cell = mp_grid_get_cell(navgrid, occ_i, occ_j); // 0 is free, -1 is occupied or out of bounds
	assert_equal(-1, cell, "mp_grid new cell should be occupied");
	
	var prev_cell = mp_grid_get_cell(navgrid, old_i, old_j);
	assert_equal(0, prev_cell, "mp_grid old cell should be clear");
}

//cleanup
instance_destroy(astro);
test_result();