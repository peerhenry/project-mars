/// @descr cancels action, unassigns task and cancels walking
/// @arg entity
function scr_cancel_all(argument0) {
	var arg_entity = argument0;

	if( scr_instance_inherits(arg_entity, obj_task_actor) ) scr_cancel_all_task_actor(arg_entity);
	else if( scr_instance_inherits(arg_entity, obj_cart) ) scr_cancel_all_cart(arg_entity);


}
