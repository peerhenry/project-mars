scr_trace("scr_build_new");
var can_construct = global.construction_is_valid && global.can_pay_for_construction;
var alert_player = script_container_resolve(global.script_container, "alert_player")
if(!global.construction_is_valid) script_execute(alert_player, "Invalid construction.");
if(!global.can_pay_for_construction) script_execute(alert_player, "Insufficient building materials.");
if(!can_construct) return;

// read from the ghost stack
var ghost_stack = global.ghost_stack;
var cell_count = ds_stack_size(ghost_stack);
var new_construction;
var construction_cell_array;
var prerequisite = noone;

var new_instances = ds_list_create();

var left = 0;
var right = 0;
var bottom = 0;
var top = 0;
var mdu_count = 0;
var total_required_metal = 0;
var total_required_carbon = 0;

for(var n = 0; n < cell_count; n++)
{
	// 1. read next cell from stack
	var next_build_cell = ds_stack_pop(ghost_stack);
	var cell_i = next_build_cell[build_cell_i];
	var cell_j = next_build_cell[build_cell_j];
	var add_layer = next_build_cell[build_cell_layer];
	var object_to_add = next_build_cell[build_cell_object_to_add];
	var object_to_remove = next_build_cell[build_cell_object_to_remove];
	var map_buffer_action = next_build_cell[build_cell_map_buffer_action]; // obsolete
	var metal_cost = next_build_cell[build_cell_cost];
	var sprite = next_build_cell[build_cell_object_sprite];
	var image = next_build_cell[build_cell_object_image];
	var angle = next_build_cell[build_cell_object_angle];
	var required_object = next_build_cell[build_cell_required_object];
	
	total_required_metal += metal_cost;
	if(map_buffer_action == map_buffer_action.nothing) continue; // skip rest in loop scope this iteration
	
	// pay
	global.resource_amount_metal -= metal_cost;
	
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
			if(angle >= 0) image_angle = angle;
			//if(sprite > 0) sprite_index = sprite;
			if(
				image > 0 
				&& new_instance.object_index != obj_cable 
				&& new_instance.object_index != obj_pipe)
			{
				image_index = image; // the check for cable or pipe is a dirty fix
			}
			
			depth = depth - 300; // under construction drawing has priority
			under_construction = true;
			owner = macro_player;
			scr_post_creation_logic(global.construct, new_instance);
		}
		
		if(required_object != noone)
		{
			var instance = instance_position(target_x, target_y, required_object);
			if(instance > 0) prerequisite = instance.construction_instance;
		}
	}
	
	if(instance_exists(new_instance)) // post creation could destroy the instance
	{
		ds_list_add(new_instances, new_instance);
		// create construction cell
		var new_construction_cell = scr_create_construction_cell(cell_i, cell_j, add_layer, map_buffer_action, new_instance, object_to_remove);
		var index = (cell_count - 1 - n);
		construction_cell_array[index] = new_construction_cell;
	}
}

// Create construction and register in queue
if(cell_count > 0 && ds_list_size(new_instances) > 0)
{
	var new_construction = scr_new_construction(mdu_count, construction_cell_array, prerequisite, right, top, left, bottom, macro_player, total_required_metal);
	scr_trace("new construction was created...");
	scr_register_new_construction(new_construction);
	scr_recalculate_paths();
	// Set construction in all new instances
	for(var n = 0; n < ds_list_size(new_instances); n++)
	{
		var next_instance = ds_list_find_value(new_instances, n);
		next_instance.construction_instance = new_construction;
	}
}

ds_list_destroy(new_instances);