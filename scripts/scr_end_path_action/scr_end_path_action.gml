/// @descr performs and updates the current action
/// @arg astronaut
var arg_entity = argument0;
debug_instance_inherits(arg_entity, obj_movable);
scr_trace("Path end action!");

if( object_is_ancestor(arg_entity.object_index, obj_task_actor) ) scr_end_path_action_task_actor(arg_entity);
else if( scr_instance_inherits(arg_entity.object_index, obj_cart) ) scr_end_path_action_cart(arg_entity);

// todo: we want above to become obsolete and make way for OO design; command pattern

if(variable_instance_exists(arg_entity, "end_path_action") && arg_entity.end_path_action != noone)
{
	void_unwrap(arg_entity.end_path_action, "execute");
	destroy(arg_entity.end_path_action);
	arg_entity.end_path_action = noone;
}