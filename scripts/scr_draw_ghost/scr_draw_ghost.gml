// read from the build stack
var build_stack = global.build_stack;
var cell_count = ds_stack_size(build_stack);
var build_stack_copy = ds_stack_create();
ds_stack_copy(build_stack_copy, build_stack);

// loop vars
var action_is_drawable = false;
var sprite_for_ghost = noone;

draw_set_alpha(0.42);
draw_set_color(c_lime);
if(!global.can_pay_for_construction) draw_set_color(c_red);

for(var n = 0; n < cell_count; n++)
{
	// 1. read next cell from stack
	var next_build_cell = ds_stack_pop(build_stack_copy);
	var cell_i = next_build_cell[build_cell_i];
	var cell_j = next_build_cell[build_cell_j];
	var add_layer = next_build_cell[build_cell_layer];
	var object_to_add = next_build_cell[build_cell_object_to_add];
	var object_to_remove = next_build_cell[build_cell_object_to_remove];
	var map_buffer_action = next_build_cell[build_cell_map_buffer_action];
	var cost = next_build_cell[build_cell_cost];
	var sprite = next_build_cell[build_cell_object_sprite];
	var image = next_build_cell[build_cell_object_image];
	var angle = next_build_cell[build_cell_object_angle];
	
	if(map_buffer_action == map_buffer_action.nothing) continue;
	
	
	// determine if cell should be drawn	
	if(map_buffer_action != map_buffer_action.nothing && map_buffer_action != map_buffer_action.reserve)	// these actions will not be drawn
	{
		action_is_drawable = true;
		if(object_to_add != noone)
		{
			if(sprite > 0) sprite_for_ghost = sprite;
			else sprite_for_ghost = object_get_sprite(object_to_add);
		}
	}
	
	// perform draw
	if(action_is_drawable)
	{
		var target_x = scr_gi_to_rc(cell_i);
		var target_y = scr_gi_to_rc(cell_j);
		if(sprite_for_ghost >= 0)
		{
			draw_sprite_ext( sprite_for_ghost, image, target_x, target_y, 1, 1, angle, c_white, 0.42 );
		}
		draw_rectangle(target_x-16, target_y-16, target_x+15, target_y+15, false);
	}
}

// draw invalid tiles
var invalid_build_stack = global.invalid_build_stack;
var invalid_cell_count = ds_stack_size(invalid_build_stack) div 3;
draw_set_color(c_red);
repeat(invalid_cell_count)
{
	var sprite = ds_stack_pop(invalid_build_stack);
	var cell_j = ds_stack_pop(invalid_build_stack); // since j is pushed last, it needs to be popped first
	var cell_i = ds_stack_pop(invalid_build_stack);
	var target_x = scr_gi_to_rc(cell_i);
	var target_y = scr_gi_to_rc(cell_j);
	if(sprite > 0) draw_sprite_ext( sprite, 0, target_x, target_y, 1, 1, 0, c_white, 0.42 );
	draw_rectangle(target_x-16, target_y-16, target_x+15, target_y+15, false);
}

draw_set_alpha(1);
ds_stack_destroy(build_stack_copy);