/// @description creates three cables and destroys middle one first
test_notify(test_three_cables);

var pass = true;

// required globabls for grid_part
global.horizontal_cells = 1000;
global.vertical_cells = 1000;

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
if(grid_count != 1) pass = false;

show_debug_message("[TEST_THREE_CABLES] now destroying first instance...");
instance_destroy(cables[1]);
show_debug_message("[TEST_THREE_CABLES] first instance destroyed");

grid_count = 0;
with(obj_grid){
	grid_count++;
	debug_grid(id);
}
if(grid_count != 2) pass = false;

instance_destroy(cables[0]);
show_debug_message("[TEST_THREE_CABLES] second instance destroyed");
instance_destroy(cables[2]);
show_debug_message("[TEST_THREE_CABLES] third instance destroyed");

cables = 0;

grid_count = 0;
with(obj_grid){
	grid_count++;
}
if(grid_count != 0) pass = false;

return test_show_result(test_three_cables, pass);