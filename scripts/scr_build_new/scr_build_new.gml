scr_trace("scr_build_new");

var can_construct = global.construction_is_valid && global.can_pay_for_construction;
if(!global.construction_is_valid) scr_alert_player("Invalid construction.");
if(!global.can_pay_for_construction) scr_alert_player("Insufficient building materials.");
if(!can_construct) return;

// read from the build stack
var build_stack = global.ghost_stack;
var cell_count = ds_stack_size(build_stack);
var new_construction;
var construction_cell_array;
var build_time = 2; // minimum construction time is 2 seconds
var build_time_per_cost = global.build_time_per_cost;
var prerequisite = noone;

var new_instances = ds_list_create();

var left = 0;
var right = 0;
var bottom = 0;
var top = 0;
var mdu_count = 0;

for(var n = 0; n < cell_count; n++)
{
	// 1. read next cell from stack
	var next_build_cell = ds_stack_pop(build_stack);
	var cell_i = next_build_cell[build_cell_i];
	var cell_j = next_build_cell[build_cell_j];
	var add_layer = next_build_cell[build_cell_layer];
	var object_to_add = next_build_cell[build_cell_object_to_add];
	var object_to_remove = next_build_cell[build_cell_object_to_remove];
	var map_buffer_action = next_build_cell[build_cell_map_buffer_action]; // obsolete
	var cost = next_build_cell[build_cell_cost];
	var sprite = next_build_cell[build_cell_object_sprite];
	var image = next_build_cell[build_cell_object_image];
	var angle = next_build_cell[build_cell_object_angle];
	var required_object = next_build_cell[build_cell_required_object];
	
	if(map_buffer_action == map_buffer_action.nothing) continue; // skip rest in loop scope this iteration
	
	// pay
	global.resource_amount_metal -= cost;
	build_time += cost*build_time_per_cost;
	
	// update bb
	var target_x = scr_gi_to_rc(cell_i);
	var target_y = scr_gi_to_rc(cell_j);
	var left_x = target_x - 16;
	var right_x = target_x + 15;
	var top_y = target_y - 16;
	var bottom_y = target_y + 15;
	if(left - right == 0)
	{
		left = left_x;
		right = right_x;
	}
	if(top - bottom == 0)
	{
		top = top_y;
		bottom = bottom_y;
	}
	if(left_x < left) left = left_x;
	if(right_x > right) right = right_x;
	if(top_y < top) top = top_y;
	if(bottom_y > bottom) bottom = bottom_y;
	
	// Create object
	var new_instance = noone;
	if(object_to_add != noone)
	{
		new_instance = instance_create_layer(target_x, target_y, add_layer, object_to_add);
		mdu_count += scr_get_mdu_count(object_to_add);
		with(new_instance)
		{
			ds_list_add(new_instances, new_instance);
			if(angle >= 0) image_angle = angle;
			if(sprite > 0) sprite_index = sprite;
			if(
				image > 0 
				&& new_instance.object_index != obj_cable 
				&& new_instance.object_index != obj_pipe)
			{
				image_index = image; // the check for cable or pipe is a dirty fix
			}
			
			depth = depth - 300; // under construction drawing has priority
			scr_post_creation_logic(global.construct, new_instance);	// only for suit closet
			under_construction = true;
			owner = macro_player;
		}
		
		if(required_object != noone)
		{
			var instance = instance_position(target_x, target_y, required_object);
			if(instance > 0) prerequisite = instance.construction_instance;
		}
	}
	
	// 3. create construction cell
	var new_construction_cell = scr_create_construction_cell(cell_i, cell_j, add_layer, map_buffer_action, new_instance, object_to_remove);
	var index = (cell_count - 1 - n);
	construction_cell_array[index] = new_construction_cell;
}

if(cell_count > 0)
{
	// 5. set construction props & add to construction queue
	var new_construction = ds_map_create();
	var initial_state = construction_state.not_ready;
	if(mdu_count == 0) initial_state = construction_state.ready;
	ds_map_add(new_construction, construction_completion, 0);
	ds_map_add(new_construction, construction_build_state, initial_state);
	ds_map_add(new_construction, construction_build_type, global.construct);
	ds_map_add(new_construction, construction_cells, construction_cell_array);
	ds_map_add(new_construction, construction_astronaut, noone);
	ds_map_add(new_construction, construction_time, build_time);
	ds_map_add(new_construction, construction_prerequisite, prerequisite);
	ds_map_add(new_construction, construction_bb_bottom, bottom);
	ds_map_add(new_construction, construction_bb_right, right);
	ds_map_add(new_construction, construction_bb_left, left);
	ds_map_add(new_construction, construction_bb_top, top);
	ds_map_add(new_construction, construction_required_mdu_count, mdu_count);
	ds_map_add(new_construction, construction_required_mdu_remaining, mdu_count);
	ds_map_add(new_construction, construction_mdu_deliveries, 0);
	ds_map_add(new_construction, construction_mdu_piles, ds_list_create());
	
	/*
	new_construction[construction_required_mdu_remaining] = 1;
	new_construction[construction_required_mdu_count] = 1;
	new_construction[construction_bb_top] = top;
	new_construction[construction_bb_left] = left;
	new_construction[construction_bb_right] = right;
	new_construction[construction_bb_bottom] = bottom;
	new_construction[construction_prerequisite] = prerequisite;
	new_construction[construction_time] = build_time;
	new_construction[construction_astronaut] = noone; // astronaut assigned to perform the construction
	new_construction[construction_cells] = construction_cell_array;
	new_construction[construction_build_type] = global.construct;
	new_construction[construction_build_state] = construction_state.not_ready; // not ready to be picked up before mdus are delivered
	new_construction[construction_completion] = 0; // start out at 0% complete
	*/
	ds_list_add(global.construction_queue, new_construction);
	scr_recalculate_paths();
}

// 6. set construction in all new instances
var last_instance = noone;
for(var n = 0; n < ds_list_size(new_instances); n++)
{
	var next_instance = ds_list_find_value(new_instances, n);
	next_instance.construction_instance = new_construction;
}
ds_list_destroy(new_instances);