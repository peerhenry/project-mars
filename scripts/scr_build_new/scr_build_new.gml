var can_construct = global.construction_is_valid && global.can_pay_for_construction;
if(!global.construction_is_valid) scr_alert_player("Invalid construction.");
if(!global.can_pay_for_construction) scr_alert_player("Insufficient building materials.");
if(!can_construct) return;

// read from the build stack
var build_stack = global.build_stack;
var cell_count = ds_stack_size(build_stack);
var new_construction;
var construction_cell_array;
var build_time = 2; // minimum construction time is 2 seconds
var build_time_per_cost = global.build_time_per_cost;
var prerequisite = noone;

var new_instances = ds_list_create();

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
	
	// 2. create object instance
	var new_instance = noone;
	if(object_to_add != noone)
	{
		var target_x = scr_gi_to_rc(cell_i);
		var target_y = scr_gi_to_rc(cell_j);
		new_instance = instance_create_layer(target_x, target_y, add_layer, object_to_add);
		ds_list_add(new_instances, new_instance);
		with(new_instance)
		{
			if(angle >= 0) image_angle = angle;
			if(sprite > 0) sprite_index = sprite;
			if(
				image > 0 
				&& new_instance.object_index != obj_cable 
				&& new_instance.object_index != obj_pipe)
			{
				image_index = image; // the check for cable or pipe is a dirty fix
			}
			
			// depth = layer_get_depth(add_layer) - 1;
			// depth = -200; // under construction drawing has priority
			scr_post_creation_logic(global.construct, new_instance);	// for suit closet
			under_construction = true;
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
	new_construction[construction_prerequisite] = prerequisite;
	new_construction[construction_time] = build_time;
	new_construction[construction_astronaut] = noone; // astronaut assigned to perform the construction
	new_construction[construction_cells] = construction_cell_array;
	new_construction[construction_build_type] = global.construct;
	new_construction[construction_build_state] = construction_state.ready; // ready to be picked up
	new_construction[construction_completion] = 0; // start out at 0% complete
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