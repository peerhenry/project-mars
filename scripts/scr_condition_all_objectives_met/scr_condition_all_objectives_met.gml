/// @arg trigger
function scr_condition_all_objectives_met(argument0) {
	var arg_trigger = argument0;

	var won = true;
	var objective_count = 0;

	if(!variable_instance_exists(arg_trigger, "level")) scr_warn("Trigger did not have required variable 'level'");

	with(arg_trigger.level)
	{
		for(var n = 0; n < ds_list_size(trigger_list); n++)
		{
			var next_trigger = trigger_list[|n];
			if(next_trigger.type == trigger_type.objective)
			{
				if(!next_trigger.accomplished) won = false;
				objective_count++;
			}
		}
	}

	return won && objective_count > 0;


}
