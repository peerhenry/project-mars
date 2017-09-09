test_init(test_cables_create_finalize_destroy);

// Arrange
// required globabls for grid_part
var cable1 = instance_create_depth(32*1, 32, 0, obj_cable);
var cable2 = instance_create_depth(32*2, 32, 0, obj_cable);
var cable3 = instance_create_depth(32*3, 32, 0, obj_cable);
var cables = [cable1, cable2, cable3];
var counter = 0;
repeat(3){
	var next_cable = cables[counter];
	with(next_cable){
		event_user(macro_event_finalize);
	}
	counter++;
}

// Assert
var grid_count = 0;
with(obj_grid){
	grid_count++;
}
assert_equal(1, grid_count, "grid count");

counter = 0;
repeat(3){
	var next_cable = cables[counter];
	with(next_cable){
		instance_destroy();
	}
	counter++;
}
cables = 0;

grid_count = 0;
with(obj_grid){
	grid_count++;
}
assert_equal(0, grid_count, "grid count");

test_result();