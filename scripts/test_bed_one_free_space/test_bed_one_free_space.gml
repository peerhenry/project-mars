test_init(test_bed_one_free_space);

// arrange
scr_setup_room(1,1,1,3);
var xx = scr_gi_to_rc(1);
var yy = scr_gi_to_rc(2);
var bed = instance_create_depth(xx,yy,0,obj_bed);
var astro = instance_create_depth(0,0,0,obj_astronaut);
bed.occupant = astro;

// assert setup
assert_false(scr_navgrid_cell_is_free(1, 1), "1, 1 should be occupied by bed");
assert_false(scr_navgrid_cell_is_free(1, 2), "2, 1 should be occupied by bed");
assert_true(scr_navgrid_cell_is_free(1, 3), "3, 1 should be free");
assert_false(scr_navgrid_cell_is_free(0, 0), "0, 0 should be occupied by wall");
assert_false(scr_navgrid_cell_is_free(0, 1), "0, 1 should be occupied by wall");
assert_false(scr_navgrid_cell_is_free(1, 0), "1, 0 should be occupied by wall");

// act
uvoid(bed, "eject");

// assert
assert_equal(1, astro.occ_i, "astro.occ_i == 1");
assert_equal(3, astro.occ_j, "astro.occ_j == 3");

// cleanup
instance_destroy(bed);
instance_destroy(astro);
with(obj_base_tile) instance_destroy();
with(obj_wall) instance_destroy();
with(obj_room) instance_destroy();

test_result();