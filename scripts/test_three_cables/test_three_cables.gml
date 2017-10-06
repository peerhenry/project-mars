/// @description creates three cables and destroys middle one first
test_init(test_three_cables);

// Arrange
var cable1 = instance_create_depth(32*1, 32, 0, obj_cable);
var cable2 = instance_create_depth(32*2, 32, 0, obj_cable);
var cable3 = instance_create_depth(32*3, 32, 0, obj_cable);
//var solar_panel = instance_create_depth(32*4, 32, 0, obj_solar_panel);
var cables = [cable1, cable2, cable3];
var counter = 0;
repeat(3){
	var next_cable = cables[counter];
	with(next_cable){
		event_user(macro_event_finalize);
	}
	counter++;
}

var grid_count = 0;
with(obj_grid){
	grid_count++;
	debug_grid(id);
}
assert_equal(1, grid_count, "grid count");

instance_destroy(cables[1]);

grid_count = 0;
with(obj_grid){
	grid_count++;
	debug_grid(id);
}
if(grid_count != 2) pass = false;
assert_equal(2, grid_count, "grid count");

instance_destroy(cables[0]);
instance_destroy(cables[2]);

cables = 0;

grid_count = 0;
with(obj_grid){
	grid_count++;
}
assert_equal(0, grid_count, "grid count");

return test_result();