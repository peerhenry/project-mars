/// @arg script_container
/// @arg instance_to_remove
/// @arg object_to_add
var arg_container = argument0;
var arg_instance = argument1;
var arg_to_add = argument2;
var get_layer = script_container_resolve(arg_container, "get_layer_for");
var layer_for_thing = script_execute(get_layer, arg_to_add);
var sprite = object_get_sprite(arg_to_add);
if(sprite == spr_wall && global.draw_tall_walls) sprite = spr_wall_tall;
var new_ghost_cell = scr_create_ghost_cell(
	arg_instance.occ_i, arg_instance.occ_j,
	map_buffer_action.clear,
	layer_for_thing,
	arg_to_add,
	arg_instance.object_index,
	0,
	sprite,
	0,
	0,
	noone
);
var ghost = global.construction_ghost;
var ghost_stack = ghost[?macro_ghost_stack];
ds_stack_push(ghost_stack, new_ghost_cell);