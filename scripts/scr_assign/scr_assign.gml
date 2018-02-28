// includes navigation
/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;

var state = reach_state.unreachable;

if(!arg_assignable.is_assigned) state = scr_navigate_to_assignable(arg_assignable, arg_astronaut);

if(state != reach_state.unreachable)
{
	var get_layer_for = script_container_resolve(arg_astronaut.script_container, "get_layer_for");
	var logic_layer = script_execute(get_layer_for, obj_assign_icon);
	var icon = instance_create_layer(arg_assignable.x, arg_assignable.y-16, logic_layer, obj_assign_icon);
	arg_assignable.is_assigned = true;
	arg_assignable.icon = icon;
	arg_assignable.assigned_astronaut = arg_astronaut;
	arg_astronaut.assigned_object = arg_assignable;
	if(state == reach_state.adjacent)
	{
		// navigate to center of tile
		scr_end_path_action(arg_astronaut);
		scr_cancel_walking(arg_astronaut);
	}
	return true;
}

return false;