/// @arg tutorial
function scr_add_tutorial_objective(argument0, argument1, argument2) {
	var arg_text = argument1;
	var arg_description = argument2;
	with(argument0)
	{
		var objective = instance_create_depth(id, scr_condition_stage_complete, 0, obj_trigger_objective);
		objective.name = arg_text;
		objective.description = arg_description;
		objective.continue_after_trigger = false;
		ds_list_add(trigger_list, objective);
		return objective;
	}


}
