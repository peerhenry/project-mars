test_init(test_assign_bed);

// arrange
var astro = instance_create_depth(32,32,0,obj_astronaut);
var bed = instance_create_depth(128,128,0,obj_bed);

// act
scr_assign(bed, astro);

// assert
assert_equal(bed, astro.assigned_object, "assigned_object");

// cleanup
instance_destroy(bed);
instance_destroy(astro);

test_result();