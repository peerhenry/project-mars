function test_assign_bed_obstructed() {
	test_init(test_assign_bed_obstructed);

	// arrange
	var astro = instance_create_depth(128, 256, 0, obj_astronaut);
	var bed = instance_create_depth(64, 64, 0, obj_bed);
	scr_navgrid_occupy(bed.occ_i, bed.occ_j + 1);
	scr_navgrid_occupy(bed.occ_i + 1, bed.occ_j);
	scr_navgrid_occupy(bed.occ_i - 1, bed.occ_j);

	// act
	scr_assign(bed, astro);

	// assert
	assert_equal(bed, astro.assigned_object, "assigned_object");

	// cleanup
	instance_destroy(astro);
	scr_navgrid_clear_cell(bed.occ_i, bed.occ_j + 1);
	scr_navgrid_clear_cell(bed.occ_i + 1, bed.occ_j);
	scr_navgrid_clear_cell(bed.occ_i - 1, bed.occ_j);
	instance_destroy(bed);

	test_result();


}
