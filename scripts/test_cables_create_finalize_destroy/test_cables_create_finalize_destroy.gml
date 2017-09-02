test_notify(test_cables_create_finalize_destroy);

var pass = true;

// required globabls for grid_part
global.horizontal_cells = 1000;
global.vertical_cells = 1000;

// Arrange
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

var grid_count = 0;
with(obj_grid){
	grid_count++;
}
if(grid_count != 1) pass = false;

// Cleanup
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
if(grid_count != 0) pass = false;

return test_show_result("test_cables_create_finalize_destroy", pass);